#instruction:bgtz
#exitcode:32
#input:
#output:
#author:os717
#message:bgtz taken (positive offset)

addi $3 $3 -3
here2: nop
bgtz $3 here
addi $2 $2 12
addi $2 $2 -7
addi $3 $3 1
j here2
here: nop
jr $0
