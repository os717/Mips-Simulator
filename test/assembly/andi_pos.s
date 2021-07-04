#instruction:and
#exitcode:2
#input:
#output:
#author:os717
#message:And positive(im)

li $2, 0x23456789
andi $2, $2, 0x2222
srl $2, $2, 12
jr $0
