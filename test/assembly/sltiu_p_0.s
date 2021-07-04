#instruction:sltiu
#exitcode:0
#input:
#output:
#author:os717
#message:sltiu to 0 positive(im)

li $2, 0x87654321
sltiu $2, $2, 0x2018
jr $0
