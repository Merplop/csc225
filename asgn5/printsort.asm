# Assignment 5
# Miro Haapalainen, Braeden Alonge
# Prof. Planck

.globl main

.data
.align 0
array: .space 20
prompt0: .string "Enter word: "
prompt1: .string "Original word: "
prompt2: .string "Alphabetized word: "
prompt3: .string "\nExiting\n"
newline: .string "\n"

.text
main:

while:
	la a0, prompt0
	jal printstring
	la a0, array
	jal readstring
	la s4, array
	lb s3, 0(s4)
	beq s3, zero, exitprogram
	la a0, prompt1
	jal printstring
	la a0, array
	jal printstring
	la a0, newline
	jal printstring
	la a0, prompt2
	jal printstring
	sortstring:
    	li s0, 0 #len
    	for1:				# calculate length of string
    	li s1, 0
	li s2, 20
	li s3, 0
	loop1:
	beq s1, s2, endfor1
	lb s3, 0(s4)
	if1:
	bnez s3, endif1
	b endfor1
	endif1:
	addi s0, s0, 1
	addi s1, s1, 1
	addi s4, s4, 1 
	b loop1
	endfor1:
	for2:
	li s1, 32		# lower bound of ascii range
	li s2, 126		# upper bound of ascii range
#	la s4, array
#	lb s3, 0(s4)
    	loop2:
    	bgt s1, s2, endfor2
    	la s4, array		# realign s4 pointer to beginning of array each pass through outer nested loop
    	lb s3, 0(s4)		# realign character pointer s3 as well
    	for3:
    	li s7, 0		# for loop 3 counter
    	loop3:
    	beq s7, s0, endfor3	# have we reached end of the string?
    	lb s3, 0(s4)		# load char at current index into s3
    	if2:
    	bne s3, s1, endif2
    	mv a0, s3
    	jal printchar 
    	endif2:
    	addi s7, s7, 1
    	addi s4, s4, 1
    	b loop3
    	endfor3:
    	addi s1, s1, 1
    	b loop2
    	endfor2:
	endmain:
	la a0, newline
	jal printstring
	b while
exitprogram:
la a0, prompt3
jal printstring
jal exit0
	

