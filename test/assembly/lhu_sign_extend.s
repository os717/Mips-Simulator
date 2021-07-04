#instruction:lhu
#exitcode:136
#input:
#output:
#author:os717
#message:sw -> lhu (from both halfwords) and check sign extension

li $3, 0x81f2c3dd
li $4, 0x20000000
sw $3, 0($4)
lhu $2, 0($4)
lhu $3, 2($4)
srl $2, $2, 3
srl $3, $3, 5
xor $2, $2, $3
srl $2, $2, 2
jr $0
