#instruction:bgez
#exitcode:251
#input:
#output:
#author:os717
#message:bgez not taken

addi $3 $3 -4
bgez $3 here
addi $2 $2 3
addi $2 $2 -7
addi $2 $2 -1
nop
here: nop
jr $0
