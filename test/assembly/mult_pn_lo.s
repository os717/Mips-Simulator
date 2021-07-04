#instruction:mult
#exitcode:254
#input:
#output:
#author:os717
#message:Multiply positive by negative (testing LSW)

li $2, 0x2
li $3, 0xffffffff
mult $2, $3
mflo $2
jr $0
