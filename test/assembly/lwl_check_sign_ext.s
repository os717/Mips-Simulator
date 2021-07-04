#instruction:lwl
#exitcode:229
#input:
#output:
#author:os717
#message:sw -> lwl (from all 4 positions)

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
li $3, 0x9abcdef0
sw $3, 4($4)
addiu $2, $2, 5
lwl $2, 1($4)
lwl $3, 2($4)
lwl $5, 3($4)
lwl $6, 4($4)
lwl $7, 5($4)
lwl $8, 6($4)
addu $2, $2, $3
xor $2, $2, $5
addu $2, $2, $6
xor $2, $2, $7
xor $2, $2, $8
jr $0
