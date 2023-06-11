# Miro Haapalainen
# Braeden Alonge

.globl swap

.globl selectionSort

.globl printArray



#struct def'n for reference

#struct studentNode {

#   char name[6];

#   int studentid;

#   int coursenum;

#};



#000000 00 00

#/* Recursive function to perform selection sort on subarray `arr[i…n-1]` */

#void selectionSort(studentNode arr[], int i, int n) {

selectionSort:
#    /* find the minimum element in the unsorted subarray `[i…n-1]`
#    // and swap it with `arr[i]`  */
#callee setup goes here
addi sp, sp, -32
sw ra, 28(sp)
sw s0, 24(sp) # store s0 on stack
sw s1, 20(sp) # s1 --> stack
sw s2, 16(sp) # etc etc
sw s3, 12(sp)
sw s4, 8(sp)
mv s0, a0 # s0 = address of array
mv s1, a1 # s1 = i
mv s2, a2 # s2 = n
xor s3, s3, s3  # s3 = j = 0
mv s4, s1	# s4 = min = i
#    for (j = i + 1; j < n; j++)    {
for1:
addi s3, s1, 1
forloop1:
bge s3, s2, endfor1     #if j >= n, end the loop
#        /* if `arr[j]` is less, then it is the new minimum */

#        if (arr[j].studentid < arr[min].studentid) {
if1:
slli t1, s3, 4 	# convert index j to offset
add t1, s0, t1  # add to base address of array
lw t2, 8(t1)	# index to array offset
slli t3, s4, 4  # convert min index to offset
add t3, s0, t3 	# add to base address of array
lw t4, 8(t3)    # index to array offset
bge t2, t4, endif1	# is arr[j] < arr[]min?
mv s4, s3	# if yes, min = j
#        }
endif1:
addi s3, s3, 1 # j++
b forloop1

endfor1:
#    }
#    /* swap the minimum element in subarray `arr[i…n-1]` with `arr[i] */
#caller setup goes here
mv a0, s0	# a0 = array address
mv a1, s4	# a1 = i
mv a2, s1	# a2 = n
jal swap
#    swap(arr, min, i);
#caller teardown goes here (if needed)
#    if (i + 1 < n) {
if2:
addi t5, s1, 1 # t4 = i+1
bge t5, s2, endif2	# is i+1 < n?
#caller setup goes here
mv a0, s0 	# a0 = address of array
mv a1, t5	# a1 = i+1
mv a2, s2	# a2 = n
jal selectionSort # recursion
#        selectionSort(arr, i + 1, n);

#caller teardown goes here (if needed)
#    }
endif2:
#callee teardown goes here (if needed)
lw ra, 28(sp)
lw s0, 24(sp) # restore s0
lw s1, 20(sp) # restore s1 etc etc
lw s2, 16(sp) # you get it
lw s3, 12(sp)
lw s4, 8(sp)
addi sp, sp, 32
ret
#}

 

#/* Function to print `n` elements of array `arr` */ 

#void printArray(studentNode arr[], int n) {

printArray:
#callee setup goes here
addi sp, sp, -32
sw ra, 28(sp)
sw s0, 24(sp) # store s0 on stack
sw s1, 20(sp) # s1 --> stack
sw s2, 16(sp) # etc etc
mv s0, a0
mv s1, a1
#    int i;
#    for (i = 0; i < n; i++) {
for2:
xor s2, s2, s2
forloop2:
bge s2, s1, endfor2
#use ecalls to implement printf
#        printf("%d ", arr[i].studentid);
slli t0, s2, 4
add t1, t0, s0
lw a0, 8(t1)
li a7, 1
ecall
li a0, 32
li a7, 11
ecall
#        printf("%s ", arr[i].name);
mv a0, t1
li a7, 4
ecall

li a0, 32
li a7, 11
ecall

#        printf("%d\n", arr[i].coursenum);
lw a0, 12(t1)
li a7, 1
ecall
li a0, 10
li a7, 11
ecall

addi s2, s2, 1
b forloop2
#    }
endfor2:
#caller teardown goes here
lw ra, 28(sp)	#restore stack-saved values
lw s0, 24(sp)
lw s1, 20(sp)
lw s2, 16(sp)
addi sp, sp, 32
ret
#}

#/* Utility function to swap values at two indices in an array*/

#void swap(studentNode arr[], int i, int j) {

swap:
#caller setup goes here
slli t0, a1, 4 	# convert i to memory offset
slli t1, a2, 4  # convert j to memory offset
add t0, a0, t0 	# add i offset to base address
add t1, a0, t1  # add j offset to base address
#    studentNode temp = arr[i];
lw t2, (t0)
lw t3, 4(t0)
lw t4, 8(t0)
lw t5, 12(t0)
#    arr[i] = arr[j];
lw t6, (t1)
lw a4, 4(t1)
lw a5, 8(t1)
lw a6, 12(t1)
sw t6, (t0)
sw a4, 4(t0)
sw a5, 8(t0)
sw a6, 12(t0)
#    arr[j] = temp;
sw t2, (t1)
sw t3, 4(t1)
sw t4, 8(t1)
sw t5, 12(t1)
#caller teardown goes here
ret




#}

