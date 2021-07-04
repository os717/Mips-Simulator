#instruction:addu
#exitcode:2
#input:
#output:
#author:os717
#message:Add negative to negative

li $2, 0x80000001
li $3, 0x80000001
addu $2, $2, $3
jr $0
