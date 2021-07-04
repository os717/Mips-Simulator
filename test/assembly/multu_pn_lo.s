#instruction:multu
#exitcode:16
#input:
#output:
#author:os717
#message:Multiply positive by negative (testing LSW)

li $2, 0x70707074
li $3, 0x90909094
multu $2, $3
mflo $2
jr $0
