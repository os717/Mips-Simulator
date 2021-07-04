#instruction:divu
#exitcode:15
#input:
#output:
#author:os717
#message:Divide negative by positive (testing quotient)

li $2, 0xffffaaaa
li $3, 0x123456
divu $2, $3
mflo $2
jr $0
