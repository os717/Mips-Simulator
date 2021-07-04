#instruction:blez
#exitcode:3
#input:
#output:
#author:os717
#message:blez not taken

ori $3 $3 4
blez $3 here
addi $2 $2 12
addi $2 $2 -7
addi $2 $2 -2
nop
here: nop
jr $0
