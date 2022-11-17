.data
 	myArray: .space 4000 #declare an array of n elements
 	newline : .asciiz "\n"
 	ask: .asciiz "\n Input 10 number : "
 	out: .asciiz "\n Sorted 10 number :"
	gap: .asciiz " "

.text
main:

addi $s7 , $0 , 10 # number of element in array


li $v0 , 4
la $a0 , ask
syscall	

addi $s6 , $0, 0 #index
forArray1:
beq $s6, $s7 , exit1
  
li $v0, 5
syscall 
add $t0, $0, $v0

mul $t6, $s6, 4
sw $t0, myArray($t6)

addi $s6, $s6, 1
j forArray1

exit1: 


#int i, key, j;
#    for (i = 1; i < n; i++)
#    {
#        key = arr[i];
#        j = i - 1;
# 
#        // Move elements of arr[0..i-1], 
#        // that are greater than key, to one
#        // position ahead of their
#        // current position
#        while (j >= 0 && arr[j] > key)
#        {
#            arr[j + 1] = arr[j];
#            j = j - 1;
#        }
#        arr[j + 1] = key;
#    }

addi $s6 , $0, 1  #int i = 1
forArray2:
beq $s6, $s7 , exit2 #for (i = 1; i < n; i++)


mul $t6, $s6, 4
lw $t1, myArray($t6) # t1 = key = arr[i];

addi $s5, $s6, -1  #j = i - 1;

forforArray2:
blt $s5, $0 , exitexit2 #while (j >= 0 && arr[j] > key)

mul $t5, $s5, 4
lw $t2, myArray($t5) # t2 = arr[j]
bge $t2, $t1 , exitexit2  

addi $t4, $s5, 1 #arr[j + 1]
mul $t4, $t4, 4
sw $t2, myArray($t4) #t2 = arr[j + 1] = arr[j];

addi $s5, $s5, -1 #j = j - 1;
j forforArray2

exitexit2:
addi $t4, $s5, 1 #arr[j + 1]
mul $t4, $t4, 4
sw $t1, myArray($t4)#arr[j + 1] = key;

addi $s6, $s6, 1
j forArray2

exit2: 


li $v0 , 4
la $a0 , out
syscall	

addi $s6 , $0, 0 #index
forArray3:
beq $s6, $s7 , exit3
  
mul $t6, $s6, 4
lw $t0, myArray($t6)
	
	
add $a0, $0, $t0 
li $v0, 1
syscall

li $v0 , 4
la $a0 , gap 
syscall	

addi $s6, $s6, 1
j forArray3

exit3: 
