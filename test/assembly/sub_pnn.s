#instruction:sub
#exitcode:246
#input:
#output:
#author:os717
#message:Subtract positive and negative (expect overflow)

li $2, 0x7fffffff
li $3, 0xfffffff6
sub $2, $2, $3
jr $0
