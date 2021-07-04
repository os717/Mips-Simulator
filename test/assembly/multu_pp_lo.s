#instruction:multu
#exitcode:21
#input:
#output:
#author:os717
#message:Multiply positive by positive (testing LSW)

li $2, 0x70707073
li $3, 0x51515157
multu $2, $3
mflo $2
jr $0
