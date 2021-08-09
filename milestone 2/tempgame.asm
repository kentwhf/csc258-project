#Temp game.asm for milestone2 and 3
.data
    displayAddress: 	.word 0x10008000
    enemy_color: 	.word 0xff0000
    jet_color: 		.word 0x0000ff
    black: 		.word 0x00000000
    yellow:		.word 0xffff00
    white:		.word 0xffffff
    obstacles:    	.word 0:3
    str: 		.asciiz "Hello World"
    hp: 		.word 3
    bullets:		.word 0:3
    bullets_location:	.word 0:3

.text
	lw $t0, displayAddress 		# $t0 stores the base address for display
	lw $t1, jet_color		# $t1 stores the jet_color code
	lw $t2, enemy_color 		# $t2 stores the enemy_color code
	lw $t3, black			# $t3 stores the background color code
    	la $t4, obstacles		# $t4 stores the address of obstacles
	addi $t5, $t0, 3520		# initial position of plane head
	
	la $t6, bullets_location
	sw $t5, 0($t6)
	sw $t5, 4($t6)
	sw $t5, 8($t6) 
	 
Main: 
	j Start

Start:
    	# plane setup
	jal SPACESHIP
	
	# obstacles setup
    	lw $s0, 0($t4)        # 1st obstacle
    	jal Obstacle
    	add $s0, $v0, 0

    	lw $s1, 0($t4)        # 2nd obstacle
    	jal Obstacle
    	add $s1, $v0, 0

    	lw $s2, 0($t4)        # 3rd obstacle
    	jal Obstacle
    	add $s2, $v0, 0
    
	jal Enemy
	 	 
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
	
	li $t6, 4
	mul $a0, $t6, $a0	# deal x
	addu $v0, $t0, $a0	# the poin
	
	sw $t2, 0($v0)		 # paint 0(t4) the platformscolor code
	sw $t2, 4($v0)		 # paint 4(t4) the platformscolor code
	sw $t2, 128($v0)	 # paint 8(t4) the platformscolor code
	sw $t2, 132($v0)	 # paint 12(t4) the platformscolor code
	
	add $a2, $zero, $v0
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
Enemy:
	li $v0, 42		 
	li $a0, 0
	li $a1, 31
	syscall
	
	li $t6, 4
	mul $a0, $t6, $a0	# deal x
	addu $v0, $t0, $a0	# the point

	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	sw $t1, 0($v0)
	sw $t1, 4($v0)
	sw $t1, 8($v0)
	sw $t1, 132($v0)
	
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

	sw $t1, 120($t5)
	sw $t1, 124($t5)
	sw $t1, 128($t5)
	sw $t1, 132($t5)
	sw $t1, 136($t5)
	
	sw $t1, 252($t5)
	sw $t1, 256($t5)
	sw $t1, 260($t5)
	
	sw $t1, 384($t5)
	
	sw $t1, 508($t5)
	sw $t1, 512($t5)
	sw $t1, 516($t5)
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

check_redraw_obstacles:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $t7, $t0, 4096	

	bge $s0, $t7, redraw_0	
	bge $s1, $t7, redraw_1	
	bge $s2, $t7, redraw_2	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
redraw_0:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal Obstacle
   	add $s0, $v0, 0
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
redraw_1:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal Obstacle
    	add $s1, $v0, 0	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
		
redraw_2:		
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
	jal hp_display
	jal check_redraw_obstacles
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
	
	jal SPACESHIP
	
	# move bullets
	la $t6, bullets
	la $t8, bullets_location
	lw $t7, 0($t6)
	lw $t9, 0($t8)
	jal handle_bullet
	sw $t7, 0($t6)	
	sw $t9, 0($t8)
	sw $t2, 0($t9)
	
	# la $t6, bullets
	la $t8, bullets_location
	lw $t7, 4($t6)
	lw $t9, 4($t8)
	jal handle_bullet
	sw $t7, 4($t6)	
	sw $t9, 4($t8)
	sw $t2, 0($t9)
	
	# la $t6, bullets
	la $t8, bullets_location
	lw $t7, 8($t6)
	lw $t9, 8($t8)
	jal handle_bullet
	sw $t7, 8($t6)	
	sw $t9, 8($t8)	
	sw $t2, 0($t9)

	# collision	
	add $a0, $s0, $zero
	jal detect_collision
	add $a0, $s1, $zero
	jal detect_collision
	add $a0, $s2, $zero
	jal detect_collision
	
	j LOOP
	
