.data
 myArray: .space 4000 #declare an array of n elements
 newline : .asciiz "\n"
 n: .asciiz "\n Input number of element: "
 out: .asciiz "\n Output :"
.text
main:

addi $s7 , $0 , 11 # number of element in array


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

div $t7 , $s7, 2
addi $s6 , $0, 0 #index

forArray2:
beq $s6, $t7 , exit2

  
mul $t6, $s6, 4
lw $t1, myArray($t6)  

sub $t5, $s7 , $s6
addi $t5, $t5 , -1
mul $t5, $t5, 4
lw $t2, myArray($t5)

sw $t1, myArray($t5)
sw $t2, myArray($t6)

addi $s6, $s6, 1
j forArray2


exit2: 

addi $s6 , $0, 0 #index
forArray3:
beq $s6, $s7 , exit3
  
mul $t6, $s6, 4
lw $t0, myArray($t6)
	
	
add $a0, $0, $t0 
li $v0, 1
syscall

li $v0 , 4
la $a0 , newline 
syscall	

addi $s6, $s6, 1
j forArray3

exit3: 