#instruction:addi
#exitcode:246
#input:
#output:
#author:os717
#message:Add negative to negative(im) (expect overflow)

li $2, 0x80000F0F
addi $2, 0x8000
jr $0
