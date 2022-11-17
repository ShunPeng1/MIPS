.data
 myArray: .space 4000 #declare an array of n elements
 newline : .asciiz "\n"
 n: .asciiz "\n Input number of element: "
 out: .asciiz "\n Output :"
.text
main:

addi $s7 , $0 , 10 # number of element in array


addi $t1, $0, 0 #sum
addi $s6 , $0, 0 #index
forArrayInit:
beq $s6, $s7 , exit
  
li $v0, 5
syscall 
add $t0, $0, $v0

mul $t6, $s6, 4
sw $t0, myArray($t6)

add $t1, $t1, $t0

addi $s6, $s6, 1
j forArrayInit


exit: 

add $a0, $0, $t1
li $v0, 1
syscall