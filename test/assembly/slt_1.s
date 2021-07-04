#instruction:slt
#exitcode:1
#input:
#output:
#author:os717
#message:slt to 1

li $2, 0xFF000000
li $3, 0x12345
slt $2, $2, $3
jr $0
