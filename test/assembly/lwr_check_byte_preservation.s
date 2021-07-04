#instruction:lwr
#exitcode:238
#input:
#output:
#author:os717
#message:sw -> lwr (from all 4 positions)

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
li $3, 0x9abcdef0
sw $3, 4($4)
addi $2, $2, 5
lwr $2, 1($4)
lwr $3, 2($4)
lwr $5, 3($4)
lwr $6, 4($4)
lwr $7, 5($4)
lwr $8, 6($4)
add $2, $2, $3
xor $2, $2, $5
add $2, $2, $6
xor $2, $2, $7
xor $2, $2, $8
jr $0
