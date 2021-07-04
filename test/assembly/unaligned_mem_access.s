#instruction:lw
#exitcode:245
#input:
#output:
#author:os717
#message:lw (unaligned)

li $3, 0x12345678
li $4, 0x20000000
sb $3, 0($4)
lw $2, 1($4)
nop
jr $0
