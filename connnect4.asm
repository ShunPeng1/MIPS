.data 
	#board string and size offset
	board: 			.asciiz "           _      ___     ____    _ _     ___      __     ____                                     \n          / |    |_  )   |__ /   | | |   | __|    / /    |__  |                                    \n          | |     / /     |_ \\   |_  _|  |__ \\   / _ \\     / /                                     \n          |_|    /___|   |___/     |_|   |___/   \\___/    /_/                                      \n                                                                                                   \n       |       |       |       |       |       |       |       |       .-------------------------. \n       |       |       |       |       |       |       |       |      |         PLAYER X          |\n       |       |       |       |       |       |       |       |      | .-----------------------. |\n       |       |       |       |       |       |       |       |      ||   VIOLATION :  0/3      ||\n       |       |       |       |       |       |       |       |      ||                         ||\n       |       |       |       |       |       |       |       |      ||   UNDO      :  3/3      ||\n       |       |       |       |       |       |       |       |      ||                         ||\n       |       |       |       |       |       |       |       |      ||   LAST MOVE :  ?        ||\n       |       |       |       |       |       |       |       |      | '-----------------------' |\n       |       |       |       |       |       |       |       |       '-------------------------' \n       |       |       |       |       |       |       |       |                                   \n       |       |       |       |       |       |       |       |                                   \n       |       |       |       |       |       |       |       |                                   \n       |       |       |       |       |       |       |       |       .-------------------------. \n       |       |       |       |       |       |       |       |      |         PLAYER 0          |\n       |       |       |       |       |       |       |       |      | .-----------------------. |\n       |       |       |       |       |       |       |       |      ||   VIOLATION :  0/3      ||\n       |       |       |       |       |       |       |       |      ||                         ||\n       |       |       |       |       |       |       |       |      ||   UNDO      :  3/3      ||\n       |       |       |       |       |       |       |       |      ||                         ||\n       |       |       |       |       |       |       |       |      ||   LAST MOVE :  ?        ||\n       |       |       |       |       |       |       |       |      | '-----------------------' |\n       |       |       |       |       |       |       |       |       '-------------------------' \n       |_______|_______|_______|_______|_______|_______|_______|                                   \n                                                                                                   \n                                                                                                   \n"
    	number_of_element:	.word 0
    	
	#offsets
	initial_offset:		.word 	611 #500 + 11
	row_offset:		.word 	400
	line_offset:		.word 	100
	column_offset:		.word 	8
	
	# char position of the board
	x_violation_index:	.word 	888
	x_undo_index:		.word 	1088
	x_last_move_index:	.word 	1288
	
	o_violation_index:	.word 	2188
	o_undo_index:		.word 	2388
	o_last_move_index:	.word 	2588
	
	player_turn_index:	.word 	3050

	#phase string
	phase_x_turn: 		.asciiz "=======================================[ PLAYER'S X TURN ]========================================="
	phase_o_turn:		.asciiz "=======================================[ PLAYER'S 0 TURN ]========================================="
	phase_game_over:		.asciiz "=======================================[    GAME OVER!   ]========================================="
	
	
	# pair of row-column vector 
	row_vector:	.word	0,	0,	1,	-1,	1,	-1,	-1,	1
	column_vector:	.word	1,	-1,	1,	-1,	0,	0,	1,	-1
	
	
	#menu string
	welcome: 	.asciiz "                    WELCOME TO                        \n      ______    ______   __    __  __    __  ________   ______  ________        __    __ \n     /      \\  /      \\ |  \\  |  \\|  \\  |  \\|        \\ /      \\|        \\      |  \\  |  \\\n    |  $$$$$$\\|  $$$$$$\\| $$\\ | $$| $$\\ | $$| $$$$$$$$|  $$$$$$\\\\$$$$$$$$      | $$  | $$\n    | $$   \\$$| $$  | $$| $$$\\| $$| $$$\\| $$| $$__    | $$   \\$$  | $$         | $$__| $$\n    | $$      | $$  | $$| $$$$\\ $$| $$$$\\ $$| $$  \\   | $$        | $$         | $$    $$\n    | $$   __ | $$  | $$| $$\\$$ $$| $$\\$$ $$| $$$$$   | $$   __   | $$          \\$$$$$$$$\n    | $$__/  \\| $$__/ $$| $$ \\$$$$| $$ \\$$$$| $$_____ | $$__/  \\  | $$               | $$\n     \\$$    $$ \\$$    $$| $$  \\$$$| $$  \\$$$| $$     \\ \\$$    $$  | $$               | $$\n      \\$$$$$$   \\$$$$$$  \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$  \\$$$$$$    \\$$                \\$$\n\n                                            by BANH TAN THUAN - 2153011\n"
	menu_choice: 	.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	menu_error_1_2:	.asciiz "\nTHE CHOICE YOU'VE ENTERED IS NOT IN THE SPECIFIED RANGE (1-2). PLEASE ENTER THE RIGHT CHOICE: "

	#commend
	X0:		.asciiz "X0"
	player_input:	.asciiz "\nPRESS THE COLUMN INDEX (1-7) YOU WANT TO DROP : "
        undo_success:	.asciiz "\nYOU HAVE SUCCESSFULLY UNDO, PRESS THE COLUMN INDEX (1-7) YOU WANT TO DROP : "
        turn_error_1_7:	.asciiz "\nWARNING: YOU HAVE BEEN GIVEN A MARK FOR VIOLATING (3 TIMES = LOSE)\nTHE CHOICE YOU'VE ENTERED IS NOT IN THE SLOT RANGE (1-7). PLEASE ENTER THE RIGHT CHOICE: "
	occupied:	.asciiz "\nWARNING: YOU HAVE BEEN GIVEN A MARK FOR VIOLATING (3 TIMES = LOSE)\nTHE COLUMN IS FULL, PLEASE ENTER OTHER COLUMN:"
	violation_warn:	.asciiz "WARNING: YOU HAVE BEEN GIVEN A MARK FOR VIOLATING (3 TIMES VIOLATION = LOSE!)\n This message was pop up to prevent multiple character pressed"
	undo_ask:		.asciiz "\nYOU DO WISH TO UNDO YOUR MOVE (PRESS Y) OR ANY OTHER BUTTON TO CONTINUE ? "
	  	 	 	 	
	# win_menu string
	x_won_connect_4:	.asciiz "\nPLAYER X HAS CONNECTED 4 PIECES, PLAYER X WON !"
	o_won_connect_4:	.asciiz "\nPLAYER 0 HAS CONNECTED 4 PIECES, PLAYER 0 WON !"
	x_won_o_violate:	.asciiz "\nPLAYER 0 HAS VIOLATED 3 TIMES, PLAYER X WON !"
	o_won_x_violate:	.asciiz "\nPLAYER X HAS VIOLATED 3 TIMES, PLAYER 0 WON !"	
	draw:		.asciiz "\nTHE BOARD IS FULLY FILLED, GAME DRAW!"


	# line!
	new_page:        .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	endl:		.asciiz "\n"
	
	
	
	
