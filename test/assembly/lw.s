#instruction:lw
#exitcode:69
#input:
#output:
#author:os717
#message:sw -> lw

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
addi $2, $2, 5
lw $2, 0($4)
srl $2, $2, 12
jr $0
