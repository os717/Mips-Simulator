#instruction:addi
#exitcode:246
#input:
#output:
#author:os717
#message:Add positive to positive(im) (expect overflow)

li $2, 0x7FFFFFFF
addi $2, 0x1
jr $0
