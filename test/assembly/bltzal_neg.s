#instruction:bltzal
#exitcode:39
#input:
#output:
#author:os717
#message:bltzal taken (negative offset)

addi $3 $3 -8
addi $2 $2 12
here: addi $2 $2 1
addi $3 $3 1
bltzal $3 here
addi $3 $3 3
nop
add $2 $2 $31
jr $0
