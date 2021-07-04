#instruction:addiu
#exitcode:41
#input:
#output:
#author:os717
#message:Add negative to positive(im)

li $2, 0xffff0006
addiu $2, 0x23
jr $0
