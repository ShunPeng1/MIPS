.data
	buffer:	.space 1000
	ask: .asciiz "\nInput a positive integer : "
	ask1: .asciiz "\nIt must be a positive integer. Please input again: " 
	ans: .asciiz "\nThe "
	ans1: .asciiz " first elements are : "
	gap: .asciiz " "

.text
	


li $v0 , 4
la $a0 , ask
syscall	

li $v0, 5
syscall 
add $s7, $0, $v0
	
checkInput:
	
slti $t1, $s7 , 1
beq $t1, 0, execute  
			
li $v0 , 4
la $a0 , ask1
syscall	
	
li $v0, 5
syscall 
add $s7, $0, $v0

j checkInput

execute:


li $v0 , 4
la $a0 , ans
syscall	

add $a0, $0, $s7 # Assign an integer to a0
li $v0, 1 # Print integer a0
syscall
	

li $v0 , 4
la $a0 , ans1
syscall	
		
add $a0, $0, $0 # Assign an integer to a0
li $v0, 1 # Print integer a0
syscall	
	
beq $s7, 1, exit  #Index 0
	
li $v0 , 4
la $a0 , gap
syscall	
	
addi $a0, $0, 1 # Assign an integer to a0
li $v0, 1 # Print integer a0
syscall

beq $s7, 1, exit  #Index 1

addi $t1, $0 , 0
addi $t2, $t2, 1
addi $s6 , $0, 2 #index
forArrayInit: 
beq $s6, $s7 , exit

li $v0 , 4
la $a0 , gap
syscall	
      

  	
 add $a0, $t1 , $t2
li $v0, 1 # Print integer a0
syscall

add $t3 , $t1, $t2
add $t1 , $0, $t2
add $t2 , $0, $t3

addi $s6, $s6, 1
j forArrayInit


exit: 
