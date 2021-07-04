#instruction:ori
#exitcode:77
#input:
#output:
#author:os717
#message:Ori negative(im)

lui $2, 0x1234
addi $2, $2, 0x5678
ori $2, $2, 0x8765
srl $2, $2, 12
jr $0
