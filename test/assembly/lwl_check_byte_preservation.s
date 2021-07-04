#instruction:lwl
#exitcode:143
#input:
#output:
#author:os717
#message:sw -> lwl (from all 4 positions)

li $3, 0x12345678
li $4, 0x20000000
sw $3, 0($4)
li $3, 0x9abcdef0
sw $3, 4($4)
li $2, 0xffffffff
lwl $2, 1($4)
srl $2, $2, 4
jr $0
