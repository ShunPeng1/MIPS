.data
 myArray: .word 1,2,3,4,5,6,7,8,9,10 #declare an array of n elements
 newline : .asciiz "\n"
 n: .asciiz "\n Input number of element: "
 plus: .asciiz " + "
 outt1: .asciiz "\n sum even t1 =  "
 outt2: .asciiz "\n sum odd t2 =  "
.text
main:

addi $s7 , $0 , 10 # number of element in array
addi $t1, $0, 0 #sum1
addi $t2, $0, 0 #sum2

addi $s6 , $0, 0 #index
forArray1:
beq $s6, $s7 , exit1

mul $t6, $s6, 4
lw $t0, myArray($t6)

add $t2, $t2, $t0 

li $v0 , 4
la $a0 , plus 
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall

addi $s6, $s6, 2
j forArray1

exit1:


li $v0 , 4
la $a0 , outt2
syscall	
add $a0, $0, $t2
li $v0, 1
syscall  
li $v0 , 4
la $a0 , newline
syscall	

addi $s6 , $0, 1 #index
addi $t7, $s7, 1
forArray2:
beq $s6, $t7 , exit2

mul $t6, $s6, 4
lw $t0, myArray($t6)

add $t1, $t1, $t0 

li $v0 , 4
la $a0 , plus 
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall

addi $s6, $s6, 2
j forArray2

exit2:


li $v0 , 4
la $a0 , newline
syscall	
li $v0 , 4
la $a0 , outt1
syscall	
add $a0, $0, $t1 
li $v0, 1
syscall

 