#instruction:addu
#exitcode:208
#input:
#output:
#author:os717
#message:Add negative to negative

li $2, 0x50505050
li $3, 0x80808080
addu $2, $2, $3
jr $0
