#instruction:multu
#exitcode:225
#input:
#output:
#author:os717
#message:Multiply positive by positive (testing MSW)

li $2, 0x70707073
li $3, 0x51515157
multu $2, $3
mfhi $2
jr $0
