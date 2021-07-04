#instruction:subu
#exitcode:9
#input:
#output:
#author:os717
#message:Subtract positive and negative

li $2, 0x7fffffff
li $3, 0xfffffff6
subu $2, $2, $3
jr $0
