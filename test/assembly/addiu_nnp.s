#instruction:addiu
#exitcode:220
#input:
#output:
#author:os717
#message:Add negative to negative(im)

li $2, 0x80000000
addiu $2, 0xfedc
jr $0