.text
	#initialize address
	
	li $s5 ,  1  # s5 : event controller , 1 : x' turn  , 2 : o' turn  
	
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
	li $v0, 12	
	syscall

	blt $v0, '1', read_menu_error
	bgt $v0, '2', read_menu_error
	add $a3, $v0, $0
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
	beq $a3, '1', game_loop
	beq $a3, '2', tutorial	
	
tutorial:
	jal print_board
	
	
	li $v0, 55
	la $a0, board
	syscall
	
	
	
	
	j quit	
	
init_game:
	

	
game_loop: # a1 = case
	#reset variable
	addi $a2, $0, 0 
	addi $a3, $0, 0 
	
	jal print_board 
	
	#print phase depend on s5
	jal print_phase
	
	#print comment
	beq $a1, 1 , print_player_input
	beq $a1, 2 , print_undo_success
	beq $a1, 3 , print_turn_error_1_7
	beq $a1, 4 , print_occupied
	
	print_player_input: 		
		li $v0, 4
		la $a0, player_input
		syscall
		j game_loop_print_break
		
	print_undo_success:
		li $v0, 4
		la $a0, undo_success
		syscall
		j game_loop_print_break
		
	print_turn_error_1_7: 		
		li $v0, 4
		la $a0, turn_error_1_7
		syscall
		j game_loop_print_break
		
	print_occupied: 		
		li $v0, 4
		la $a0, occupied
		syscall
		j game_loop_print_break
			
	game_loop_print_break:
	
	#receive input	
	li $v0, 12			
	syscall	
	
	# check player input, if violate check the player violation marks and decide to end or loop
	addi $a1, $0, 3 #assuming the player violated
	
	blt $v0, '1', game_loop_is_violate
	bgt $v0, '7', game_loop_is_violate
	j  game_loop_no_violate
	
	game_loop_is_violate:# the player have violated
	
		jal player_violate # return v1 = 0 is violate and require to input again, v1 = 1 is violate over 3 times and lose
	
		beq $v1, 1 , win_menu
		beq $v1, 0, game_loop
		
	game_loop_no_violate:
	#check occuptation
	add $a1, $0, 4 #assumming filled column
	addi $a3, $v0, -48 #change char to int
	
	addi $a2, $0, 1
	jal calculate_coordinate # return v1 is the array index
	
	lb $t1,  board+0($v1)
	bne $t1, ' ', game_loop_is_violate #we goto is violate to calculate violate and return game_loop with a3 = 4
	
	#not fulled column so we find the empty slot on top of stack
	addi $a2, $0, 7
	
	game_loop_find_empty_slot:
		addi $a2, $a2, -1
		beq $a2, 1, game_loop_end_find_empty_slot
		
		jal calculate_coordinate
		lb $t1,  board+0($v1)
		beq $t1, ' ', game_loop_end_find_empty_slot
		j game_loop_find_empty_slot
	
	
	#accepted player input so start inserting 
	game_loop_end_find_empty_slot:
	
	jal insert
	
	jal check_winning #return v1 = 1 X is wining, = 0 is not and continue 
	beq $v1, 1, win_menu
	
	#check for fully filled
	lw $v1, number_of_element
	addi $v1, $v1, 1 
	sw $v1, number_of_element
	
	add $a1, $0, 5 # assuming all columns are filled
	beq $v1, 42, win_menu
	
	
	#check undo
	jal check_undo # v1 = 1 if undo , else v1 = 0 
	
	#assume successfully undo
	addi $a1, $0, 2
	beq $v1, 1, game_loop
		
	#prepare for next turn
	jal change_player
	addi $a1, $0, 1 # receive input
	
	j game_loop


