#instruction:lbu
#exitcode:232
#input:
#output:
#author:os717
#message:sw -> lbu (from all 4 bytes)

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
lbu $2, 3($4)
lbu $3, 2($4)
lbu $5, 1($4)
lbu $6, 0($4)
add $2, $2, $3
xor $2, $2, $5
xor $2, $2, $6
jr $0
