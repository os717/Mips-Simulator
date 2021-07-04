#instruction:bltzal
#exitcode:11
#input:
#output:
#author:os717
#message:bltzal not taken

bltzal $3 here
addi $2 $2 12
addi $2 $2 -7
addi $2 $2 -2
nop
here: nop
add $2 $2 $31
jr $0
