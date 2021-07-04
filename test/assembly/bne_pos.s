#instruction:bne
#exitcode:12
#input:
#output:
#author:os717
#message:bne taken (positive offset)

ori $3 $3 3
here2: nop
bne $3 $0 here
addi $2 $2 12
addi $3 $3 -1
j here2
nop
here: nop
jr $0
