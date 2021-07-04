#instruction:add
#exitcode:246
#input:
#output:
#author:os717
#message:Add negative to negative (expect overflow)

li $2, 0x89123456
li $3, 0x89123456
add $2, $2, $3
jr $0
