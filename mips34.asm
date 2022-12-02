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
###############################################################
# Open (for writing) a file that does not exist
li $v0, 13 # system call for open file
la $a0, fout # output file name
li $a1, 1 # Open for writing (flags are 0: read, 1: write)
li $a2, 0 # mode is ignored
syscall # open a file (file descriptor returned in $v0)
move $s6, $v0 # save the file descriptor
###############################################################
# Write to file just opened
li $v0, 15 # system call for write to file
move $a0, $s6 # file descriptor
la $a1, buffer_write # address of buffer from which to write
move $a2, $t6 # hardcoded buffer length
syscall # write to file
###############################################################
# Close the file
li $v0, 16 # system call for close file
move $a0, $s6 # file descriptor to close
syscall # close file
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

li $v0, 4
la $a0, buffer_save
syscall



