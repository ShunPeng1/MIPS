.data
 myArray: .word 100,101,102,103,104,105,106,107,108,109 #declare an array of n elements
 newline : .asciiz "\n"
 n: .asciiz "\n Input number of element: "
 plus: .asciiz " + "
 ask: .asciiz "\n input a natural number between 0 and 9 inclusive : "
 out: .asciiz "\n number of that index =  "
.text
main:

addi $s7 , $0 , 10 # number of element in array


li $v0 , 4
la $a0 , ask
syscall	
li $v0, 5
syscall 
add $t6, $0, $v0

mul $t6, $t6, 4
lw $t0, myArray($t6)

li $v0 , 4
la $a0 , out
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall
