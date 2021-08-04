# CSC258 Summer 2021 Assembly Final Project
# University of Toronto
#
# Student: Mingxuan Teng, 1004070952, tengmin1
#	  Huifeng Wu, 1003802753, wuhuifen
# Bitmap Display Configuration:
# - Unit width in pixels: 8 (update this as needed)
# - Unit height in pixels: 8 (update this as needed)
# - Display width in pixels: 256 (update this as needed)
# - Display height in pixels: 256 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission? Milestone 1
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3 (choose the one that applies)
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes / no / yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:
# - (write here, if any)

.data
    displayAddress: 	.word 0x10008000
    enemy_color: 	.word 0x00ffffff
    jet_color: 		.word 0xff0000
    black: 		.word 0x00000000
    obstacles:    	.word 0:3
    str: 		.asciiz "Hello World"

.text
	lw $t0, displayAddress 		# $t0 stores the base address for display
	lw $t1, jet_color		# $t1 stores the jet_color code
	lw $t2, enemy_color 		# $t2 stores the enemy_color code
	lw $t3, black			# $t3 stores the background color code
    	la $t4, obstacles		# $t4 stores the address of obstacles
	addi $t5, $t0, 3776		# initial position of plane head

Main: 
	j Start

Start:
    	# plane setup
	jal SPACESHIP
	
	# obstacles setup
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
    	    	
    	j LOOP
	

# Init a single obstacle
Obstacle:		
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 42		 
	li $a0, 0
	li $a1, 31
	syscall
	
	addu $t7, $a0, $zero	# x-index
	li $t6, 4
	mul $t7, $t6, $t7	# deal x
	addu $v0, $t5, $0	
	addu $v0, $t0, $t7	# the point
	
	sw $t2, 0($v0)		 # paint 0(t4) the platformscolor code
	sw $t2, 4($v0)		 # paint 4(t4) the platformscolor code
	sw $t2, 128($v0)	 # paint 8(t4) the platformscolor code
	sw $t2, 132($v0)	 # paint 12(t4) the platformscolor code
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# Init a single plane
SPACESHIP:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	sw $t1, 0($t5)		# paint the jet
	sw $t1, 124($t5)
	sw $t1, 128($t5)
	sw $t1, 132($t5)
	sw $t1, 248($t5)
	sw $t1, 256($t5)
	sw $t1, 264($t5)
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

redraw_obstacles:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	bge $s0, $t7, check_redraw_0	
	bge $s1, $t7, check_redraw_1	
	bge $s2, $t7, check_redraw_2	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
check_redraw_0:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal Obstacle
   	add $s0, $v0, 0
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
check_redraw_1:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal Obstacle
    	add $s1, $v0, 0	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
		
check_redraw_2:		
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
		
	jal Obstacle
    	add $s2, $v0, 0	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
   	
   	
LOOP:	
	add $t7, $t0, 4096	
	jal redraw_obstacles
	jal erase_obstacles

	# Keyboard 
	li $t9, 0xffff0000 
	lw $t8, 0($t9)
	
	beq $t8, 1, keypress_happened
	lw $t8, 0($t9)	# resume
		
	# 1st		
	add $s0, $s0, 128
	sw $t2, 0($s0)		 
	sw $t2, 4($s0)		 
	sw $t2, 128($s0)	 
	sw $t2, 132($s0)
	
	# 2nd
	add $s1, $s1, 128
	sw $t2, 0($s1)		 
	sw $t2, 4($s1)		 
	sw $t2, 128($s1)	 
	sw $t2, 132($s1)
	
	# 3rd
	add $s2, $s2, 128
	sw $t2, 0($s2)		 
	sw $t2, 4($s2)		 
	sw $t2, 128($s2)	 
	sw $t2, 132($s2)
		
	j LOOP

keypress_happened:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t8, 4($t9) # this assumes $t9 is set to 0xfff0000 from before 
	beq $t8, 0x70, respond_to_p 
	beq $t8, 0x77, respond_to_w
	beq $t8, 0x1b, respond_to_space
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4

respond_to_space:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal erase_plane
	jal erase_obstacles
	j GAMEOVER
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
respond_to_p:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal erase_plane
	jal erase_obstacles
	addi $t5, $t0, 3776	# initial position of plane head
	j Main

	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	
respond_to_w:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal erase_plane
	subi $t5, $t5, 128	# move head
	jal SPACESHIP
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	

erase_plane:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $v0, 32
	li $a0, 300   # Wait one second (1000 milliseconds)
	syscall

	# Erase plane 
	sw $t3, 0($t5)	
	sw $t3, 124($t5)
	sw $t3, 128($t5)
	sw $t3, 132($t5)
	sw $t3, 248($t5)
	sw $t3, 256($t5)
	sw $t3, 264($t5)
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

erase_obstacles:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 32
	li $a0, 300   # Wait one second (1000 milliseconds)
	syscall

	# Erase the previous
     	sw $t3, 0($s0)		 
	sw $t3, 4($s0)		 
	sw $t3, 128($s0)	 
	sw $t3, 132($s0)
	
	# Erase the previous
	sw $t3, 0($s1)		 
	sw $t3, 4($s1)		 
	sw $t3, 128($s1)	 
	sw $t3, 132($s1)

	# Erase the previous
     	sw $t3, 0($s2)		 
	sw $t3, 4($s2)		 
	sw $t3, 128($s2)	 
	sw $t3, 132($s2)
	
	# pop 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
GAMEOVER:
	addi $t6, $t0, 1164
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)

	addi $t6, $t0, 1164
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t7, $t6, 0
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)

	addi $t6, $t7, 0
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)

	# N
	addi $t6, $t0, 1196
	addi $t7, $t6, 0
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128	
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)

	addi $t6, $t7, 0
	addi $t6, $t6, 4	
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128

	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)
	subi $t6, $t6, 128
	sw $t1, 0($t6)

	# D
	addi $t6, $t0, 1236
	sw $t1, 0($t6)
	addi $t7, $t6, 0
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)

	addi $t6, $t7, 0
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	addi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	subi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	subi $t6, $t6, 4
	sw $t1, 0($t6)
	addi $t6, $t6, 128
	subi $t6, $t6, 4
	sw $t1, 0($t6)
	subi $t6, $t6, 4
	sw $t1, 0($t6)
