#instruction:multu
#exitcode:255
#input:
#output:
#author:os717
#message:Multiply positive by negative (testing MSW)

li $2, 0x70707073
li $3, 0x90909093
multu $2, $3
mfhi $2
jr $0
