#instruction:mtlo
#exitcode:15
#input:
#output:
#author:os717
#message:Perform multiplication and test mtlo

li $3, 0x0000FFFF
mtlo $3
mflo $2
srl $2, $2, 12
jr $0
