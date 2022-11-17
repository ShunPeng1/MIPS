.data
 myArray: .word 0,1,2,3,4,5,6,7,8,9 #declare an array of n elements
 newline : .asciiz "\n"
 n: .asciiz "\n Input number of element: "
 plus: .asciiz " + "
 out: .asciiz "\n Output :"
.text
main:

addi $s7 , $0 , 10 # number of element in array
addi $t1, $0, 0 #sum
addi $s6 , $0, 0 #index
forArray:
beq $s6, $s7 , exit

mul $t6, $s6, 4
lw $t0, myArray($t6)
add $t1, $t1, $t0  


li $v0 , 4
la $a0 , plus 
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall

addi $s6, $s6, 1
j forArray

exit:

li $v0 , 4
la $a0 , out 
syscall	
add $a0, $0, $t1 
li $v0, 1
syscall
  