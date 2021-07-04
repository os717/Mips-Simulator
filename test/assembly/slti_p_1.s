#instruction:slti
#exitcode:1
#input:
#output:
#author:os717
#message:slti to 1 positive(im)

li $2, 0xFFFFFFFF
slti $2, $2, 0x4444
jr $0
