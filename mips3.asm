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
h: .asciiz "\n Result an integer: h = \n"
g: .asciiz "\n Result an integer: g = \n"
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

# f = (a + b) ? (c ? d ? 2);
# 5 = (2 + 3) - (5 - 3 - 2);   
add $t0, $s0, $s1
sub $t1, $s2, $s3
addi $t1, $t1, -2
sub $t0, $t0, $t1 


li $v0 , 4
la $a0 , h 
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall

# g = (a + b) ? 3 ? (c + d) ? 2;
#-1 = (2 + 3) * 3 - (5 + 3) * 2;
add $t0, $s0, $s1
add $t1, $s2, $s3
mul $t0, $t0, 3
mul $t1, $t1, 2
sub $t0, $t0, $t1

li $v0 , 4
la $a0 , g 
syscall	
add $a0, $0, $t0 
li $v0, 1
syscall