#instruction:addu
#exitcode:16
#input:
#output:
#author:os717
#message:Add positive to negative

li $2, 0xF8888
li $3, 0xFFFF8888
addu $2, $2, $3
jr $0
