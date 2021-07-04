#instruction:slti
#exitcode:1
#input:
#output:
#author:os717
#message:slti to 1 negative(im)

li $2, 0xFFDDEECC
slti $2, $2, 0xFFFF
jr $0
