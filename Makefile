# Example usage:
# If you have testbench/my_test.c, you can execute the following to create a MIPS binary
# make testbench/my_test.mips.bin

BIN_DIR = bin
SRC_DIR = src
OBJ_DIR = obj

# For simulator
CC = g++
CPPFLAGS = -W -Wall -std=c++11
MYCPPFLAGS =

# For MIPS binaries. Turn on all warnings, enable all optimisations and link everything statically
MIPS_CC = mips-linux-gnu-gcc
MIPS_OBJCOPY = mips-linux-gnu-objcopy
MIPS_OBJDUMP = mips-linux-gnu-objdump
MIPS_CPPFLAGS = -W -Wall -O0 -fno-builtin -march=mips1 -mfp32
MIPS_LDFLAGS = -nostdlib -Wl,-melf32btsmip -march=mips1 -nostartfiles -mno-check-zero-division -Wl,--gpsize=0 -static -Wl,-Bstatic -Wl,--build-id=none

# Compile C file (.c) into MIPS object file (.o)
%.mips.o: %.c
	$(MIPS_CC) $(MIPS_CPPFLAGS) -c $< -o $@

# Assemble MIPS assembly file (.s) into MIPS object file (.o)
%.mips.o: %.s
	$(MIPS_CC) $(MIPS_CPPFLAGS) -c $< -o $@

# Link MIPS object file (.o), producing .elf, using memory locations specified in spec
%.mips.elf: %.mips.o
	$(MIPS_CC) $(MIPS_CPPFLAGS) $(MIPS_LDFLAGS) -T linker.ld $< -o $@

# Extract binary instructions only from linked object file (.elf)
%.mips.bin: %.mips.elf
	$(MIPS_OBJCOPY) -O binary --only-section=.text $< $@

# Disassemble linked object file (.elf), pulling out instructions as MIPS assembly file (.s)
%.mips.s : %.mips.elf
	$(MIPS_OBJDUMP) -j .text -D $< > $@

# implicit build for all simulator components
obj/%.o : src/%.cpp src/%.hpp
	mkdir -p obj
	$(CC) $(CPPFLAGS) $(MYCPPFLAGS) -c -g $< -o obj/$(basename $(notdir $<)).o

obj/simulator.o : src/simulator.cpp
	mkdir -p obj
	$(CC) $(CPPFLAGS) $(MYCPPFLAGS) -c -g src/simulator.cpp -o obj/simulator.o

# Build simulator - final command
bin/mips_simulator: $(patsubst src/%.cpp,obj/%.o,$(wildcard src/*.cpp))
	mkdir -p bin
	$(CC) $(CPPFLAGS) $(MYCPPFLAGS)  $(wildcard obj/*.o) -o bin/mips_simulator

# Dummy for build simulator to conform to spec
simulator: bin/mips_simulator

# Dummy for build testbench to conform to spec. Could do nothing
testbench:
	mkdir -p bin
	cp test/mips_testbench bin/

testbench_bin: $(patsubst test/s_files/gcc/%.s, test/s_files/gcc/%.mips.bin, $(wildcard test/s_files/gcc/*.s))
	mkdir -p test/bin_files/gcc
	mv test/s_files/gcc/*.mips.bin test/bin_files/gcc

testbench_cleanup:
	rm -r test/bin_files || true
