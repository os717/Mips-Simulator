#instruction:mult
#exitcode:65
#input:
#output:
#author:os717
#message:Multiply negative by negative (testing LSW)

li $2, 0x87654321
li $3, 0x87654321
mult $2, $3
mflo $2
jr $0
