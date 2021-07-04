#instruction:internal
#exitcode:5
#input:
#output:
#author:os717
#message:test if hi/lo reg read/writeable

ori $2, $2, 10
mthi $2
addi $2, $2, 5
mtlo $2
mtlo $0
mtlo $2
mfhi $3
mflo $0
mflo $2
xor $2, $2, $3
jr $0
