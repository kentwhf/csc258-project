#obstacles

.data
displayAddress: .word 0x10008000
enemy_color: 	.word 0x00ffffff
jet_color: 	.word 0x0000ff
black: 		.word 0x00000000


.text
	lw $t0, displayAddress 		# $t0 stores the base address for display
	lw $t1, jet_color		# $t1 stores the jet_color code
	lw $t2, enemy_color 		# $t2 stores the enemy_color code
	lw $t3, black
				# $t3 stores the background color code
	li $v0, 42		 
	li $a0, 30
	li $a1, 32
	syscall 		 # randomly generate a number $a0 between 0 and 28
	
	addu $s0, $a0, $zero	# $s0=x
	
	li $v0, 42		 
	li $a0,0
	li $a1, 2
	syscall
	
	addu $s1, $a0, $zero	# $s1=y
	
	addi $t7, $zero, 4	 # $t789 stores
	#addi $t8, $zero, 31
	addi $t9, $zero, 128
	#subu $s1, $t8, $s1
	mul $s1, $t9, $s1	# deal y
	mul $s0, $t7, $s0	# deal x
	addu $t5, $s0, $s1	
	addu $t5, $t0, $t5	# the point
	
	sw $t2, 0($t5)		 # paint 0(t4) the platformscolor code
	sw $t2, 4($t5)		 # paint 4(t4) the platformscolor code
	sw $t2, 128($t5)	 # paint 8(t4) the platformscolor code
	sw $t2, 132($t5)	 # paint 12(t4) the platformscolor code