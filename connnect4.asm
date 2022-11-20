.data 
	
	board:		.asciiz "    _      ___     ____    _ _     ___      __     ____  \n   / |    |_  )   |__ /   | | |   | __|    / /    |__  | \n   | |     / /     |_ \\   |_  _|  |__ \\   / _ \\     / /  \n   |_|    /___|   |___/     |_|   |___/   \\___/    /_/   \n                                                         \n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|       |       |       |       |       |       |       |\n|_______|_______|_______|_______|_______|_______|_______|\n"
	buffer:		.space 1000

	
	
	welcome: 	.asciiz "               WELCOME TO                        \n  ______    ______   __    __  __    __  ________   ______  ________        __    __ \n /      \\  /      \\ |  \\  |  \\|  \\  |  \\|        \\ /      \\|        \\      |  \\  |  \\\n|  $$$$$$\\|  $$$$$$\\| $$\\ | $$| $$\\ | $$| $$$$$$$$|  $$$$$$\\\\$$$$$$$$      | $$  | $$\n| $$   \\$$| $$  | $$| $$$\\| $$| $$$\\| $$| $$__    | $$   \\$$  | $$         | $$__| $$\n| $$      | $$  | $$| $$$$\\ $$| $$$$\\ $$| $$  \\   | $$        | $$         | $$    $$\n| $$   __ | $$  | $$| $$\\$$ $$| $$\\$$ $$| $$$$$   | $$   __   | $$          \\$$$$$$$$\n| $$__/  \\| $$__/ $$| $$ \\$$$$| $$ \\$$$$| $$_____ | $$__/  \\  | $$               | $$\n \\$$    $$ \\$$    $$| $$  \\$$$| $$  \\$$$| $$     \\ \\$$    $$  | $$               | $$\n  \\$$$$$$   \\$$$$$$  \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$  \\$$$$$$    \\$$                \\$$\n\n                                            by BANH TAN THUAN - 2153011\n"
	menu_choice: 	.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	menu_error_1_2:	.asciiz "\nThe choice you've entered is not in the specified range (1-2). \nPlease enter the right choice: "

	
	x1:		.asciiz "|  \\ /  |"
	x2:		.asciiz "|   X   |"
	x3:		.asciiz "|  / \\  |"
	
	
	e0:		.asciiz "|       |"
	e1:		.asciiz "|_______|"	

	
		
	o1:		.asciiz "|   _   |"
	o2:		.asciiz "|  /O\\  |"
	o3:		.asciiz "|  \\_/  |"

	
		
	tutorialText:	.asciiz "tutorialText\n"
	
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
	

check_read_menu: # Read the player's input and also check if it's valid.
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
	la $a0, welcome
	syscall
	li $v0, 4
	la $a0, menu_choice
	syscall
	li $v0, 4
	la $a0, menu_error_1_2
	syscall
	j check_read_menu

menu_transition: #take a3 as parameter to transition to corrent scene
	beq $a3, 1, quit
	beq $a3, 2, tutorial	
	
tutorial:
	
	j game_loop
	
	
game_loop:
	
	j print_board
	 
	j quit 
	
flush_console: # Use to push all printed messages out of the console space.
	li $v0, 4
	la $a0,new_page
	syscall
	jr $ra
	

print_board: # loop through 6 row first, with 4 sub row in each row
	jal flush_console
	
	li $v0, 4
	la $a0,board
	syscall
	
	
	add $a2, $0, 6 
	add $a3, $0, 7
	jal insert_x
	
	li $v0, 4
	la $a0,board
	syscall
	
	j quit

calculate_coordinate:  # a2 = row_index(1-6) , a3 = column index (1-7)  return v1 = board middle coordinate 
	addi $a2, $a2, -1
	mul $a2, $a2, 232
	
	addi $a3, $a3, -1
	mul $a3, $a3, 8
	
	addi $v1, $0, 352
	add $v1, $v1, $a2
	add $v1, $v1, $a3
	
	jr $ra

insert_x:  #  a2 = row_index(1-6) , a3 = column index (1-7) . Void : Find middle position of the index, then replace with text shape X
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal calculate_coordinate
	
	# t0 = 88 is ascii for 'X'
	addi $t0, $0, 88
	add $v1, $v1, $s7

	#draw X shape	
	sb $t0, 0($v1)
	sb $t0, 1($v1)
	sb $t0, -1($v1)
	sb $t0, -60($v1)
	sb $t0, -56($v1)
	sb $t0, 56($v1)
	sb $t0, 60($v1)
	
	#return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
insert_o:  #  a2 = row_index(1-6) , a3 = column index (1-7)
	#find middle position of the index
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal calculate_coordinate
	
	addi $t0, $0, 48
	add $v1, $v1, $s7
	
	sb $t0, 0($v1)
	sb $t0, 1($v1)
	sb $t0, -1($v1)
	sb $t0, -60($v1)
	sb $t0, -56($v1)
	sb $t0, 56($v1)
	sb $t0, 60($v1)
	

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
		

quit:
	li $v0, 10
	syscall	
	
