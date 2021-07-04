#instruction:lui
#exitcode:64
#input:
#output:
#author:os717
#message:lui and srl to check upper halfword

lui $2, 0x1234
srl $2, $2, 12
jr $0
