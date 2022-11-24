.data 
	#board string and size offset
	board:		.asciiz "          _      ___     ____    _ _     ___      __     ____  \n         / |    |_  )   |__ /   | | |   | __|    / /    |__  | \n         | |     / /     |_ \\   |_  _|  |__ \\   / _ \\     / /  \n         |_|    /___|   |___/     |_|   |___/   \\___/    /_/   \n                                                               \n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |       |       |       |       |       |       |       |\n      |_______|_______|_______|_______|_______|_______|_______|\n                                                               \n                                                               \n"
	
	initial_offset:	.word 	394
	row_offset:	.word 	256
	column_offset:	.word 	8
	
	# pair of row-column vector 
	row_vector:	.word	0,	0,	1,	-1,	1,	-1,	-1,	1
	column_vector:	.word	1,	-1,	1,	-1,	0,	0,	1,	-1
	
	
	#menu string
	welcome: 	.asciiz "               WELCOME TO                        \n  ______    ______   __    __  __    __  ________   ______  ________        __    __ \n /      \\  /      \\ |  \\  |  \\|  \\  |  \\|        \\ /      \\|        \\      |  \\  |  \\\n|  $$$$$$\\|  $$$$$$\\| $$\\ | $$| $$\\ | $$| $$$$$$$$|  $$$$$$\\\\$$$$$$$$      | $$  | $$\n| $$   \\$$| $$  | $$| $$$\\| $$| $$$\\| $$| $$__    | $$   \\$$  | $$         | $$__| $$\n| $$      | $$  | $$| $$$$\\ $$| $$$$\\ $$| $$  \\   | $$        | $$         | $$    $$\n| $$   __ | $$  | $$| $$\\$$ $$| $$\\$$ $$| $$$$$   | $$   __   | $$          \\$$$$$$$$\n| $$__/  \\| $$__/ $$| $$ \\$$$$| $$ \\$$$$| $$_____ | $$__/  \\  | $$               | $$\n \\$$    $$ \\$$    $$| $$  \\$$$| $$  \\$$$| $$     \\ \\$$    $$  | $$               | $$\n  \\$$$$$$   \\$$$$$$  \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$  \\$$$$$$    \\$$                \\$$\n\n                                            by BANH TAN THUAN - 2153011\n"
	menu_choice: 	.asciiz "\n\n   .---------------.              .---------------. \n  | .-------------. |            | .-------------. |\n  | |  1. Start   | |            | |  2. Guide   | |\n  | '-------------' |            | '-------------' |\n   '---------------'              '---------------' \n\n"
	menu_error_1_2:	.asciiz "\nTHE CHOICE YOU'VE ENTERED IS NOT IN THE SPECIFIED RANGE (1-2). PLEASE ENTER THE RIGHT CHOICE: "


	X0:		.asciiz "X0"
	x_input:	.asciiz "\nX TURN'S : "
	o_input:	.asciiz "\nO TURN'S : "
        turn_error_1_7:	.asciiz "\nTHE CHOICE YOU'VE ENTERED IS NOT IN THE SLOT RANGE (1-7). PLEASE ENTER THE RIGHT CHOICE: "
	occupied:	.asciiz "\NTHE COLUMN IS FULL, PLEASE ENTER OTHER COLUMN:"
	  	
	# win_menu string
	x_won:	.asciiz "X WON !"
	o_won:	.asciiz "O WON !"
	
	
	new_page:        .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	endl:	.asciiz "\n"
	
	
	
	
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
	
	addi $a3, $0, 3
	addi $a2, $0, 6
	jal insert	
	
	jal print_board
	
	j quit	
	
