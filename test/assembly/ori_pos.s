#instruction:ori
#exitcode:71
#input:
#output:
#author:os717
#message:Ori positive(im)

lui $2, 0x1234
addi $2, $2, 0x5678
ori $2, $2, 0x2222
srl $2, $2, 12
jr $0
