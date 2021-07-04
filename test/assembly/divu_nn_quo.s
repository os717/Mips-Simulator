#instruction:divu
#exitcode:1
#input:
#output:
#author:os717
#message:Divide negative by negative (testing quotient)

li $2, 0xffffaaaa
li $3, 0x87654321
divu $2, $3
mflo $2
jr $0
