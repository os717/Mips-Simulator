#instruction:beq
#exitcode:37
#input:
#output:
#author:os717
#message:beq taken (negative offset)

ori $2 $2 0x1
ori $3 $3 0x5
nop
here: sll $2 $2 1
addi $3 $3 -1
slti $4 $3 0x1
beq $4 $0 here
addi $5 $5 1
nop
add $2 $2 $5
jr $0
