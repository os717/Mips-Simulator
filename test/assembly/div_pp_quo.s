#instruction:div
#exitcode:137
#input:
#output:
#author:os717
#message:Divide positive by positive (testing quotient)

li $2, 0x12345678
li $3, 0x2222
div $2, $3
mflo $2
jr $0
