#instruction:divu
#exitcode:137
#input:
#output:
#author:os717
#message:Divide negative by negative (testing remainder)

li $2, 0xffffaaaa
li $3, 0x87654321
divu $2, $3
mfhi $2
jr $0
