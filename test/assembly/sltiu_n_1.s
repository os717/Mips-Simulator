#instruction:sltiu
#exitcode:1
#input:
#output:
#author:os717
#message:sltiu to 1 negative(im)

li $2, 0x00007FFF
sltiu $2, $2, 0x8000
jr $0
