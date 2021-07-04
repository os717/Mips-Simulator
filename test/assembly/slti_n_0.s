#instruction:slti
#exitcode:0
#input:
#output:
#author:os717
#message:slti to 0 negative(im)

li $2, 0x1234
slti $2, $2, 0xFFFF
jr $0
