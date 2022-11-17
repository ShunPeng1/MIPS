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
 
 li $v0, 5
 syscall 
 add $t0, $0, $v0
 

 li $v0, 5
 syscall 
 add $t0, $t0, $v0
 
 add $a0, $0, $t0 
 
 li $v0, 1
 syscall

