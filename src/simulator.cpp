#include <fstream>
#include <iostream>
#include <stdint.h>
#include <cstdint>
#include <cstdlib>
#include <cstdio>
#include <functional>
#include <map>

// Blk

class Blk
{
private:
public:
  uint32_t start;
  uint32_t length;
  bool readable;
  bool writeable;
  uint32_t * data;

  Blk(uint32_t start, uint32_t length, bool readable = false, bool writeable = false);
  void write(uint32_t address, uint32_t writeData, bool forceWrite = false);
  uint32_t read(uint32_t address, bool forceRead = true);
};

Blk::Blk(uint32_t start, uint32_t length, bool readable, bool writeable): start(start), length(length), readable(readable), writeable(writeable) {
  data = new uint32_t[length>>2];
}

uint32_t Blk::read(uint32_t address, bool forceRead) {
  if(address >= length) {
    std::exit(-11);
  }  
  if(writeable && !forceRead){
    std::exit(-11);
  }
  return data[address>>2];
}

void Blk::write(uint32_t address, uint32_t writeData, bool forceWrite) {
  if(address >= length) {
    std::exit(-11);
  }
  if(readable && !forceWrite) {
    std::exit(-11);
  }
  data[address>>2] = writeData;
}

// Mem

class Mem
{
private:
  uint32_t length;
  std::map<uint32_t, Blk*, std::greater<uint32_t>> blks;
  Blk * getBlk(uint32_t start);
public:
  Mem(uint32_t length);
  void insert(Blk * segment);
  uint32_t read(uint32_t address, bool forceRead = false);
  void write(uint32_t address, uint32_t data, bool  forceWrite = false);
};

Mem::Mem(uint32_t length): length(length) {

}

Blk * Mem::getBlk(uint32_t address) {
  return blks.lower_bound(address)->second;
}

void Mem::insert(Blk * segment) {
  blks[segment->start] = segment;
}

uint32_t Mem::read(uint32_t address, bool forceRead) {
  if(address == 0x30000000){
    return (int32_t)std::getchar();
  }else{
    Blk * segment = getBlk(address);
    return segment->read(address - segment->start, forceRead);
  }
}

void Mem::write(uint32_t address, uint32_t writeData, bool forceWrite) {
  if(address == 0x30000004){
    std::putchar((writeData & 0x000000FF));
  }else{
    Blk * segment = getBlk(address);
    segment->write(address - segment->start, writeData, forceWrite);
  }
}

//CPU

class CPU
{
private:
  // Internal components of a cpu
  Mem * mem;
  uint32_t PC;
  uint32_t PCNext = 0;
  bool jumped = false;
  uint32_t PCMin;
  uint32_t PCMax;

  // Registers
  uint32_t data[32];
  uint32_t lo;
  uint32_t hi;
public:
  CPU(std::fstream& bin);
  bool clk();
  void execute(uint32_t bytecode);

  // Registers
  uint32_t read(uint32_t address);
  void write(uint32_t address, uint32_t data);
};

CPU::CPU(std::fstream& bin) {  
  mem = new Mem(0x100000000-1);
  mem->insert(new Blk(0x00000000, 0x4, true, true));
  mem->insert(new Blk(0x10000000, 0x1000000, true));
  mem->insert(new Blk(0x20000000, 0x4000000));

  uint32_t instructionNo = 0x10000000;
  PCMax = 0x10000000;
  while(!bin.eof()) {
    uint8_t bytes[4];
    bin.read((char*) &bytes, 4);
    uint32_t bytecode = ((uint32_t)bytes[0] << 24) | ((uint32_t)bytes[1] << 16) | ((uint32_t)bytes[2] << 8) | (uint32_t)bytes[3];
    mem->write(instructionNo, bytecode, true);
    instructionNo+=4;
    PCMax+=4;
  }
  PC = 0x10000000;
  PCMin = PC;

  // = Registers;
  std::fill(std::begin(data), std::begin(data)+32, 0);
  hi = 0;
  lo = 0;
}