check_winning: # a2 = row_index(1-6) , a3 = column index (1-7) .  
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# save inserted coordinate
	move $t3, $a3 #t3 is const a3 
	move $t2, $a2 #t2 is const a2
	
	addi $t0, $0, -4 # t0 is index for row column offset
	
	check_vector: # check in two direction and sum the continuous character, total loop 4 times for each 2 vector 
		addi $t0, $t0, 4
		beq $t0, 32, end_check_vector # check if t0 is the 9th vector
		
		addi $t9, $0, 1 # counter for continuous char
		
		# get vector 
		lw $t4, row_vector($t0) 
		lw $t5, column_vector($t0)
		
		# get the inserted coordinate  
		move $a3, $t3
		move $a2, $t2
		addi $t1, $0, 0
		
		check_1_vector: #loop to increase from vector by t1 time 
			addi $t1, $t1, 1
			beq $t1, 4, done_check_1_vector # increase the vector maximum 3 time from the origin
			
			add $a3, $a3, $t4
			add $a2, $a2, $t5
			
			jal calculate_coordinate
			
			lb $t7, board + 0($v1) #get the character
			lb $t8, X0 + -1($s5) #get the current player character
			bne $t7, $t8,  done_check_1_vector # if both are different, we jump out the loop vector
			
			#both are same char so we increase counter
			addi $t9, $t9, 1
			j check_1_vector
			
		done_check_1_vector:
		
		# now we check the opposite direction
		addi $t0, $t0, 4 #add 4 because of word
		
		# get vector 
		lw $t4, row_vector($t0) 
		lw $t5, column_vector($t0)
		
		# get the inserted coordinate  
		move $a3, $t3
		move $a2, $t2
		addi $t1, $0, 0
		
		check_2_vector: #loop to increase from vector by t1 time 
			addi $t1, $t1, 1
			beq $t1, 4, done_check_2_vector # increase the vector maximum 3 time from the origin
			
			add $a3, $a3, $t4
			add $a2, $a2, $t5
			
			jal calculate_coordinate
			
			lb $t7, board + 0($v1) #get the character
			lb $t8, X0 + -1($s5) #get the current player character
			bne $t7, $t8,  done_check_2_vector # if both are different, we jump out the loop vector
			
			#both are same char so we increase counter
			addi $t9, $t9, 1
			j check_2_vector
			
		done_check_2_vector:
		
		#now we check if t0 >=4 , if it is , we jump return , else we continue 
	
		blt $t9, 4, check_vector #now we check if t9 <4 , if it true we loop the vector again
		
		#it is connected 4 so we return v1 = 1 (win)
		addi $v1, $0, 1	
	
		move $a2, $t2 #assign back the input coordinate
		move $a3, $t3
	
		lw $ra, 0($sp)
		addi $sp, $sp, 4
	
		jr $ra	
		
	end_check_vector:
	
	addi $v1, $0, 0
		
	move $a2, $t2 #assign back the input coordinate
	move $a3, $t3
		
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra		


