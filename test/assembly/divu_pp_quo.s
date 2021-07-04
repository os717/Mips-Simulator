#instruction:divu
#exitcode:146
#input:
#output:
#author:os717
#message:Divide positive by positive (testing quotient)

li $2, 0x12345678
li $3, 0x999
divu $2, $3
mflo $2
jr $0
