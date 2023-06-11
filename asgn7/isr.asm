.global initInt
.global intHandler
.data
msg1: .string "\nInitializing Interrupts\n"
msg2: .string "\nKey Pressed is: "
RCR: .word 0xffff0000
RDR: .word 0xffff0004
countInt: .word 1
.text
initInt:
addi sp, sp, -16
sw ra, 12(sp)
la t0, intHandler
csrrw zero, utvec, t0
li t1, 256
csrrs zero, uie, t1
lw t2, RCR
li t3, 3
sw t3, (t2)
csrrsi zero, ustatus, 1
la a0, msg1
jal printString
lw ra, 12(sp)
addi sp, sp, 16
ret
intHandler:
addi sp, sp, -32
sw ra, 28(sp)
sw s1, 24(sp)
sw s2, 20(sp)
sw s3, 16(sp)
sw t0, 12(sp)
sw t1, 8(sp)
sw t2, 4(sp)
la a0, msg2
jal printString
lw s2, countInt
li s3, 5
lw t1, RDR
lb a0, (t1)
jal printChar
mv s1, a0
li a0, '\n'
jal printChar
beq s2, s3, resetCount
addi s2, s2, 1
sw s2, countInt, t3
mv a0, s1
lw ra, 28(sp)
lw s1, 24(sp)
lw s2, 20(sp)
lw s3, 16(sp)
lw t0, 12(sp)
lw t1, 8(sp)
lw t2, 4(sp)
addi sp, sp, 32
uret
resetCount:
li s2, 1
sw s2, countInt, t3
b main