bool CPU::clk() {
  if (PC % 4 != 0 || PC < PCMin || PC > PCMax){
    std::exit(-11);
  }
  uint32_t bytecode = mem->read(PC);
  PC = jumped ? PCNext : PC+4;
  jumped = false;
  uint32_t op = (bytecode >> 26) & 0x3F;
  uint32_t rs = (bytecode >> 21) & 0x1F;
  uint32_t rt = (bytecode >> 16) & 0x1F;
  uint32_t rd = (bytecode >> 11) & 0x1F;
  uint32_t shamt = (bytecode >> 6) & 0x1F;
  uint32_t immediate = bytecode & 0xFFFF;
  uint32_t fn = bytecode & 0x3F;
  uint32_t address = bytecode & 0x03FFFFFF;

  uint32_t RS = read(rs);
  uint32_t RT = read(rt);
  uint32_t signedImmediate = (int16_t)immediate;

  switch (op) {
    case 0x00: { // fn
      switch (fn) {
        case 0x00: { // SLL
          write(rd, RT << shamt);
          break;
        }
        case 0x02: { // SRL
          write(rd, RT >> shamt);
          break;
        }
        case 0x03: { // SRA
          write(rd, (RT & 0x80000000) ? ((RT >> shamt) | (0xFFFFFFFF << (32 - shamt))) : (RT >> shamt));
          break;
        }
        case 0x04: { // SLLV
          if(shamt){
            std::exit(-12);
          }
          write(rd, RT << RS);
          break;
        }
        case 0x06: { // SRLV
          if(shamt){
            std::exit(-12);
          }
          write(rd, RT >> RS);
          break;
        }
        case 0x07: { // SRAV
          if(shamt){
            std::exit(-12);
          } 
          write(rd, (RT & 0x80000000) ? ((RT >> RS) | (0xFFFFFFFF << (32 - RS))) : (RT >> RS));
          break;
        }
        case 0x08: { // JR 
          jumped = true;
          PCNext = RS;
          break;
        }
        case 0x09: { // JALR  
          if(shamt || rt){
            std::exit(-12);
          }
          jumped = true;
          PCNext = RS;
          write(rd, (PC + 4));  
          break;
        }
        case 0x10: { // MFHI  
          if(shamt || rt){
            std::exit(-12);
          }
          write(rd, hi);  
          break;
        }
        case 0x11: { // MTHI    
          if(shamt || rt || rd){
            std::exit(-12);
          }
          hi = RS;  
          break;
        }
        case 0x12: { // MFLO 
          if(shamt || rt){
            std::exit(-12);
          }
          write(rd, lo); 
          break;
        }
        case 0x13: { // MTLO  
          if(shamt || rt || rd){
            std::exit(-12);
          }
          lo = RS;  
          break;
        }
        case 0x18: { // MULT  
          if(shamt || rd){
            std::exit(-12);
          }
          uint64_t result = (int64_t)(int32_t)RS * (int64_t)(int32_t)RT;
          hi = (uint32_t)(result >> 32);
          lo = (uint32_t)(result & 0xFFFFFFFF);
          break;
        }
        case 0x19: { // MULTU  
          if(shamt || rd){
            std::exit(-12);
          }
          uint64_t result = (uint64_t)RS * (uint64_t)RT;
          hi = (uint32_t)(result >> 32);
          lo = (uint32_t)(result & 0xFFFFFFFF); 
          break;
        }
        case 0x1a: { // DIV  
          if(shamt || rd){
            std::exit(-12);
          }
          if(RT != 0){
            lo = (int32_t)RS / (int32_t)RT;
            hi = (int32_t)RS % (int32_t)RT;
          } 
          break;
        }
        case 0x1b: { // DIVU  
          if(shamt || rd){
            std::exit(-12);
          }
          if(RT != 0){
            lo = (uint32_t)RS / (uint32_t)RT;
            hi = (uint32_t)RS % (uint32_t)RT;
          }  
          break;
        }
        case 0x20: { // ADD  
          if(shamt){
            std::exit(-12);
          }
          if((RS >> 31 == RT >> 31) && (RS >> 31 != (RS + RT) >> 31)){
            std::exit(-10);
          }else{
            write(rd, RS + RT);
          }  
          break;
        }
        case 0x21: { // ADDU  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS + RT);  
          break;
        }
        case 0x22: { // SUB  
          if(shamt){
            std::exit(-12);
          }
          if((RS >> 31 != RT >> 31) && (RS >> 31 != (RS - RT) >> 31)){
            std::exit(-10);
          }else{
            write(rd, RS - RT);
          }  
          break;
        }
        case 0x23: { // SUBU  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS - RT);
          break;
        }
        case 0x24: { // AND  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS & RT);  
          break;
        }
        case 0x25: { // OR  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS | RT);
          break;
        }
        case 0x26: { // XOR  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS ^ RT);  
          break;
        }
        case 0x2a: { // SLT  
          if(shamt){
            std::exit(-12);
          }
          write(rd, (int32_t)RS < (int32_t)RT);
          break;
        }
        case 0x2b: { // SLTU  
          if(shamt){
            std::exit(-12);
          }
          write(rd, RS < RT);  
          break;
        }
        default: {
          std::exit(-12);
        }
      }
      break;
    }
    case 0x01: { // rt
      switch (rt) {
        case 0x0:{ // BLTZ
          if((int32_t)RS < 0) {
            jumped = true;
            PCNext = PC + (4 * signedImmediate);
          }   
          break;
        }
        case 0x1:{ // BGEZ
          if((int32_t)RS >= 0) {
            jumped = true;
            PCNext = PC + (4 * signedImmediate);
          }   
          break;    
        }
        case 0x10:{ // BLTZAL
          if((int32_t)RS < 0) {
            jumped = true;
            PCNext = PC + (4 * signedImmediate);
          }
          write(31, PC + 4);
          break;    
        }
        case 0x11:{ // BGEZAL
          if((int32_t)RS >= 0) {
            jumped = true;
            PCNext = PC + (4 * signedImmediate);
          }
          write(31, PC + 4);
          break; 
        }
        default:{
          std::exit(-12);
        }
      }
      break;
    }
    case 0x02: { // J
      jumped = true;
      PCNext = (PC & 0xF0000000) | (address << 2);
      break;
    }
    case 0x03: { // JAL
      if(shamt || rt || rd){
        std::exit(-12);
      }
      jumped = true;
      PCNext = (PC & 0xF0000000) | (address << 2);
      write(31, PC + 4);
      break;
    }
    case 0x04: { // BEQ
      if(RS == RT) {
        jumped = true;
        PCNext = PC + (4 * signedImmediate);
      }   
      break;
    }
    case 0x05: { // BNE
      if(RS != RT) {
        jumped = true;
        PCNext = PC + (4 * signedImmediate);
      }   
      break;
    }
    case 0x06: { // BLEZ
      if(rt){
        std::exit(-12);
      }
      if((int32_t)RS <= 0) {
        jumped = true;
        PCNext = PC + (4 * signedImmediate);
      }   
      break;
    }
    case 0x07: { // BGTZ
      if(rt){
        std::exit(-12);
      }
      if((int32_t)RS > 0) {
        jumped = true;
        PCNext = PC + (4 * signedImmediate);
      }   
      break;
    }
    case 0x08: { // ADDI
      if(((RS >> 31) == (signedImmediate >> 31)) && ((RS >> 31) != (RS + signedImmediate) >> 31)){
        std::exit(-10);
      }else{
        write(rt, RS + signedImmediate);
      }
      break;
    }
    case 0x09: { // ADDUI
      write(rt, RS + signedImmediate);
      break;
    }
    case 0x0a: { // SLTI
      write(rt, (int32_t)RS < (int32_t)signedImmediate);
      break;
    }
    case 0x0b: { // SLTIU
      write(rt, RS < immediate);
      break;
    }
    case 0x0c: { // ANDI
      write(rt, RS & immediate);
      break;
    }
    case 0x0d: { // ORI
      write(rt, RS | immediate);
      break;
    }
    case 0x0e: { // XORI
      write(rt, RS ^ immediate);
      break;
    }
    case 0x0f: { // LUI
      if(rs){
        std::exit(-12);
      }
      write(rt, immediate << 16);
      break;
    }
    case 0x20: { // LB
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      uint32_t word = mem->read((targetAddress / 4) * 4) & 
      (0xFF << ((3 - (targetAddress % 4)) * 8));
      word >>= ((3 - (targetAddress % 4)) * 8);
      word = (word & (1 << 7)) ? (word | 0xFFFFFF00) : word;      
      write(rt, word);
      break;
    }
    case 0x21: { // LH
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      if(targetAddress % 2){
        std::exit(-11);
      }
      uint32_t word = mem->read((targetAddress / 4) * 4) & 
      (0xFFFF << ((2 - (targetAddress % 4)) * 8));
      word >>= ((2 - (targetAddress % 4)) * 8);
      word = (word & (1 << 15)) ? (word | 0xFFFF0000) : word;      
      write(rt, word);
      break;
    }
    case 0x22: { // LWL
      uint32_t targetAddress = RS + (int32_t)(int16_t)immediate;
      uint32_t word = mem->read((targetAddress / 4) * 4);
      word <<= ((targetAddress % 4) * 8);
      uint32_t mask = 0xFFFFFFFF << ((targetAddress % 4) * 8);
      word &= mask;
      uint32_t val = RT;
      val = val & (~mask);
      val = val | word;
      write(rt, val);
      break;
    }
    case 0x23: { // LW
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      if(targetAddress % 4){
        std::exit(-11);
      }
      uint32_t word = mem->read(targetAddress);
      write(rt, word);
      break;
    }
    case 0x24: { // LBU
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      uint32_t word = mem->read((targetAddress / 4) * 4) & 
      (0xFF << ((3 - (targetAddress % 4)) * 8));      
      word >>= ((3 - (targetAddress % 4)) * 8);
      write(rt, word);
      break;
    }
    case 0x25: { // LHU
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      if(targetAddress % 2){
        std::exit(-11);
      }
      uint32_t word = mem->read((targetAddress / 4) * 4) & 
      (0xFFFF << ((2 - (targetAddress % 4)) * 8));      
      word >>= ((2 - (targetAddress % 4)) * 8);
      write(rt, word);
      break;
    }
    case 0x26: { // LWR
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      uint32_t word = mem->read((targetAddress / 4) * 4);
      word >>= ((3 - (targetAddress % 4)) * 8);
      uint32_t mask = 0xFFFFFFFF >> ((3 - (targetAddress % 4)) * 8);
      word &= mask;
      uint32_t val = RT;
      val = val & (~mask);
      val = val | word;
      write(rt, val);
      break;
    }
    case 0x28: { // SB
      int length = 1;
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      uint32_t wiperMask = (0xFF << ((4 - length - (targetAddress % 4)) * 8));
      uint32_t word_inMemory = mem->read((targetAddress / 4) * 4, true) & ~wiperMask;
      uint32_t word_toWrite = RT;
      if(length != 4){
        word_toWrite <<= ((4 - length - (targetAddress % 4)) * 8 );
        word_toWrite = word_toWrite & wiperMask;
        word_toWrite = word_toWrite | word_inMemory;
      }
      mem->write((targetAddress / 4) * 4, word_toWrite);
      break;
    }
    case 0x29: { // SH
      int length = 2;
      uint32_t targetAddress = RS + (int32_t)signedImmediate;
      if (targetAddress % length != 0){
        std::exit(-11);
      }
      uint32_t wiperMask = (0xFFFF << ((4 - length - (targetAddress % 4)) * 8));
      uint32_t word_inMemory = mem->read((targetAddress / 4) * 4, true) & ~wiperMask;
      uint32_t word_toWrite = RT;
      if(length != 4){
        word_toWrite <<= ((4 - length - (targetAddress % 4)) * 8 );
        word_toWrite = word_toWrite & wiperMask;
        word_toWrite = word_toWrite | word_inMemory;
      }
      mem->write((targetAddress / 4) * 4, word_toWrite);
      break;
    }
    case 0x2b: { // SW
      uint32_t targetAddress = RS + (int32_t)(int16_t)immediate;
      if (targetAddress % 4 != 0){
        std::exit(-11);
      }
      mem->write((targetAddress / 4) * 4, RT);
      break;
    }
    default: {
      std::exit(-12);
    }
  }
  if(PC == 0x0){
    std::exit(read(2) & 0x000000FF);
  }
  return(PC);
}

uint32_t CPU::read(uint32_t address) {
  if(address == 0) {
    return 0;
  }
  else{
    return this->data[address];
  }
}

void CPU::write(uint32_t address, uint32_t data) {
  if(address != 0) {
    this->data[address] = data;
  }
}

// main

int main(int argc, char *argv[]) {
  if(argc > 1) {
    std::fstream bin(argv[1], std::ios::in | std::ios::binary);
    CPU cpu(bin);
    uint64_t cycles = 0;
    while(true){
      cpu.clk();
      cycles++;
    }
  }
  return 0;
}