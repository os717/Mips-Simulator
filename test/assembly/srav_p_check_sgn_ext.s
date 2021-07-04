#instruction:srav
#exitcode:2
#input:
#output:
#author:os717
#message:srav positive number 4 units and check MSByte

li $2, 0x23456789
li $3, 0x4
srav $2, $2, $3
srl $2, $2, 24
jr $0
