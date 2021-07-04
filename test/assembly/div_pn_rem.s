#instruction:div
#exitcode:156
#input:
#output:
#author:os717
#message:Divide positive by negative (testing remainder)

li $2, 0x12345678
li $3, 0xfffff123
div $2, $3
mfhi $2
jr $0
