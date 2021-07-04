#instruction:bne
#exitcode:61
#input:
#output:
#author:os717
#message:bne taken (negative offset)

ori $2 $2 0x1
ori $3 $3 0x8
here: srl $3 $3 1
addi $2 $2 5
bne $3 $0 here
addi $5 $5 10
nop
add $2 $2 $5
jr $0
