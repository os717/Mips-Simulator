#instruction:and
#exitcode:8
#input:
#output:
#author:os717
#message:And negative(im)

li $2, 0xfdecba98
andi $2, $2, 0x8765
srl $2, $2, 12
jr $0
