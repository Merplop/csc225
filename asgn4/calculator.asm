# Miro Haapalainen, Braeden Alonge

.globl main

.data
msg1: .string "Welcome to the Calculator program.\n"
msg2: .string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift"
msg3: .string "\n\nNumber of operations performed: "
msg4: .string "\nEnter number: "
msg5: .string "Enter second number: "
msg6: .string "Select operation: "
msg7: .string "Result: "
msg8: .string "Invalid Operation"
msg9: .string "\nContinue (y/n)?: " 
msg10: .string "\nExiting"

.text
main:

la a0, msg1       #Welcome message
jal printstring
la a0, msg2        #Operation message
jal printstring
li s0, 0

loop:
	la a0, msg3   
	jal printstring    #print operations performed
	mv a0, s0          #move num to a0
	jal printint        #print num ops performed
	la a0, msg4
	jal printstring     
	jal readint        #ask for nuber, read number
	mv s5, a0
	la a0, msg5     #ask for seceond number, read number
	jal printstring
	jal readint
	mv s6, a0
	la a0, msg6     #ask for op number, read op number
	jal printstring
	jal readint
	mv s1, a0
	la a0, msg7
	jal printstring    #Print result message. Each label will move the input numbers into a0 and a1
	li s2, 1		#and call the corresponding subroutine based on the input op number
	bne s1, s2, lab1
	mv a0, s5
	mv a1, s6
	jal addnums
	b validinput       #each subroutine will jump to valid input to print the result
	lab1:
	li s2, 2
	bne s1, s2, lab2
	mv a0, s5
	mv a1, s6
	jal subnums
	b validinput
	lab2:
	li s2, 3
	bne s1, s2, lab3
	mv a0, s5
	mv a1, s6
	jal multnums
	b validinput
	lab3:
	li s2, 4
	bne s1, s2, lab4
	mv a0, s5
	mv a1, s6
	jal divnums
	b validinput
	lab4:
	li s2, 5
	bne s1, s2, lab5
	mv a0, s5
	mv a1, s6
	jal andnums
	b validinput
	lab5:
	li s2, 6
	bne s1, s2, lab6
	mv a0, s5
	mv a1, s6
	jal ornums
	b validinput
	lab6:
	li s2, 7
	bne s1, s2, lab7
	mv a0, s5
	mv a1, s6
	jal xornums
	b validinput
	lab7:
	li s2, 8
	bne s1, s2, lab8
	mv a0, s5
	mv a1, s6
	jal lshiftnums
	b validinput
	lab8:
	li s2, 9
	bne s1, s2, invalidinput
	mv a0, s5
	mv a1, s6
	jal rshiftnums
	b validinput
	invalidinput:
	la a0, msg8         #if invalid, print a seperate message instead of a result number
	jal printstring
	b prompt
	validinput:
	jal printint    #print the result
	addi s0, s0, 1   #increment the ops performed count
	prompt:
	la a0, msg9     #ask to continue and read char
	jal printstring 
	jal readchar
	mv s4, a0
	li s3, 110
	bne s4, s3, loop     #if input (s4) does not equal 'n' (s3, ascii value 110), jump to top of the loop
	la a0, msg3
	jal printstring     #print ops performed message
	mv a0, s0
	jal printint     #print ops performed number
	la a0, msg10
	jal printstring   #print Exit message
	jal exit0         #exit call
