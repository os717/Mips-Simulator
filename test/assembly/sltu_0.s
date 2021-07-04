#instruction:sltu
#exitcode:0
#input:
#output:
#author:os717
#message:sltu to 0

li $2, 0xFF000000
li $3, 0x12345
sltu $2, $2, $3
jr $0
