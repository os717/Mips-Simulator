#instruction:bgtz
#exitcode:3
#input:
#output:
#author:os717
#message:bgtz not taken

bgtz $3 here
addi $2 $2 12
addi $2 $2 -7
addi $2 $2 -2
nop
here: nop
jr $0