win_menu: # a1 = case
	addi $a2, $0, 0 
	addi $a3, $0, 0 
	
	jal print_board 
	
	
	li $v0, 4
	la $a0, phase_game_over
	syscall
	
	beq $a1, 3, win_by_violate
	beq $a1, 5, print_draw
	
	beq $s5, 1 , print_x_won_connect_4
	beq $s5, 2 , print_o_won_connect_4
	
	#win by connect 4
	print_x_won_connect_4: 		
		li $v0, 4
		la $a0, x_won_connect_4
		syscall
		j win_menu_break
		
	print_o_won_connect_4: 		
		li $v0, 4
		la $a0, o_won_connect_4
		syscall
		j win_menu_break
	
	win_by_violate:
	beq $s5, 1 , print_o_won_x_violate
	beq $s5, 2 , print_x_won_o_violate
	
	print_x_won_o_violate: 		
		li $v0, 4
		la $a0, x_won_o_violate
		syscall
		j win_menu_break
		
	print_o_won_x_violate: 		
		li $v0, 4
		la $a0, o_won_x_violate
		syscall
		j win_menu_break
	
	print_draw: 		
		li $v0, 4
		la $a0, draw
		syscall
		j win_menu_break
	
	
	win_menu_break:
	
	#receive input	
	li $v0, 12			
	syscall	
	
	j quit
	


calculate_coordinate:  # a2 = row_index(1-6) , a3 = column index (1-7)  return v1 = board index of the input coordinate 
	#save variable 
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $t2, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	
	
	addi $t2, $a2, -1
	lw $t4, row_offset
	mul $t2, $t2, $t4 #mulply row
	
	addi $t3, $a3, -1
	lw $t5, column_offset
	mul $t3, $t3, $t5 #multiply column
	
	lw $v1, initial_offset #offset for first coordinate 1,1 at top left
	add $v1, $v1, $t2
	add $v1, $v1, $t3
	
	#load variable
	lw $ra, 0($sp)
	lw $t2, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	
	addi $sp, $sp, 20
	
	jr $ra

print_phase:

	beq $s5, 1, print_phase_x_turn
	beq $s5, 2, print_phase_o_turn
	
	print_phase_x_turn:
		li $v0, 4
		la $a0, phase_x_turn
		syscall
		j print_phase_break
	
	print_phase_o_turn:
		li $v0, 4
		la $a0, phase_o_turn
		syscall
		j print_phase_break
	
	print_phase_break:
	
	jr $ra


player_violate: #return v1 = 3 if violated, and decrease 	
	
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $a1, 	12($sp)

	

	beq $s5, 1 , player_violate_x
	beq $s5, 2 , player_violate_o
	
	
	player_violate_x:
		lw $t0, x_violation_index 
		lb $t1, board($t0)
		
		beq $t1, '3', player_violate_lose # player x have violate 3 times
		
		addi $t1, $t1, 1
		sb $t1, board($t0) #increase the violation score
		j player_violate_break
	
	player_violate_o:
		lw $t0, o_violation_index 
		lb $t1, board($t0)
		
		beq $t1, '3', player_violate_lose # player 0 have violate 3 times
		
		addi $t1, $t1, 1
		sb $t1, board($t0)#increase the violation score
		j player_violate_break
		
		
	player_violate_break:
	addi $v1, $0, 0
	
	#warning mips menu
	li $v0, 55
	la $a0, violation_warn
	li $a1, 3
	syscall
	
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $a1, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra

	player_violate_lose:
	addi $v1, $0, 1
	
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $a1, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra


check_undo: # return v1 = 1 if undo, else v1 = 0 so no 
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $a1, 	20($sp)

	# assump no undo
	
	beq $s5, 1 , check_undo_x
	beq $s5, 2 , check_undo_o
	
	check_undo_x:
		lw $t0, x_undo_index 
		lb $t1, board($t0)
		
		beq $t1, '0', check_undo_false # player x have used undo 3 times
		
		jal print_board
		jal print_phase
		
		li $v0, 4
		la $a0, undo_ask
		syscall
		
		#receive input	
		li $v0, 12			
		syscall	
		
		bne $v0, 'Y', check_undo_false 

		addi $t1, $t1, -1
		sb $t1, board($t0) #decrease x undo moves
		
		jal clear_slot
		
		lw $t2, x_last_move_index 
		addi $t1, $0 ,63 # 63 is character '?'
		sb $t1, board($t2)
		
		j check_undo_true
	
	check_undo_o:
		lw $t0, o_undo_index 
		lb $t1, board($t0)
		
		beq $t1, '0', check_undo_false # player o have used undo 3 times
		
		jal print_board
		jal print_phase
		
		li $v0, 4
		la $a0, undo_ask
		syscall
		
		#receive input	
		li $v0, 12			
		syscall	
		
		bne $v0, 'Y', check_undo_false 
		
		addi $t1, $t1, -1
		sb $t1, board($t0) #decrease o undo moves
		
		jal clear_slot
		
		lw $t2, o_last_move_index 
		addi $t1, $0 ,63 # 63 is character '?'
		sb $t1, board($t2)
		
		j check_undo_true
		
		
	check_undo_false:
	li $v1, 0

	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $a1, 	20($sp)
	addi $sp, $sp, 24
	
	jr $ra

	check_undo_true:
	li $v1, 1

	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $a1, 	20($sp)
	addi $sp, $sp, 24
	
	jr $ra
	

