#instruction:bgezal
#exitcode:8
#input:
#output:
#author:os717
#message:bgezal taken (positive offset)

bgezal $3 here
here2: nop
addi $2 $2 12
addi $2 $2 -7
addi $3 $3 -1
j here2
here: nop
nop
add $2 $2 $31
jr $0
