.globl printInt
.globl printChar
.globl printString
.globl readInt
.globl readChar
.globl exitProgram
.globl readString
.data
RCR: .word 0xffff0000
RDR: .word 0xffff0004
TCR: .word 0xffff0008
TDR: .word 0xffff000c
.text
printInt:
lw t1, TCR
lw t0, (t1)
andi t0, t0, 1
beq t0, zero, printInt
lw t1, TDR
addi a0, a0, 48
sw a0, (t1) # write char
ret
printChar:
lw t1, TCR
lw t0, (t1)
andi t0, t0, 1
beq t0, zero, printChar
lw t1, TDR
sb a0, (t1) # write char
ret
printString:
addi sp, sp, -16
sw ra, 12(sp)
sw s0, 8(sp)
sw s1, 4(sp)
mv s0, a0
printStringLoop:
lb s1, (s0)
beq s1, zero, endPSloop
mv a0, s1
jal printChar
addi s0, s0, 1
b printStringLoop
endPSloop:
lw ra, 12(sp)
lw s0, 8(sp)
lw s1, 4(sp)
addi sp, sp, 16
ret
readInt:
jal readChar
li a1, 48
sub a0, a0, a1
ret
readChar:
lw t1, RCR # get RCR address
lw t0, (t1)# get RCR value
andi t0, t0, 1
beq t0, zero, readChar
lw t1, RDR # get RDR addr
lbu t2, (t1) # read char
mv a0, t2
ret
readString:
addi sp, sp, -16
sw ra, 12(sp)
sw s0, 8(sp)
mv s0, a0
stringloop:
jal readChar
li t0, ' '
beq a0, t0, endloop
sb a0, (s0)
addi s0, s0, 1
b stringloop
endloop:
sb zero, (s0)
lw ra, 12(sp)
lw s0, 8(sp)
addi sp, sp, 16
ret
exitProgram:
li a7, 10
ecall
ret
