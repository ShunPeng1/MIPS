#################################################################
 # Description:
 # Simple example program
 #################################################################

 #################################################################
 # Main program
 #################################################################

 # Variables for main
.data
a: .asciiz "\n Input an integer: a = \n"
b: .asciiz "\n Input an integer: b = \n"
c: .asciiz "\n Input an integer: c = \n"
d: .asciiz "\n Input an integer: d = \n"
e: .asciiz "\n Input an integer: e = \n"
re: .asciiz "\n Result an reverse input: h = \n"
comma: .asciiz ", "
# Main body
.text
main:

li $v0 , 4
la $a0 , a 
syscall	
li $v0, 5
syscall 
add $s0, $0, $v0
 
li $v0 , 4
la $a0 , b 
syscall	
li $v0, 5
syscall 
add $s1, $0, $v0

li $v0 , 4
la $a0 , c 
syscall	
li $v0, 5
syscall 
add $s2, $0, $v0

li $v0 , 4
la $a0 , d 
syscall	
li $v0, 5
syscall 
add $s3, $0, $v0

li $v0 , 4
la $a0 , e 
syscall	
li $v0, 5
syscall 
add $s4, $0, $v0

li $v0 , 4
la $a0 , re 
syscall


add $a0, $0, $s4 
li $v0, 1
syscall
li $v0 , 4
la $a0 , comma 
syscall	


add $a0, $0, $s3 
li $v0, 1
syscall
li $v0 , 4
la $a0 , comma 
syscall	


add $a0, $0, $s2 
li $v0, 1
syscall
li $v0 , 4
la $a0 , comma 
syscall	


add $a0, $0, $s1 
li $v0, 1
syscall
li $v0 , 4
la $a0 , comma 
syscall	


add $a0, $0, $s0 
li $v0, 1
syscall
