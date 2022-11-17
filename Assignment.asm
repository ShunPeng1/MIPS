.data
	init_board: 		.asciiz "                       |     |     \n                    7  |  8  |  9  \n                  _____|_____|_____\n                       |     |     \n                    4  |  5  |  6  \n                  _____|_____|_____\n                       |     |     \n                    1  |  2  |  3  \n                       |     |     \n"
	board: 			.asciiz "                       |     |     \n                    7  |  8  |  9  \n                  _____|_____|_____\n                       |     |     \n                    4  |  5  |  6  \n                  _____|_____|_____\n                       |     |     \n                    1  |  2  |  3  \n                       |     |     \n"
	moves:	 		.asciiz "123456789"
	positions:		.word 	272, 278, 284, 164, 170, 176, 56, 62, 68
	OX: 			.asciiz "OX"
	buffer:			.space 1000
	end: 			.ascii	"\0"
	whose_turn:		.asciiz "'s turn: "
	menu1: 			.asciiz "                    - Welcome to -                   \n  _______ _        _______           _______         \n |__   __(_)      |__   __|         |__   __|        \n    | |   _  ___     | | __ _  ___     | | ___   ___ \n    | |  | |/ __|    | |/ _` |/ __|    | |/ _ \\ / _ \\\n"
	menu2: 			.asciiz "    | |  | | (__     | | (_| | (__     | | (_) |  __/\n    |_|  |_|\\___|    |_|\\__,_|\\___|    |_|\\___/ \\___|\n                                                     \n                                                     \n              [Select with your keyboard]             "
	menu3: 			.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	guide1:			.asciiz "Welcome to Tic Tac Toe, a classic game in which two players \nalternately put Xs and Os in a 3x3 board.\n"
	guide2: 		.asciiz "You make a move by typing the name of the cell you choose, \nfrom 1 to 9, then press Enter. For example: 5\n"
	guide3: 		.asciiz "The first player to get a row of three Xs or three Os is the\nwinner of the game. If all nine cells are filled without any\nplayer winning, then it is a draw.\n[Press Enter to start playing]\n"
	new_line: 		.asciiz "\n"
	so_many_new_lines: 	.asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	read_1_to_2_error_m: 	.asciiz "\nThe choice you've entered is not in the specified range (1-2). \nPlease enter the right choice: "
	read_1_to_9_error_m: 	.asciiz "\nThe choice you've entered is not in the specified range (1-9). \nPlease enter the right choice: "
	occupied_error:		.asciiz "\nThe cell you've chosen is occupied. \nPlease choose another cell: "
	win_spaces:		.asciiz "                   "
	draw_spaces: 		.asciiz "                        "
	win_message: 		.asciiz " is the winner!\n\n"
	draw_message: 		.asciiz "Draw.\n\n"
	replay_message: 	.asciiz "\n              Would you like a rematch?\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |   1. Yes    | |            | |    2. No    | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n"
.text
	la $s0, board	  # The string which will be displayed and manipulated throughout the game.
	la $s1, positions # Hard-coded position of the .
	li $s2, 0	  # Count the total moves of the game to detect draw.
	la $s3, OX	  # For easy access to the chars. ($s3) is 'O', 1($s3) is 'X'.
	li $s4, 1 	  # The current turn. Pairs well with $s3. The initial turn is always X.
	addi $s5, $s5, -1 # The state of the game. 1 is win, 0 is draw, -1 is unfinished.
#######################################################################################################################
	jal flush_console
	
	# Print the menu.
	li $v0, 4
	la $a0, menu1
	syscall
	li $v0, 4
	la $a0, menu2
	syscall
	li $v0, 4
	la $a0, menu3
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
	j done_menu_check
	
read_menu_error: # In case the player makes error
	# Reprint the whole menu, with a error message
	jal flush_console
	li $v0, 4
	la $a0, menu1
	syscall
	li $v0, 4
	la $a0, menu2
	syscall
	li $v0, 4
	la $a0, menu3
	syscall
	li $v0, 4
	la $a0, read_1_to_2_error_m
	syscall
	j read_menu
	
done_menu_check:
	# If the player enters 1, take them to the main game. 
	# If the player enters 2, take them to the tutorial first.
	beq $v0, 1, game_loop
	# The tutorial:
	li $v0, 4
	la $a0, so_many_new_lines
	syscall
	li $v0, 4
	la $a0, guide1
	syscall
	
	jal print_board
	
	li $v0, 4
	la $a0, guide2
	syscall
	
	# The example with cell 5 being chosen to demonstrate.
	li $a0, 5
	li $a1, 'X'
	jal set_at
	jal print_board
	jal reset_board
	
	li $v0, 4
	la $a0, guide3
	syscall
	
	jal read_anything
	
