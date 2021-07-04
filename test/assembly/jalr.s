#instruction:jalr
#exitcode:50
#input:
#output:
#author:os717
#message:jalr and check return address

addi $2 $2 -3
lui $3 0x1000
ori $3 $3 0x0014
jalr $3
addi $2 $2 12
addi $2 $2 14
nop
addi $2 $2 6
addi $2 $2 1
nop
add $2 $2 $31
jr $0
