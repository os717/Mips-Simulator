#instruction:lwr
#exitcode:18
#input:
#output:
#author:os717
#message:sw -> lwr

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
lwr $2, 0($4)
jr $0
