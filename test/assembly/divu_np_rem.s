#instruction:divu
#exitcode:160
#input:
#output:
#author:os717
#message:Divide negative by positive (testing remainder)

li $2, 0xffffaaaa
li $3, 0x123456
divu $2, $3
mfhi $2
jr $0
