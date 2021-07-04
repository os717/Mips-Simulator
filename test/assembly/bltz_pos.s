#instruction:bltz
#exitcode:16
#input:
#output:
#author:os717
#message:bltz taken (positive offset)

addi $3 $3 -2
here2: nop
bltz $3 here
addi $2 $2 16
addi $2 $2 -7
addi $3 $3 -2
j here2
nop
here: nop
jr $0
