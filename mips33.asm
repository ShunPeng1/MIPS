# Sample MIPS program that writes to a new file.
# by Kenneth Vollmar and Pete Sanderson
.data
fout: .asciiz "testout.txt" # filename for output
msg1: .asciiz "Before read: "
msg2: .asciiz "After read: "
buffer_save: .asciiz "          _      ___     ____    _ _     ___      __     ____  \n         / |    |_  )   |__ /   | | |   | __|    / /    |__  | \n         | |     / /     |_ \\   |_  _|  |__ \\   / _ \\     / /  \n         |_|    /___|   |___/     |_|   |___/   \\___/    /_/   \n                                                               \n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |_______|_______|_______|_______|_______|_______|_______|\n                                                               \n                                                               \n"
buffer_write: .asciiz  "          _      ___     ____    _ _     ___      __     ____  \n         / |    |_  )   |__ /   | | |   | __|    / /    |__  | \n         | |     / /     |_ \\   |_  _|  |__ \\   / _ \\     / /  \n         |_|    /___|   |___/     |_|   |___/   \\___/    /_/   \n                                                               \n      |       |       |       |       |       |  \\ /  |       |\n      |       |       |       |       |       |   X   |       |\n      |       |       |       |       |       |  / \\  |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |  \\ /  |  \\ /  |       |\n      |       |       |       |       |   X   |   X   |       |\n      |       |       |       |       |  / \\  |  / \\  |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |  @@@  |  @@@  |  @@@  |  @@@  |\n      |       |       |       | @@0@@ | @@0@@ | @@0@@ | @@0@@ |\n      |       |       |       |  @@@  |  @@@  |  @@@  |  @@@  |\n      |       |       |       |       |       |       |       |\n      |  \\ /  |       |  \\ /  |  \\ /  |  \\ /  |  @@@  |  @@@  |\n      |   X   |       |   X   |   X   |   X   | @@0@@ | @@0@@ |\n      |  / \\  |       |  / \\  |  / \\  |  / \\  |  @@@  |  @@@  |\n      |       |       |       |       |       |       |       |\n      |  @@@  |       |  @@@  |  \\ /  |  @@@  |  @@@  |  \\ /  |\n      | @@0@@ |       | @@0@@ |   X   | @@0@@ | @@0@@ |   X   |\n      |  @@@  |       |  @@@  |  / \\  |  @@@  |  @@@  |  / \\  |\n      |       |       |       |       |       |       |       |\n      |  \\ /  |  @@@  |  \\ /  |  @@@  |  @@@  |  \\ /  |  \\ /  |\n      |   X   | @@0@@ |   X   | @@0@@ | @@0@@ |   X   |   X   |\n      |  / \\  |  @@@  |  / \\  |  @@@  |  @@@  |  / \\  |  / \\  |\n      |_______|_______|_______|_______|_______|_______|_______|\n                                                               \n                                                               \n"
size: 		.word 1984
max_size: 		.word 2000
buffer_read: .asciiz "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

.text
lw $t6 , size
lw $t7, max_size
la $s7 , buffer_read
###############################################################
###############################################################
# Open (for reading) a file
li $v0, 13 # system call for open file
la $a0, fout # input file name
li $a1, 0 # Open for reading (flags are 0: read, 1: write)
li $a2, 0 # mode is ignored
syscall # open a file (file descriptor returned in $v0)
move $s6, $v0 # save the file descriptor
###############################################################
# Read from file
li $v0, 14 # system call for read
move $a0, $s6 # file descriptor
la $a1, buffer_read # address of buffer read
move $a2, $t6 # hardcoded buffer length
syscall # read file


li $v0, 9 # system call code for dynamic allocation
move $a0, $t7 # $a0 contains number of bytes to allocate
syscall

move $s5, $v0 #save heap location


addi $t1 , $0, 0 #index
forArray1:
beq $t1, $t6 , exit1

add $t4 , $t1, $s7
add $t5, $t1, $s5 

lb $t0, 0($t4)
sb $t0, 0($t5)

addi $t1, $t1, 1
j forArray1

exit1: 


addi $t1 , $0, 0 #index
forArray2:
beq $t1, $t6 , exit2

add $t4 , $t1, $s7
add $t5, $t1, $s5 


lb $t0, 0($t5)

li $v0, 11
move $a0, $t0
syscall 

addi $t1, $t1, 1
j forArray2

exit2: 

