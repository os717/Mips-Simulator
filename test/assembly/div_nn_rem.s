#instruction:div
#exitcode:134
#input:
#output:
#author:os717
#message:Divide negative by negative (testing remainder)

li $2, 0x87654321
li $3, 0xffffaaab
div $2, $3
mfhi $2
jr $0
