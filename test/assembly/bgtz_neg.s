#instruction:bgtz
#exitcode:24
#input:
#output:
#author:os717
#message:bgtz taken (negative offset)

ori $3 $3 8
addi $2 $2 12
here: addi $2 $2 1
addi $3 $3 -4
bgtz $3 here
addi $5 $5 5
add $2 $2 $5
nop
jr $0
