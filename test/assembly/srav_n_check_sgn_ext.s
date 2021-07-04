#instruction:srav
#exitcode:249
#input:
#output:
#author:os717
#message:srav negative number 4 units and check MSByte

li $2, 0x98765432
li $3, 0x4
srav $2, $2, $3
srl $2, $2, 24
jr $0
