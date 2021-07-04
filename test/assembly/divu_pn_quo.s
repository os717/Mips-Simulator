#instruction:divu
#exitcode:1
#input:
#output:
#author:os717
#message:Divide positive by negative (testing quotient)

li $2, 0x12345678
li $3, 0x80000000
divu $2, $3
addi $2, $2, 0x5
mflo $2
addi $2, $2, 0x1
jr $0
