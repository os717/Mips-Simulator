#instruction:bgezal
#exitcode:16
#input:
#output:
#author:os717
#message:bgezal not taken

addi $3 $3 -4
bgezal $3 here
addi $2 $2 12
addi $2 $2 -7
addi $2 $2 -1
nop
here: nop
add $2 $2 $31
jr $0
