.globl printint
.globl printchar
.globl printstring
.globl readint
.globl readchar
.globl exit0
.globl readstring

.data
addr: .word 0
reg: .word 0

.text
printint:
li a7, 1
ecall
ret
printchar:
li a7, 11
ecall
ret
printstring:
li a7, 4
ecall
ret
readint:
li a7, 5
ecall
ret
readchar:
li a7, 12
ecall
ret
readstring:
sw ra, addr, t3
mv t1, a0 # move address of array into t1
sw t1, reg, t6
li t0, 0 # index counter
stringloop:
jal readchar
lw t1, reg
mv t2, a0
li t4, 0x0A
beq t2, t4, endloop
li t4, 0x0D
beq t2, t4, endloop
sb t2, 0(t1)
addi t1, t1, 1
sw t1, reg, t6
b stringloop
endloop:
sb zero, 0(t1)
lw t1, reg
lw ra, addr
ret

exit0:
li a7, 10
ecall
ret
