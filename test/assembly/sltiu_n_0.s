#instruction:sltiu
#exitcode:0
#input:
#output:
#author:os717
#message:sltiu to 0 negative(im)

li $2, 0xFFFFF000
sltiu $2, $2, 0x8000
jr $0
