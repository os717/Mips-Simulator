#instruction:multu
#exitcode:105
#input:
#output:
#author:os717
#message:Multiply negative by negative (testing LSW)

li $2, 0x80808085
li $3, 0x90909095
multu $2, $3
mflo $2
jr $0