game_loop:
	jal flush_console
	jal print_board # Print the board.
	# Announce the current turn.
	add $s6, $s3, $s4 # $s6 holds the char of the current turn, 'X' or 'O'
	li $v0, 11
	lb $a0, ($s6)
	syscall
	li $v0, 4
	la $a0, whose_turn
	syscall
	
	# Read the input and determine the state of the game.
	j read_input
read_input_again: # In case the cell selected is occupied, inform the player with a message.
	jal flush_console
	jal print_board
	add $s6, $s3, $s4 
	li $v0, 11
	lb $a0, ($s6)
	syscall
	li $v0, 4
	la $a0, whose_turn
	syscall
	li $v0, 4
	la $a0, occupied_error
	syscall
	
read_input:
	jal read_1_to_9 # Read and check whether the input is valid.
	
	# Jump to set_at, which sets the selected cell to the current turn's symbol 
	move $a0, $v0
	lb $a1, ($s6)
	jal set_at
	
	# In case set_at return 0, which indicates the selected cell is occupied
	beqz $v0, read_input_again
	
	addi $s2, $s2, 1 # Increase the total move counter by one...
	move $a0, $s2 	 # ...and move it to the first parameter of check_win...
	jal check_win	 # ...then call check_win to check the state of the game.
	
	beq $v0, 1, is_win  # Check win return 1 if any player wins...
	beq $v0, 0, is_draw # ...or return 0 if it's a draw...
	j unfinished	    # ...or return -1 if the game is not finished yet.
	
	is_win:
	jal flush_console
	# Print a message to congratulate the winning player.
	li $v0, 4
	la $a0, win_spaces
	syscall
	li $v0, 11
	add $s6, $s3, $s4
	lb $a0, ($s6)
	syscall
	li $v0, 4
	la $a0, win_message
	syscall
	jal print_board
	j replay
	
	is_draw:
	jal flush_console
	# Print a message announcing that this is a draw.
	li $v0, 4
	la $a0, draw_spaces
	syscall
	li $v0, 4
	la $a0, draw_message
	syscall
	jal print_board
	
	# Those two cases lead to a replay option.
	replay:
	li $v0, 4
	la $a0, replay_message
	syscall
	jal read_1_to_2    # Read the choice of the player...
	beq $v0, 1, reset  # ...if it's 1 then jump to reset to restart the game...
	beq $v0, 2, exit   # ...or if it's 2 then jump to exit to terminate the program.
	
	# If the game is not yet won or drawed.
	unfinished:
	xori $s4, $s4, 1 # Flip the current symbol. (X to O or O to X.)
	j game_loop	 # Continue with the main loop.
	
reset:
	jal reset_board # Reset the board.
	li $s2, 0       # Reset the moves counter.
	li $s4, 1	# Set the current turn to X.
	j game_loop
	
#######################################################################################################################
print_board: # Use to print the board. Since the board is just a string, it's a simple function.
	li $v0, 4
	la $a0, board
	syscall
	jr $ra

reset_board: # Use to reset the board.
	la $t0, init_board # init_board holds the initial board string.
	la $t1, board
	reset_board_loop: # Loop through both strings and set the content of init_board to board.
	lb $t2, ($t0)
	sb $t2, ($t1)
	addi $t0, $t0, 1
	addi $t1, $t1 ,1
	bne $t2, $zero, reset_board_loop
	jr $ra

flush_console: # Use to push all printed messages out of the console space.
	li $v0, 4
	la $a0, so_many_new_lines
	syscall
	jr $ra
	
read_anything: # Use to add a pause to the game
	li $v0, 8
	syscall
	jr $ra
	
read_1_to_2: # Use to read and check whether the number is in the range from 1 to 2
	li $v0, 8			
	la $a0, buffer
	li $a1, 1000
	move $t2, $a0
	syscall
	
	lb $t0, 0($t2)
	lb $t1, 1($t2)
	bne $t1, '\n', read_1_to_2_error

	blt $t0, '1', read_1_to_2_error
	bgt $t0, '2', read_1_to_2_error
	add $v0, $t0, -48
	jr $ra
	
	read_1_to_2_error:
	li $v0, 4
	la $a0, read_1_to_2_error_m
	syscall
	j read_1_to_2
	
