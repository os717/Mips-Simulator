#instruction:xori
#exitcode:70
#input:
#output:
#author:os717
#message:Xori positive(im)

li $2, 0x12345678
xori $2, $2, 0x3333
srl $2, $2, 12
jr $0
