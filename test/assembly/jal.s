#instruction:jal
#exitcode:18
#input:
#output:
#author:os717
#message:jal and check return address

ori $2 $2 5
jal here
nop
addi $2 $2 12
addi $2 $2 14
nop
addi $2 $2 6
here: addi $2 $2 1
nop
add $2 $2 $31
jr $0
