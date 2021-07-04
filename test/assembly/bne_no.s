#instruction:bne
#exitcode:14
#input:
#output:
#author:os717
#message:bne not taken

ori $2 $2 12
ori $3 $3 12
bne $2 $3 here
addi $2 $2 1
addi $2 $2 1
nop
here: nop
jr $0
