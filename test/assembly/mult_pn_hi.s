#instruction:mult
#exitcode:255
#input:
#output:
#author:os717
#message:Multiply positive by negative (testing MSW)

li $2, 0x2
li $3, 0xffffffff
mult $2, $3
mfhi $2
jr $0
