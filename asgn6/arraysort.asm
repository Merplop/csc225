#Miro Haapalainen
#Braeden Alonge
.globl swap 
.globl selectionSort
 
#void selectionSort(int arr[], int i, int n){
selectionSort:                                   #STACK ->   ra: 28;   i: 24;   n: 20;   j: 16;   min: 12;   array: 8;
# callee setup goes here
addi sp, sp, -32
sw ra, 28(sp) #save return address to the stack
sw a1, 24(sp)  # save a1 (i) into the stack
sw a2, 20(sp)  #save a2 (n) into the stack
sw a0, 8(sp)   #save a0 (address of array) into the stack
#    /* find the minimum element in the unsorted subarray `[i…n-1]`
#    // and swap it with `arr[i]`  */
#    int j;
li t0, 0
sw t0, 16(sp)   #save 0 to the stack to allocate room for j

#    int min = i;
sw a1, 12(sp)   #replicate a1 (i) into the stack 

#    for (j = i + 1; j < n; j++)    {

for:
#j = i + 1;
lw t0, 24(sp)    #load i into j
addi t0, t0, 1    #increment by 1
sw t0, 16(sp)   #update j

forloop:
# j < n  
lw t0, 16(sp)   #j
lw t1, 20(sp)   #n
bge t0, t1, endfor     #if j >= n, end the loop
slli t0, t0, 2  #multiply j by 4
#        /* if `arr[j]` is less, then it is the new minimum */
#        if (arr[j] < arr[min]) {
if1:
lw t2, 8(sp)      #load array address into t2
add t3, t0, t2 	   #add address of array to offset (j)
lw t4, 0(t3)       #load arr[j] into t4
lw t5, 12(sp)      #load min into t5
slli t5, t5, 2     #multiply min by 4
add t6, t5, t2     #add min offset to address of array
lw t6, 0(t6)      #load arr[min] into t6
bge t4, t6, endif1
#            min = j;    /* update the index of minimum element */
srai t0, t0, 2
sw t0, 12(sp)
slli t0, t0, 2

#        }
endif1:
srai t0, t0, 2    #divide j by 4
srai t5, t5, 2    #divide min by 4

#    }
addi t0, t0, 1
sw t0, 16(sp)   #increment j and save to stack
b forloop
endfor:
 
#    /* swap the minimum element in subarray `arr[i…n-1]` with `arr[i] */
#    swap(arr, min, i);
#caller setup and subroutine call for swap goes here.
lw a1, 12(sp)   #load arg1 with min
mv a0, t2       #set a0 to address of array
lw a2, 24(sp)   #load i into a2
addi sp, sp, 32  #restore sp
jal swap
#caller teardown for swap goes here (if needed).
addi sp, sp, -32   #unrestore sp
lw ra, 28(sp)      #restore ra
lw t0, 24(sp)  #t0 = i
addi t0, t0, 1  # i += 1
lw t1, 20(sp)  #t1 = n
#    if (i + 1 < n) {
if2:
bge t0, t1, endif2

#        selectionSort(arr, i + 1, n);
#caller setup and subroutine call for selectionSort goes here.
lw a0, 8(sp)   #load array address into a0
mv a1, t0      #set a1 to i + 1
lw a2, 20(sp)  #load n into a2

jal selectionSort
#caller teardown for selectionSort goes here (if needed).

lw ra, 28(sp)

#    }
endif2:

# callee teardown goes here
lw ra, 28(sp)
addi sp, sp, 32
ret
#}

 

#/* Utility function to swap values at two indices in an array*/
#void swap(int arr[], int i, int j) {
swap: 
# swap callee setup goes here

mv t1, a0  #t1 is address of the array
slli a1, a1, 2
slli a2, a2, 2
add t2, t1, a1   #t2 is the offset (index) of i
add t4, t1, a2   #t4 is the offset (index) of j
#    int temp = arr[i];
lw t3, 0(t2)     #t3 is 'temp' of arr[i]
#    arr[i] = arr[j];
lw t5, 0(t4)   #get cotents from t4(arr[j])
sw t5, 0(t2)   #save t5 (arr[j]) into t2(arr[i])
#    arr[j] = temp;
sw t3, 0(t4)   #save t3 (temp) to t4 (arr[j])

# swap callee teardown goes here
ret

#}
