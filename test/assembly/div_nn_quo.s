#instruction:div
#exitcode:205
#input:
#output:
#author:os717
#message:Divide negative by negative (testing quotient)

li $2, 0x87654321
li $3, 0xffffaaaa
div $2, $3
mflo $2
jr $0
