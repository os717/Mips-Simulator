#instruction:mult
#exitcode:65
#input:
#output:
#author:os717
#message:Multiply positive by positive (testing LSW)

li $2, 0x07654321
li $3, 0x07654321
mult $2, $3
mflo $2
jr $0
