#instruction:internal
#exitcode:7
#input:
#output:
#author:os717
#message:check if $0 hardwired to 0

addiu $0, $0, 7
addiu $2, $2, 7
addiu $0, $2, 7
and $2, $2, $0
addiu $2, $2, 7
jr $0
