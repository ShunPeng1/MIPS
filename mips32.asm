.data
	newpage:  .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
 	newline : .asciiz "\n" 	
 	
 	menu:		.asciiz	"\nCalculate the derivative of the function aX^2 + bX + c "
	ans:		.asciiz "The derivative of the function is : "
	
	enter_u:		.asciiz "\nInput the above range : u = "
	enter_v:		.asciiz "\nInput the beloq range : v = "
	enter_a:		.asciiz "\nInput the a : "
	enter_b:		.asciiz "\nInput the b : "
	enter_c:		.asciiz "\nInput the c : "
	
.text
main:
	
	li $v0 , 4
	la $a0 , newpage
	syscall	
	
	
	li $v0 , 4
	la $a0 , menu
	syscall	


	li $v0 , 4
	la $a0 , enter_u
	syscall			
	
	li $v0, 7
	syscall
	add.d $f2, $f0, $f30
		

	
	li $v0 , 4
	la $a0 , enter_v
	syscall			
	
	li $v0, 7
	syscall
	add.d $f4, $f0, $f30
	
	
	li $v0 , 4
	la $a0 , enter_a
	syscall			
	
	li $v0, 7
	syscall
	add.d $f6, $f0, $f30
	
	
	li $v0 , 4
	la $a0 , enter_b
	syscall			
	
	li $v0, 7
	syscall
	add.d $f8, $f0, $f30
							

	
	li $v0 , 4
	la $a0 , enter_c
	syscall			
	
	li $v0, 7
	syscall
	add.d $f10, $f0, $f30																	
	
	
	addi $s6, $0, -1
	addi $s7, $0, 10000 # num of sub part
	sub.d $f14, $f2, $f4 
	
	mtc1.d $s7, $f16
  	cvt.d.w $f16, $f16 # f16 is sub part
  	
  	div.d $f14, $f14, $f16 # length / sub part

	loop_area:
		addi $s6, $s6, 1	
		beq $s6, $s7, break_out
		
		mtc1.d $s6, $f16 #current sub part
  		cvt.d.w $f16, $f16 # f16 is sub part
  	
		
		mul.d $f18, $f14, $f16 # current offset
		add.d $f20, $f18, $f4  # current x
		
		# calculate y
		mul.d $f22, $f20, $f20 # x^2
		mul.d $f22, $f6, $f22 # ax^2
		
		mul.d $f24, $f8, $f20 # bx
		
		add.d $f24, $f22 ,$f24 #ax^2 + bx
		add.d $f24, $f24, $f10 # ax^2 + bx + c 
		
		mul.d $f26, $f24, $f14
		add.d $f28, $f28, $f26 # current total
	
		j loop_area

	break_out:
	
	
	li $v0 , 4
	la $a0 , newpage
	syscall	
	
	
	li $v0 , 3
	add.d $f12, $f28, $f30
	syscall	
		
		
quit:
	li $v0, 10
	syscall
	