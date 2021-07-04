#instruction:mfhi
#exitcode:220
#input:
#output:
#author:os717
#message:Perform multiplication and test mfhi

li $2, 0x12345678
li $3, 0x12345678
multu $2, $3
mfhi $2
jr $0
