#instruction:blez
#exitcode:14
#input:
#output:
#author:os717
#message:blez taken (positive offset)

ori $2 $2 2
blez $3 here
here2: addi $2 $2 12
addi $2 $2 -7
addi $3 $3 -2
j here2
nop
here: nop
jr $0
