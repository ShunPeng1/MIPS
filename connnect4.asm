.data 
	board: 	.space 1000
	buffer:	.space 1000

	
	
	welcome: 	.asciiz "               WELCOME TO                        \n  ______    ______   __    __  __    __  ________   ______  ________        __    __ \n /      \\  /      \\ |  \\  |  \\|  \\  |  \\|        \\ /      \\|        \\      |  \\  |  \\\n|  $$$$$$\\|  $$$$$$\\| $$\\ | $$| $$\\ | $$| $$$$$$$$|  $$$$$$\\\\$$$$$$$$      | $$  | $$\n| $$   \\$$| $$  | $$| $$$\\| $$| $$$\\| $$| $$__    | $$   \\$$  | $$         | $$__| $$\n| $$      | $$  | $$| $$$$\\ $$| $$$$\\ $$| $$  \\   | $$        | $$         | $$    $$\n| $$   __ | $$  | $$| $$\\$$ $$| $$\\$$ $$| $$$$$   | $$   __   | $$          \\$$$$$$$$\n| $$__/  \\| $$__/ $$| $$ \\$$$$| $$ \\$$$$| $$_____ | $$__/  \\  | $$               | $$\n \\$$    $$ \\$$    $$| $$  \\$$$| $$  \\$$$| $$     \\ \\$$    $$  | $$               | $$\n  \\$$$$$$   \\$$$$$$  \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$  \\$$$$$$    \\$$                \\$$\n\n                                            by BANH TAN THUAN - 2153011\n"
	menu_choice: 	.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	menu_error_1_2:	.asciiz "\nThe choice you've entered is not in the specified range (1-2). \nPlease enter the right choice: "

	x1:		.asciiz "|  \\ /  |"
	x2:		.asciiz "|   X   |"
	x3:		.asciiz "|  / \\  |"
	
	e1:		.asciiz "|       |"
	e2:		.asciiz "|_______|"	
	
	o1:		.asciiz "|   _   |"
	o2:		.asciiz "|  /O\\  |"
	o3:		.asciiz "|  \\_/  |"

	
		
	
	new_page:        .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	endl:	.asciiz "\n"
	
	
.text
	#initialize address
	la $s7 , board
	
	
start_menu: #pribt start menu and 
	li $v0, 4
	la $a0, new_page
	syscall
	
	li $v0, 4
	la $a0, welcome
	syscall

	li $v0, 4
	la $a0, menu_choice
	syscall	
	
	

read_menu: # Read the player's input and also check if it's valid.
	li $v0, 8			
	la $a0, buffer
	li $a1, 1000
	move $t2, $a0
	syscall
	
	lb $t0, 0($t2)
	lb $t1, 1($t2)
	bne $t1, '\n', read_menu_error

	blt $t0, '1', read_menu_error
	bgt $t0, '2', read_menu_error
	add $a3, $t0, $0
	j menu_transition
	
read_menu_error: # In case the player makes error
	# Reprint the whole menu, with a error message
	jal flush_console
	li $v0, 4
	la $a0, new_page
	syscall
	li $v0, 4
	la $a0, welcome
	syscall
	li $v0, 4
	la $a0, menu_choice
	syscall
	li $v0, 4
	la $a0, menu_error_1_2
	syscall
	j read_menu

menu_transition: #take a3 as parameter to transition to corrent scene
	beq $a3, 1, game_loop 
	beq $a3, 2, tutorial	
	
tutorial:
		

	
flush_console: # Use to push all printed messages out of the console space.
	li $v0, 4
	la $a0,new_page
	syscall
	jr $ra
	

print_board: # loop through 6 row first, with 4 sub row in each row
	
	
	li $v0, 4
	la $a0, x1
	syscall	
	li $v0, 4
	la $a0, o1
	syscall		
	li $v0, 4
	la $a0, endl
	syscall	
	
	li $v0, 4
	la $a0, x2
	syscall	
	li $v0, 4
	la $a0, o2
	syscall	
	li $v0, 4
	la $a0, endl
	syscall
	
	li $v0, 4
	la $a0, x3
	syscall	
	li $v0, 4
	la $a0, o3
	syscall	
	li $v0, 4
	la $a0, endl
	syscall
	
	li $v0, 4
	la $a0, e1
	syscall	
	li $v0, 4
	la $a0, e2
	syscall		
	li $v0, 4
	la $a0, endl
	syscall

print_row_1: # a3 is the row index top - bottom (6-0)
	
	add $t0, $t6, $0
	mul 
	lw $t7 , 
	

print_type_1: # a2 is the ytpe 
	
	
	
	