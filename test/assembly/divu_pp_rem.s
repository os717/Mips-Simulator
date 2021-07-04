#instruction:divu
#exitcode:54
#input:
#output:
#author:os717
#message:Divide positive by positive (testing remainder)

li $2, 0x12345678
li $3, 0x999
divu $2, $3
mfhi $2
jr $0
