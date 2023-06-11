.globl printInt
.globl printChar
.globl printString
.globl readInt
.globl readChar
.globl exitProgram
.globl readString

.data
addr: .word 0
reg: .word 0

.text
printInt:
li a7, 1
ecall
ret
printChar:
li a7, 11
ecall
ret
printString:
li a7, 4
ecall
ret
readInt:
li a7, 5
ecall
ret
readChar:
li a7, 12
ecall
ret
readString:
sw ra, addr, t3
mv t1, a0 # move address of array into t1
sw t1, reg, t6
li t0, 0 # index counter
stringloop:
jal readChar
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

exitProgram:
li a7, 10
ecall
ret
