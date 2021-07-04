#instruction:div
#exitcode:109
#input:
#output:
#author:os717
#message:Divide negative by positive (testing remainder)

li $2, 0x87654321
li $3, 0x1234
div $2, $3
mfhi $2
jr $0
