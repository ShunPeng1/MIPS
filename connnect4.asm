.data 
	board: 	.space 1000
	buffer:	.space 1000
	
	
	welcome: 	.asciiz "               WELCOME TO                        \n  ______    ______   __    __  __    __  ________   ______  ________        __    __ \n /      \\  /      \\ |  \\  |  \\|  \\  |  \\|        \\ /      \\|        \\      |  \\  |  \\\n|  $$$$$$\\|  $$$$$$\\| $$\\ | $$| $$\\ | $$| $$$$$$$$|  $$$$$$\\\\$$$$$$$$      | $$  | $$\n| $$   \\$$| $$  | $$| $$$\\| $$| $$$\\| $$| $$__    | $$   \\$$  | $$         | $$__| $$\n| $$      | $$  | $$| $$$$\\ $$| $$$$\\ $$| $$  \\   | $$        | $$         | $$    $$\n| $$   __ | $$  | $$| $$\\$$ $$| $$\\$$ $$| $$$$$   | $$   __   | $$          \\$$$$$$$$\n| $$__/  \\| $$__/ $$| $$ \\$$$$| $$ \\$$$$| $$_____ | $$__/  \\  | $$               | $$\n \\$$    $$ \\$$    $$| $$  \\$$$| $$  \\$$$| $$     \\ \\$$    $$  | $$               | $$\n  \\$$$$$$   \\$$$$$$  \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$  \\$$$$$$    \\$$                \\$$\n\n                                            by BANH TAN THUAN - 2153011\n"
	menu_choice: 	.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	menu_error_1_2:	.asciiz "\nThe choice you've entered is not in the specified range (1-2). \nPlease enter the right choice: "
	
	
	new_page:        .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	newline:	.asciiz "\n"
	
	
.text
	
	
	
start_menu: 
	li $v0, 4
	la $a0, new_page
	syscall
	
	li $v0, 4
	la $a0, welcome
	syscall

	li $v0, 4
	la $a0, menu_choice
	syscall	

	li $v0, 8			
	la $a0, buffer
	li $a1, 1000
	move $t2, $a0
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
	add $v0, $t0, -48
	#j done_menu_check
	
read_menu_error: # In case the player makes error
	# Reprint the whole menu, with a error message
	jal flush_console
	li $v0, 4
	#la $a0, menu1
	syscall
	li $v0, 4
	#la $a0, menu2
	syscall
	li $v0, 4
	#la $a0, menu3
	syscall
	li $v0, 4
	#la $a0, menu_error_1_2
	syscall
	#j read_menu
	
	
	
flush_console: # Use to push all printed messages out of the console space.
	li $v0, 4
	la $a0,new_page
	syscall
	jr $ra
	


