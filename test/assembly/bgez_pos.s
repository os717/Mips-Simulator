#instruction:bgez
#exitcode:27
#input:
#output:
#author:os717
#message:bgez taken (positive offset)

ori $3 $3 4
here3: nop
bgez $3 here
addi $2 $2 12
addi $2 $2 -7
addi $3 $3 -1
j here3
here: nop
and $3 $3 $0
bgez $3 here2
addi $2 $2 15
addi $2 $2 -12
addi $3 $3 -1
j here2
here2: nop
nop
jr $0
