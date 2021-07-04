#instruction:mflo
#exitcode:64
#input:
#output:
#author:os717
#message:Perform multiplication and test mflo

li $2, 0x12345678
li $3, 0x12345678
multu $2, $3
mflo $2
jr $0
