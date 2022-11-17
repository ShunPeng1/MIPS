#################################################################
 # Description:
 # Simple example program
 #################################################################

 #################################################################
 # Main program
 #################################################################

 # Variables for main
 .data
 greeting: .asciiz "Input an integer: "

 # Main body
 .text
 main:
 li $v0, 4
 la $a0, greeting
 syscall

 li $v0, 5
 syscall 
 
 add $a0, $0, $v0
 addi $a0, $a0, 1
 
 li $v0, 1
 syscall