read_1_to_9: # Use to read and check whether the number is in the range from 1 to 9
	li $v0, 8			
	la $a0, buffer
	li $a1, 1000
	move $t2, $a0
	syscall
	
	lb $t0, 0($t2)
	lb $t1, 1($t2)
	bne $t1, '\n', read_1_to_9_error

	blt $t0, '1', read_1_to_9_error
	bgt $t0, '9', read_1_to_9_error
	add $v0, $t0, -48
	jr $ra
	
	blt $t0, 1, read_1_to_9_error
	bgt $t0, 9, read_1_to_9_error
	jr $ra
	
	read_1_to_9_error:
	li $v0, 4
	la $a0, so_many_new_lines
	syscall
	li $v0, 4
	la $a0, board
	syscall
	add $s6, $s3, $s4 
	li $v0, 11
	lb $a0, ($s6)
	syscall
	li $v0, 4
	la $a0, whose_turn
	syscall
	li $v0, 4
	la $a0, read_1_to_9_error_m
	syscall
	j read_1_to_9

set_at: # Use to set any 1 of the 9 cells of the board to the desired symbol (X or O).
	move $t0, $a0 # $a0 is the index of the cell.
	move $t1, $a1 # $a1 is the desired symbol.

	addi $t0, $t0, -1 # Offset by 1.
	sll $t0, $t0, 2   # Since positions at $s1 are of type word, multiply $t0 by 4.
	add $t0, $t0, $s1 # $t0 now holds the address of the offset of the selected cell.
	lw $t0, ($t0)	  # Get the offset...
	add $t0, $t0, $s0 # ...and add it with the address of the board.
	
	# Check if the selected cell is occupied.
	li $t2, 'X'
	li $t3, 'O'
	lb $t4, ($t0)
	beq $t4, $t2, occupied
	beq $t4, $t3, occupied
	
	sb $t1, ($t0)
	li $v0, 1 # 1 means it's a success set.
	jr $ra
	occupied:
	li $v0, 0 # 0 means the cell is occupied.
	jr $ra
	
check_win: # This function informs the current state of the game
	li $v0, -1 # Default is -1: the game is not finished yet.
	
	# Below are multiple conditional checks. 
	# They check if any appropriate row, column or diagonal line have the same symbol in their cells.
	# If any of them does, jump to win and return 1.
	# The offsets to the index of the symbols are hard-coded.
	lb $t0, 272($s0)
	lb $t1, 278($s0)
	bne $t0, $t1, check_1
	lb $t0, 284($s0)
	bne $t0, $t1, check_1
	j win

	check_1:
	lb $t0, 164($s0)
	lb $t1, 170($s0)
	bne $t0, $t1, check_2
	lb $t0, 176($s0)
	bne $t0, $t1, check_2
	j win
	
	check_2:
	lb $t0, 56($s0)
	lb $t1, 62($s0)
	bne $t0, $t1, check_3
	lb $t0, 68($s0)
	bne $t0, $t1, check_3
	j win
	
	check_3:
	lb $t0, 272($s0)
	lb $t1, 164($s0)
	bne $t0, $t1, check_4
	lb $t0, 56($s0)
	bne $t0, $t1, check_4
	j win
	
	check_4:
	lb $t0, 278($s0)
	lb $t1, 170($s0)
	bne $t0, $t1, check_5
	lb $t0, 62($s0)
	bne $t0, $t1, check_5
	j win
	
	check_5:
	lb $t0, 284($s0)
	lb $t1, 176($s0)
	bne $t0, $t1, check_6
	lb $t0, 68($s0)
	bne $t0, $t1, check_6
	j win
	
	check_6:
	lb $t0, 272($s0)
	lb $t1, 170($s0)
	bne $t0, $t1, check_7
	lb $t0, 68($s0)
	bne $t0, $t1, check_7
	j win
	
	check_7:
	lb $t0, 284($s0)
	lb $t1, 170($s0)
	bne $t0, $t1, check_8
	lb $t0, 56($s0)
	bne $t0, $t1, check_8
	j win
	
	# The final check is used to determine whether the game is draw.
	# $a0 is the moves counter.
	# If 9 moves are made, but none of the above checks return true, then it's a draw.
	check_8:
	beq $a0, 9, check_draw
	j not_draw
	check_draw:
	li $v0, 0
	not_draw:
	jr $ra

	win: # Return 1 if the game is won.
	li $v0, 1
	jr $ra
	
exit: # Terminate the program.
	li $v0, 10
	syscall	