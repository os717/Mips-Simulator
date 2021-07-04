#instruction:mult
#exitcode:152
#input:
#output:
#author:os717
#message:Multiply negative by negative (testing MSW)

li $2, 0x87654321
li $3, 0x87654321
mult $2, $3
mfhi $2
jr $0
