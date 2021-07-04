#instruction:div
#exitcode:225
#input:
#output:
#author:os717
#message:Divide negative by positive (testing quotient)

li $2, 0x87654321
li $3, 0x1234
div $2, $3
mflo $2
jr $0
