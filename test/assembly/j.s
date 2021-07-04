#instruction:j
#exitcode:25
#input:
#output:
#author:os717
#message:j to end

ori $2 $2 12
j here
addi $2 $2 13
addi $2 $2 14
nop
nop
here: nop
nop
jr $0
