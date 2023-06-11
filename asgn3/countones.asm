.data
	msg1: .string "Welcome to the CountOnes program.\n"
	msg2: .string "\nPlease enter a number: "
	msg3: .string "The number of bits set is: "
	msg4: .string "\nContinue (y/n)?: "
	msg5: .string "\nExiting"
	newline: .string "\n"
.text
la a0, msg1
li a7, 4
ecall
main:
	la a0, msg2
	li a7, 4
	ecall
	li a7, 5
	ecall
	mv t0, a0		# inputted value at reg t0	
	li t1, 0		# counter at reg t1
	la a0, newline
	li a7, 4
	ecall
	mv a5, t0
	loop:
		li t2, 0
		andi t2, a5, 1
		add t1, t1, t2
		srli a5, a5, 1
		bnez a5, loop
	endloop:
		la a0, msg3
		li a7, 4
		ecall
		mv a0, t1
		li a7, 1
		ecall
		la a0, msg4
		li a7, 4
		ecall
		li a7, 12
		ecall
		mv t0, a0
		li t1, 110
		bne t0, t1, main
		la a0, msg5
		li a7, 4
		ecall
		li a0, 0
		li a7, 10
		ecall
