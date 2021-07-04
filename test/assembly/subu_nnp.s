#instruction:subu
#exitcode:61
#input:
#output:
#author:os717
#message:Subtract negative and negative

li $2, 0xffff9393
li $3, 0xff123456
subu $2, $2, $3
jr $0
