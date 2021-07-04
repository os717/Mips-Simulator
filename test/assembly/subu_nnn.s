#instruction:subu
#exitcode:12
#input:
#output:
#author:os717
#message:Subtract negative and negative

li $2, 0xffff9393
li $3, 0xffffff87
subu $2, $2, $3
jr $0
