#instruction:j
#exitcode:37
#input:
#output:
#author:os717
#message:j to end

ori $2 $2 10
lui $3 0x1000
ori $3 $3 0x0014
jr $3
addi $2 $2 13
addi $2 $2 14
nop
nop
nop
nop
jr $0
