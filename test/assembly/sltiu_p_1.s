#instruction:sltiu
#exitcode:1
#input:
#output:
#author:os717
#message:sltiu to 1 positive(im)

li $2, 0x1234
sltiu $2, $2, 0xF018
jr $0
