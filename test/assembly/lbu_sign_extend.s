#instruction:lbu
#exitcode:50
#input:
#output:
#author:os717
#message:sw -> lbu (from all 4 bytes) and check sign extension

li $3, 0x81f2c3dd
li $4, 0x20000000
sw $3, 0($4)
lbu $2, 3($4)
lbu $3, 2($4)
lbu $5, 1($4)
lbu $6, 0($4)
sra $2, $2, 3
sra $3, $3, 2
sra $5, $5, 1
sra $6, $6, 2
add $2, $2, $3
xor $2, $2, $5
or $2, $2, $6
jr $0
