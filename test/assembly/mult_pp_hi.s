#instruction:mult
#exitcode:185
#input:
#output:
#author:os717
#message:Multiply positive by positive (testing MSW)

li $2, 0x07654321
li $3, 0x07654321
mult $2, $3
mfhi $2
jr $0
