#instruction:slt
#exitcode:0
#input:
#output:
#author:os717
#message:slt to 0

li $2, 0x12121212
li $3, 0x12121212
slt $2, $2, $3
jr $0
