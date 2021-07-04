#instruction:beq
#exitcode:2
#input:
#output:
#author:os717
#message:beq taken (positive offset)

ori $2 $2 0x1
ori $3 $3 0x1
beq $2 $3 here
addi $2 $2 1
addi $2 $2 1
here: nop
jr $0
