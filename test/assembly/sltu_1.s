#instruction:sltu
#exitcode:1
#input:
#output:
#author:os717
#message:sltu to 1

li $2, 0x80000000
li $3, 0xffffffff
sltu $2, $2, $3
jr $0