game_loop: # a1 = case
	#reset variable
	addi $a2, $0, 0 
	addi $a3, $0, 0 
	
	jal print_board 
	
	beq $a1, 1 , print_x_input
	beq $a1, 2 , print_o_input
	beq $a1, 3 , print_turn_error_1_7
	beq $a1, 4 , print_occupied
	
	print_x_input: 		
		li $v0, 4
		la $a0, x_input
		syscall
		j game_loop_print_break
		
	print_o_input: 		
		li $v0, 4
		la $a0, o_input
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
	
	# assuming wrong player input and check it
	addi $a1, $0, 3
	
	blt $v0, '1', game_loop
	bgt $v0, '7', game_loop
	
	
	#check occuptation by assuming fulled column
	add $a1, $0, 4
	addi $a3, $v0, -48 #change char to int
	
	addi $a2, $0, 1
	jal calculate_coordinate # return v1 is the array index
	
	
	lb $t1,  board+0($v1)
	bne $t1, ' ', game_loop
	
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
	

	jal change_player
	move $a1, $s5
	
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
		
		
		li $v0, 4
		la $a0, endl
		syscall
		
		li $v0, 1
		addi $a0, $t9, 0
		syscall
		#now we check if t0 >=4 , if it is , we jump return , else we continue 
	
		blt $t9, 4, check_vector #now we check if t9 <4 , if it true we loop the vector again
		
		#it is connected 4 so we return v1 = 1 (win)
		addi $v1, $0, 1	
	
		lw $ra, 0($sp)
		addi $sp, $sp, 4
	
		jr $ra	
		
	end_check_vector:
	
	addi $v1, $0, 0
		
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra		


win_menu: # a1 = case
	addi $a2, $0, 0 
	addi $a3, $0, 0 
	
	jal print_board 
	
	beq $s5, 1 , print_x_won
	beq $s5, 2 , print_o_won

	print_x_won: 		
		li $v0, 4
		la $a0, x_won
		syscall
		j win_menu_print_break
		
	print_o_won: 		
		li $v0, 4
		la $a0, o_won
		syscall
		j win_menu_print_break
	
	win_menu_print_break:
	
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

change_player:

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
	
	# cases
	beq $s5, 1, insert_x
	beq $s5, 2, insert_o
	
	insert_x:  
		
		addi $t0, $0, 88 # t0 = 88 is ascii for 'X'
		addi $t1, $0, 47 # t0 = 88 is ascii for '/'
		addi $t2, $0, 92 # t0 = 88 is ascii for '\'
		
		#draw X shape
		sb $t0, board+0($v1)
		sb $t2, board+-65($v1)
		sb $t1, board+-63($v1)
		sb $t1, board+63($v1)
		sb $t2, board+65($v1)
		
		j insert_return
		
		
	insert_o:
		
		addi $t0, $0, 64 # t0 = 64 is ascii for '@'
		addi $t1, $0, 48 # t1 = 48 is ascii for 'zero'
		
		#draw 0 shape	
		sb $t0,  board+-65($v1)
		sb $t0,  board+-64($v1)
		sb $t0,  board+-63($v1)
		sb $t0,  board+-2($v1)
		sb $t0,  board+-1($v1)
		sb $t1,  board+0($v1)
		sb $t0,  board+1($v1)
		sb $t0,  board+2($v1)
		sb $t0,  board+63($v1)
		sb $t0,  board+64($v1)
		sb $t0,  board+65($v1)
		
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
	addi $t0, $0, 40

	#draw space 3x5	
	sb $t0,  board+-66($v1)
	sb $t0,  board+-65($v1)
	sb $t0,  board+-64($v1)	
	sb $t0,  board+-63($v1)
	sb $t0,  board+-62($v1)
		
	sb $t0,  board+-2($v1)
	sb $t0,  board+-1($v1)
	sb $t0,  board+0($v1)	
	sb $t0,  board+1($v1)
	sb $t0,  board+2($v1)
		
	sb $t0,  board+63($v1)
	sb $t0,  board+63($v1)
	sb $t0,  board+64($v1)	
	sb $t0,  board+65($v1)
	sb $t0,  board+66($v1)


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
	
