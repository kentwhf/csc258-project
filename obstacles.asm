# obstacles

.data
    displayAddress: 	.word 0x10008000
    enemy_color: 	.word 0x00ffffff
    jet_color: 		.word 0x0000ff
    black: 		.word 0x00000000
    obstacles:    	.word 0:3

.text
	lw $t0, displayAddress 		# $t0 stores the base address for display
	lw $t1, jet_color		# $t1 stores the jet_color code
	lw $t2, enemy_color 		# $t2 stores the enemy_color code
	lw $t3, black			# $t3 stores the background color code
    	la $t4, obstacles

	li $s4, 32 			# Store the Upper bond of Y
	addi $t8, $zero, 4		# To operate on X
	addi $t9, $zero, 128		# To operate on Y

Main: 
	j Start

Start:
    	# move stack pointer a work and push ra onto it
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	add $s0, $t4, 0
    	lw $s0, ($s0)        # 1st obstacle
    	jal Obstacle
    	add $s0, $v0, 0

	add $s1, $t4, 4
    	lw $s1, ($s1)        # 2nd obstacle
    	jal Obstacle
    	add $s1, $v0, 0

    	add $s2, $t4, 8
    	lw $s2, ($s2)        # 3rd obstacle
    	jal Obstacle
    	add $s2, $v0, 0
    	
    	j Drop
	

# Init a single obstacle
Obstacle:		
	li $v0, 42		 
	li $a0, 0
	li $a1, 31
	syscall
	
	addu $t5, $a0, $zero	# x-index
	mul $t5, $t8, $t5	# deal x
	addu $v0, $t5, $0	
	addu $v0, $t0, $t5	# the point
	
	sw $t2, 0($v0)		 # paint 0(t4) the platformscolor code
	sw $t2, 4($v0)		 # paint 4(t4) the platformscolor code
	sw $t2, 128($v0)	 # paint 8(t4) the platformscolor code
	sw $t2, 132($v0)	 # paint 12(t4) the platformscolor code
	
	jr $ra
	

check_redraw_0:	
	jal Obstacle
    	add $s0, $v0, 0

check_redraw_1:	
	jal Obstacle
    	add $s1, $v0, 0	
    	
check_redraw_2:			
	jal Obstacle
    	add $s2, $v0, 0	

Drop:	
	add $t7, $t0, 4096	
	bgt $s0, $t7, check_redraw_0	
	bgt $s1, $t7, check_redraw_1	
	bgt $s2, $t7, check_redraw_2		
	
	# 1st 
	# Erase the previous
     	sw $t3, 0($s2)		 
	sw $t3, 4($s2)		 
	sw $t3, 128($s2)	 
	sw $t3, 132($s2)

	add $s2, $s2, 128
	sw $t2, 0($s2)		 
	sw $t2, 4($s2)		 
	sw $t2, 128($s2)	 
	sw $t2, 132($s2)
	
	# 2nd
	# Erase the previous
     	sw $t3, 0($s1)		 
	sw $t3, 4($s1)		 
	sw $t3, 128($s1)	 
	sw $t3, 132($s1)

	add $s1, $s1, 128
	sw $t2, 0($s1)		 
	sw $t2, 4($s1)		 
	sw $t2, 128($s1)	 
	sw $t2, 132($s1)
	
	# 3rd
	# Erase the previous
     	sw $t3, 0($s0)		 
	sw $t3, 4($s0)		 
	sw $t3, 128($s0)	 
	sw $t3, 132($s0)
	
	add $s0, $s0, 128
	sw $t2, 0($s0)		 
	sw $t2, 4($s0)		 
	sw $t2, 128($s0)	 
	sw $t2, 132($s0)
	
	# delay	
	li $v0, 32		
	li $a0, 100
	syscall
	
	j Drop
	


	
