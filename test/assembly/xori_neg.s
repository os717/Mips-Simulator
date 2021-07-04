#instruction:xori
#exitcode:71
#input:
#output:
#author:os717
#message:Xori negative(im)

li $2, 0x1234f678
xori $2, $2, 0x8765
srl $2, $2, 12
jr $0
