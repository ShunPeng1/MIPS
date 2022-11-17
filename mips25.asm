.data
	myArray: .space 4000 #declare an array of n elements
 	newline : .asciiz "\n"
 	ask: .asciiz "\n Input 10 number : "
	gap: .asciiz " "

	size: .word 10
	intArray: .word 1,2,4,3,6,5,12,10,8,9
	
	out: .asciiz "Max of array is: "
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
jal max

move $s2, $v0
	
li $v0, 1
move $a0, $s2
syscall
	
#terminate
li $v0, 10
syscall
	
max:
#save a1
addi $sp, $sp, -12
sw $a0, 0($sp)
sw $a1, 4($sp)
sw $ra, 8($sp)
	
#if k!=1
bne $a0, 1, L1 
	
#base case
lw $t0, 0($a1)
add $v0, $0, $t0 
	
#return
addi $sp, $sp, 12
jr $ra
L1:	
#add para
addi $a0, $a0, -1
addi $a1, $a1, 4

#recursion
jal max
	
#restore variables
lw $a0, 0($sp)
lw $a1, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12
	
lw $t0, 0($a1) 
#if v0 < t0
slt $t1, $v0, $t0 
beq $t1, $0, if_ex
move $v0, $t0
if_ex:
	
#return 
jr $ra

