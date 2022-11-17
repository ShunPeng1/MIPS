.data
	buffer:	.space 1000
	ask: .asciiz "\nInput string size : "
	ask1: .asciiz "\nInput string : "
	ans: .asciiz "\nReverse string is : "
	ans1: .asciiz "\nreverse string size : "

.text
	
	

li $v0 , 4
la $a0 , ask
syscall	

li $v0, 5
syscall 
add $s7, $0, $v0
addi $s7, $s7, 1
	
	
li $v0 , 4
la $a0 , ask1
syscall	
	
la $a0, buffer # Get address to store string
addi $a1, $0, 1000 # Input 10 characters into string (includes end of string)
li $v0, 8 # Get string mode
syscall
	
	
li $v0 , 4
la $a0 , ans
syscall	

addi $s6 , $0, 0 #index
forArrayInit: 
beq $s6, $s7 , exit
  
 sub $t1 , $s7 , $s6
 addi $t1 , $t1 , -1
  	

lb $t0, buffer($t1)

add $a0, $t0, $0 # Display character 
li $v0, 11 # print char
syscall



addi $s6, $s6, 1
j forArrayInit


exit: 

	
li $v0 , 4
la $a0 , ans1
syscall	
	
addi $s7, $s7, -1
add $a0, $0, $s7 # Assign an integer to a0
li $v0, 1 # Print integer a0
syscall
