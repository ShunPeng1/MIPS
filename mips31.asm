.data
	newpage:  .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
 	newline : .asciiz "\n" 	
 	
 	shape_choice:		.asciiz	"\nChoose a shape to calculate the area:\n1:   Circle\n2:   Triangle\n3:   Rectangle\n4:   Square\nYour choice is"

	circle_radius:  	.asciiz "\nInput the circle radius : "
	circle_pi:		.double 3.14

	triangle_height: 	.asciiz "\nInput the triangle height : "
	triangle_base:  	.asciiz "\nInput the triangle base : "
	triangle_half:		.double 0.5
	
	rectangle_width:  	.asciiz "\nInput the rectangle width : "
	rectangle_height:  	.asciiz "\nInput the rectangle height : "
	
	square_width: 	 	.asciiz "\nInput the square width : "
.text
main:
	
	
	li $v0 , 4
	la $a0 , newpage
	syscall	
	
	
	
	li $v0 , 4
	la $a0 , shape_choice
	syscall	

	li $v0 , 12
	syscall	

	beq $v0, '1', circle
	beq $v0, '2', triangle
	beq $v0, '3', rectangle
	beq $v0, '4', square
	
	j main
	
	circle: 

		li $v0 , 4
		la $a0 , circle_radius
		syscall			
	
		li $v0, 7
		syscall
		
		mul.d $f30, $f0, $f0
		
		l.d $f2, circle_pi 
		
		mul.d $f30, $f30, $f2
		
		
		li $v0 , 3
		add.d $f12 , $f30, $f20
		syscall	
		
		j quit
	
	triangle:
		
		li $v0 , 4
		la $a0 , triangle_height
		syscall			
	
		li $v0, 7
		syscall
		add.d $f2, $f0, $f30

		li $v0 , 4
		la $a0 , triangle_base
		syscall			
	
		li $v0, 7
		syscall	
		add.d $f4, $f0, $f30

		mul.d $f12, $f2, $f4
		l.d $f6, triangle_half 
		
		mul.d $f12, $f12, $f6
		
		
		li $v0 , 3
		syscall	
		
		j quit
		
		
		
	rectangle:
		
		li $v0 , 4
		la $a0 , rectangle_height
		syscall			
	
		li $v0, 7
		syscall
		add.d $f2, $f0, $f30

		li $v0 , 4
		la $a0 , rectangle_width
		syscall			
	
		li $v0, 7
		syscall	
		add.d $f4, $f0, $f30

		mul.d $f12, $f2, $f4
		
		li $v0 , 3
		syscall	
		
		j quit
		
	
	square:
	
		
		li $v0 , 4
		la $a0 , square_width
		syscall			
	
		li $v0, 7
		syscall
		add.d $f2, $f0, $f30

		mul.d $f12, $f2, $f2
		
		li $v0 , 3
		syscall	
		
		j quit
		
quit:
	li $v0, 10
	syscall
	