#instruction:subu
#exitcode:113
#input:
#output:
#author:os717
#message:Subtract negative and positive

li $2, 0xf0f0f0f0
li $3, 0x7f7f7f7f
subu $2, $2, $3
jr $0
