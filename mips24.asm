.data
	myArray: .space 4000 #declare an array of n elements
 	newline : .asciiz "\n"
 	ask: .asciiz "\n Input 10 number : "
	gap: .asciiz " "

	size: .word 10
	intArray: .word 1,2,3,4,5,6,7,8,9,10
	
	out: .asciiz "Sum : "
.text
main:
la $s1, intArray
la $s0, size
lw $s0, 0($s0)
	
li $v0, 4
la $a0, out
syscall

#add para
move $a0, $s0
move $a1, $s1

#recursion	
jal sum
move $s2, $v0
	
li $v0, 1
move $a0, $s2
syscall
	
li $v0, 10
syscall
	
sum:
#save
addi $sp, $sp, -12
sw $a0, 0($sp)
sw $a1, 4($sp)
sw $ra, 8($sp)
	
#if k!=1
bne $a0, 1, L1 
	
#return
lw $t0, 0($a1)
add $v0, $0, $t0 
	
addi $sp, $sp, 12
jr $ra

L1:	
#add para
addi $a0, $a0, -1
addi $a1, $a1, 4

#recursion
jal sum
	
#load	
lw $a0, 0($sp)
lw $a1, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12
	
#return 
lw $t0, 0($a1)
add $v0, $v0, $t0 
	
jr $ra
