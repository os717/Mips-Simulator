#instruction:sb
#exitcode:120
#input:
#output:
#author:os717
#message:sb -> lb (from all 4 bytes)

li $3, 0x12345678
li $4, 0x20000000
sb $3, 0($4)
lb $2, 0($4)
lb $3, 1($4)
lb $5, 2($4)
lb $6, 3($4)
addu $2, $2, $3
xor $2, $2, $5
xor $2, $2, $6
jr $0
