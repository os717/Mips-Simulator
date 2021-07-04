#instruction:add
#exitcode:246
#input:
#output:
#author:os717
#message:Add positive to positive (expect overflow)

li $2, 0x789abcde
li $3, 0x543210fe
add $2, $2, $3
jr $0
