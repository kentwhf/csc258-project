.data
displayAddress: .word 0x10008000
obstacle: 	.word 0x0000ff
jet_color: 	.word 0xff0000
black: 		.word 0x00000000
str: 		.asciiz "Hello World"


.text
lw $t0, displayAddress 		# $t0 stores the base address for display
lw $t1, jet_color		# $t1 stores the jet_color code
lw $t2, obstacle		# $t2 stores the obstacle code
lw $t3, black			# $t3 stores the background color code

addi $t4, $t0, 3776	# initial position of head


# Part III	
START:  
	li $t9, 0xffff0000 
	lw $t8, 0($t9)
	
	# task 1
	jal DRAW

	beq $t8, 1, keypress_happened
	lw $t8, 0($t9)
	j START
	
keypress_happened: 
	lw $t2, 4($t9) # this assumes $t9 is set to 0xfff0000 from before 
	beq $t2, 0x70, respond_to_p 
	beq $t2, 0x77, respond_to_w
	
	respond_to_p:
		li $v0, 4
		la $a0, str
		syscall
		j START
	
	respond_to_w:
		jal ERASE
		subi $t4, $t4, 128	# move head
		
		li $v0, 32		
		li $a0, 500
		syscall			# sleep for 500 milliseconds
		
		jal DRAW
		j START
	j START
	
ERASE:
	sw $t3, 0($t4)	# paint the jet
	sw $t3, 124($t4)
	sw $t3, 128($t4)
	sw $t3, 132($t4)
	sw $t3, 248($t4)
	sw $t3, 256($t4)
	sw $t3, 264($t4)
	jr $ra
	
DRAW:
	sw $t1, 0($t4)	# paint the jet
	sw $t1, 124($t4)
	sw $t1, 128($t4)
	sw $t1, 132($t4)
	sw $t1, 248($t4)
	sw $t1, 256($t4)
	sw $t1, 264($t4)
	jr $ra