handle_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	
	
	beq $t7, 1, move_bullet
	beq $t7, 0, hold_bullet
	blt $t9, $t1, hold_bullet
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
move_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	
	
	sub $t9, $t9, 128
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
hold_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	
	
	move $t9, $t5
	li $t7, 0
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


keypress_happened:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t8, 4($t9) # this assumes $t9 is set to 0xfff0000 from before 
	beq $t8, 0x70, respond_to_p 
	beq $t8, 0x77, respond_to_w
	beq $t8, 0x61, respond_to_a
	beq $t8, 0x73, respond_to_s
	beq $t8, 0x64, respond_to_d
	beq $t8, 0x1b, respond_to_space
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4

respond_to_space:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# jal erase_plane
	# jal erase_obstacles
	# j GAMEOVER
	
	la $t6, bullets
	lw $t7, 0($t6)
	beq $t7, 0, shoot
	sw $t7, 0($t6)	

	lw $t7, 4($t6)
	beq $t7, 0, shoot
	sw $t7, 4($t6)	
	
	lw $t7, 8($t6)
	beq $t7, 0, shoot
	sw $t7, 8($t6)
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
shoot:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t7, 1
	
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
	addi $t5, $t0, 3520	# initial position of plane head
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
	
respond_to_s:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal erase_plane
	addi $t5, $t5, 128	# move head
	jal SPACESHIP
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
respond_to_d:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal erase_plane
	addi $t5, $t5, 4	# move head to right for one pixel
	jal SPACESHIP
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

respond_to_a:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal erase_plane
	subi $t5, $t5, 4	# move head to left for one pixel
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
	li $a0, 20   # Wait one second (1000 milliseconds)
	syscall

	sw $t3, 0($t5)		# paint the jet
	sw $t3, 120($t5)
	sw $t3, 124($t5)
	sw $t3, 128($t5)
	sw $t3, 132($t5)
	sw $t3, 136($t5)
	sw $t3, 252($t5)
	sw $t3, 256($t5)
	sw $t3, 260($t5)
	sw $t3, 384($t5)
	sw $t3, 508($t5)
	sw $t3, 512($t5)
	sw $t3, 516($t5)
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

erase_obstacles:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 32
	li $a0, 20   # Wait one second (1000 milliseconds)
	syscall

	# Erase the previous
	add $a0, $s0, $zero
	jal erase_signle_obstacle
	add $a0, $s1, $zero
	jal erase_signle_obstacle
	add $a0, $s2, $zero
	jal erase_signle_obstacle
	
	# pop 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

erase_signle_obstacle:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# Erase the previous
     	sw $t3, 0($a0)		 
	sw $t3, 4($a0)		 
	sw $t3, 128($a0)	 
	sw $t3, 132($a0)
	
	# pop 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	

detect_collision:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $t6, 0($a0)
	beq $t6, $t1, collision
	lw $t6, 4($a0)
	beq $t6, $t1, collision	
	lw $t6, 128($a0)
	beq $t6, $t1, collision
	lw $t6, 132($a0)
	beq $t6, $t1, collision	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
collision:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal erase_signle_obstacle
	
	beq $a0, $s0, redraw_0	
	beq $a0, $s1, redraw_1	
	beq $a0, $s2, redraw_2	
	
	lw $t7, hp
	sub $t7, $t7, 1
	sw $t7, hp	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
hp_display:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	lw $t6, yellow	# initial hp counter
	sw $t6, 0($t0)	# H
	sw $t6, 128($t0)
	sw $t6, 256($t0)	
	sw $t6, 132($t0)
	sw $t6, 8($t0)
	sw $t6, 136($t0)
	sw $t6, 264($t0)
	sw $t6, 16($t0) # P
	sw $t6, 144($t0) 
	sw $t6, 272($t0)
	sw $t6, 20($t0) 
	sw $t6, 148($t0) 
	
	# number of lives
	lw $t7, hp
	addi $t9, $t0, 156
	li $t8, 0
	
	sw $t3, 0($t9) 
	sw $t3, 4($t9)
	sw $t3, 8($t9) 

	bgt $t7, 0, draw_hp_block
	beq $t7, 0, GAMEOVER

	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	

	
draw_hp_block:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	

	sw $t6, 0($t9) 
	add $t8, $t8, 1
	add $t9, $t9, 4
	bne $t8, $t7, draw_hp_block

	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

digit_1:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	sw $t6, 0($a0)
	sw $t6, 128($a0) 
	sw $t6, 256($a0) 
	
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
