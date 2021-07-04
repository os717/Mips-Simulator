#instruction:bgez
#exitcode:15
#input:
#output:
#author:os717
#message:bgez taken (negative offset)

ori $3 $3 8
addi $2 $2 12
here: addi $2 $2 1
addi $3 $3 -1
bgez $3 here
addi $3 $3 -3
nop
jr $0
