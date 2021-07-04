#instruction:addu
#exitcode:8
#input:
#output:
#author:os717
#message:Add negative to negative

li $2, 0xF0000004
li $3, 0xF0000004
addu $2, $2, $3
jr $0
