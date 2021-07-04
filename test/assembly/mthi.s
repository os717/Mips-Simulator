#instruction:mthi
#exitcode:15
#input:
#output:
#author:os717
#message:Perform multiplication and test mthi

li $3, 0x0000FFFF
mthi $3
mfhi $2
srl $2, $2, 12
jr $0
