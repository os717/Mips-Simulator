#instruction:sub
#exitcode:246
#input:
#output:
#author:os717
#message:Subtract 0 and min (expect overflow)

li $2, 0x80000000
sub $2, $0, $2
jr $0