change_player:

	# get index of the board string to change player

	beq $s5, 1 , change_player_to_o
	beq $s5, 2 , change_player_to_x
	
	
	change_player_to_o:
		addi $s5, $0, 2
		j change_player_break
		
	change_player_to_x:
		addi $s5, $0, 1	
		j change_player_break
		
	change_player_break:
	
	jr $ra

print_board: # the board is just a very long string
	addi $sp , $sp, -4
	sw $ra, 0($sp)
	
	jal flush_console
	
	li $v0, 4
	la $a0,board
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


insert: #  a2 = row_index(1-6) , a3 = column index (1-7)  . 
	#Void : Find middle position of the index, then replace with text shape X (s5 = 1), O (s5 = 2) 
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal calculate_coordinate
	
	
	#line offset
	lw $t7, line_offset 
	add $t6 , $v1, $t7 # bottom line
	sub $t7 , $v1, $t7 # top line
	 
	
	# cases
	beq $s5, 1, insert_x
	beq $s5, 2, insert_o
	
	insert_x:  
		
		addi $t0, $0, 88 # t0 = 88 is ascii for 'X'
		addi $t1, $0, 47 # t0 = 88 is ascii for '/'
		addi $t2, $0, 92 # t0 = 88 is ascii for '\'
		
		#draw X shape
		sb $t0, board+0($v1)
		sb $t2, board+-1($t7)
		sb $t1, board+1($t7)
		sb $t1, board+-1($t6)
		sb $t2, board+1($t6)
		
		#save last move index
		lw $t0, x_last_move_index 
		addi $t1, $a3 , 48 #convert from a3 column int to char
		sb $t1, board($t0)
		
		j insert_return
		
		
	insert_o:
		
		addi $t0, $0, 64 # t0 = 64 is ascii for '@'
		addi $t1, $0, 48 # t1 = 48 is ascii for 'zero'
		
		#draw 0 shape	
		sb $t0,  board+-1($t7)
		sb $t0,  board+0($t7)
		sb $t0,  board+1($t7)
		sb $t0,  board+-2($v1)
		sb $t0,  board+-1($v1)
		sb $t1,  board+0($v1)
		sb $t0,  board+1($v1)
		sb $t0,  board+2($v1)
		sb $t0,  board+-1($t6)
		sb $t0,  board+0($t6)
		sb $t0,  board+1($t6)
		
		#save last move index
		lw $t0, o_last_move_index 
		addi $t1, $a3 , 48 #convert from a3 column int to char
		sb $t1, board($t0)
		
		j insert_return
	
	insert_return:
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra

clear_slot:
	#  a2 = row_index(1-6) , a3 = column index (1-7) . Void : Find middle position of the index, then replace with text shape X
	
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal calculate_coordinate
	
	# t0 = 40 is ascii for 'space'
	addi $t0, $0, 32
	
	#line offset
	lw $t7, line_offset 
	add $t6 , $v1, $t7 # bottom line
	sub $t7 , $v1, $t7 # top line
	 

	#draw space 3x5	
	sb $t0,  board+-2($t6)
	sb $t0,  board+-1($t6)
	sb $t0,  board+-0($t6)	
	sb $t0,  board+ 1($t6)
	sb $t0,  board+ 2($t6)
		
	sb $t0,  board+-2($v1)
	sb $t0,  board+-1($v1)
	sb $t0,  board+0($v1)	
	sb $t0,  board+1($v1)
	sb $t0,  board+2($v1)
		
	sb $t0,  board+-2($t7)
	sb $t0,  board+-1($t7)
	sb $t0,  board+0($t7)	
	sb $t0,  board+1($t7)
	sb $t0,  board+2($t7)


	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra		

	
flush_console: # Use to push all printed messages out of the console space.
	li $v0, 4
	la $a0,new_page
	syscall
	jr $ra
	

quit:
	li $v0, 10
	syscall	
	
