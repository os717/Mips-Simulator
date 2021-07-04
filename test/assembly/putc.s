#instruction:putc
#exitcode:55
#input:
#output:7
#author:os717
#message:Write '7' to $2 and putc

lui $3, 0x3000
ori $2, $2, 55
sw $2, 4($3)
jr $0
nop
