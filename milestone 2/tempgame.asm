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
	
	addi $s6, $t0, 1696             # Initial point to show the First digit score
    	addi $s7, $t0, 1744		# Initial point to show the Second digit score
    	addi $s4, $0, 0                 # Count the score
    	
	 
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
    
	# jal Enemy
	 	 
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
	
	li $s6, 4
	mul $a0, $s6, $a0	# deal x
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
	
	addi $s4, $s4, 1
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
	
	addi $s4, $s4, 1
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
	
	addi $s4, $s4, 1	
	jal Obstacle
    	add $s2, $v0, 0	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
   	
   	
LOOP:	
	jal hp_display
	jal check_redraw_obstacles

	# Keyboard 
	li $t9, 0xffff0000 
	lw $t8, 0($t9)
	
	beq $t8, 1, keypress_happened
	lw $t8, 0($t9)	# resume
	
	lw $s4, white
	# move bullets
	la $t6, bullets
	la $t8, bullets_location
	lw $t7, 0($t6)
	lw $t9, 0($t8)
	jal handle_bullet
	sw $t7, 0($t6)	
	sw $t9, 0($t8)
	sw $s4, 0($t9)
	
	# la $t6, bullets
	# la $t8, bullets_location
	lw $t7, 4($t6)
	lw $t9, 4($t8)
	jal handle_bullet
	sw $t7, 4($t6)	
	sw $t9, 4($t8)
	sw $s4, 0($t9)
	
	# la $t6, bullets
	# la $t8, bullets_location
	lw $t7, 8($t6)
	lw $t9, 8($t8)
	jal handle_bullet
	sw $t7, 8($t6)	
	sw $t9, 8($t8)	
	sw $s4, 0($t9)
	
	jal erase_obstacles
	# speed ajustment	
	lw $s5, hp
	beq $s5, 3, normal_speed
	ble $s5, 2, speed_up		
	
	jal SPACESHIP
		
	# collision	
	add $a0, $s0, $zero
	jal detect_collision
	add $a0, $s1, $zero
	jal detect_collision
	add $a0, $s2, $zero
	jal detect_collision
	
	j LOOP
	

normal_speed:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	

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
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
speed_up:	
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# 1st		
	add $s0, $s0, 256
	sw $t2, 0($s0)		 
	sw $t2, 4($s0)		 
	sw $t2, 128($s0)	 
	sw $t2, 132($s0)
	
	# 2nd
	add $s1, $s1, 256
	sw $t2, 0($s1)		 
	sw $t2, 4($s1)		 
	sw $t2, 128($s1)	 
	sw $t2, 132($s1)
	
	# 3rd
	add $s2, $s2, 256
	sw $t2, 0($s2)		 
	sw $t2, 4($s2)		 
	sw $t2, 128($s2)	 
	sw $t2, 132($s2)

	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

handle_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	

	blt $t9, $t0, hold_bullet
	beq $t7, 0, hold_bullet
	
	move $a0, $s0
	add $s3, $a0, 0
	beq $s3, $t9, collision_2
	add $s3, $a0, 4
	beq $s3, $t9, collision_2
	add $s3, $a0, 128
	beq $s3, $t9, collision_2
	add $s3, $a0, 132
	beq $s3, $t9, collision_2
	add $s3, $a0, 256
	beq $s3, $t9, collision_2
	add $s3, $a0, 260
	beq $s3, $t9, collision_2
	
	move $a0, $s1
	add $s3, $a0, 0
	beq $s3, $t9, collision_2
	add $s3, $a0, 4
	beq $s3, $t9, collision_2
	add $s3, $a0, 128
	beq $s3, $t9, collision_2
	add $s3, $a0, 132
	beq $s3, $t9, collision_2
	add $s3, $a0, 256
	beq $s3, $t9, collision_2
	add $s3, $a0, 260
	beq $s3, $t9, collision_2
	
	move $a0, $s2
	add $s3, $a0, 0
	beq $s3, $t9, collision_2
	add $s3, $a0, 4
	beq $s3, $t9, collision_2
	add $s3, $a0, 128
	beq $s3, $t9, collision_2
	add $s3, $a0, 132
	beq $s3, $t9, collision_2
	add $s3, $a0, 256
	beq $s3, $t9, collision_2
	add $s3, $a0, 260
	beq $s3, $t9, collision_2
						
	beq $t7, 1, move_bullet
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
move_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	
	
	sw $t3, 0($t9)	
	sub $t9, $t9, 128
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
hold_bullet:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)	
	
	sw $t3, 0($t9)
	add $t9, $t5, 0
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
	# lw $t7, bullets
	lw $t7, 0($t6)
	beq $t7, 0, shoot

	add $t6, $t6, 4
	lw $t7, 0($t6)
	beq $t7, 0, shoot
	
	add $t6, $t6, 4
	lw $t7, 0($t6)
	beq $t7, 0, shoot
	
	shoot:
	li $t7, 1
	sw $t7, 0($t6)
	
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
	li $a0, 0   # Wait one second (1000 milliseconds)
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
	li $a0, 0   # Wait one second (1000 milliseconds)
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

	# lw $s4, white
	lw $s6, 0($a0)
	add $s3, $a0, 0
	beq $s6, $t1, collision_1
	# beq $s6, $s4, collision_2
	lw $s6, 4($a0)
	add $s3, $a0, 4
	beq $s6, $t1, collision_1
	# beq $s6, $s4, collision_2
	lw $s6, 128($a0)
	add $s3, $a0, 128
	beq $s6, $t1, collision_1
	# beq $s6, $s4, collision_2
	lw $s6, 132($a0)
	add $s3, $a0, 132
	beq $s6, $t1, collision_1
	# beq $s6, $s4, collision_2	
	
	# pop
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
collision_1:
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
	
collision_2:
	# push
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal hold_bullet
	
	# la $t6, bullets
	# la $t8, bullets_location
	# lw $t7, 0($t6)
	# lw $t9, 0($t8)
	# beq $s3, $t9, hold_bullet
	# sw $t7, 0($t6)
	# sw $t9, 0($t8)
	
	# lw $t7, 4($t6)
	# lw $t9, 4($t8)
	# beq $s3, $t9, hold_bullet
	# sw $t7, 4($t6)
	# sw $t9, 4($t8)

	# lw $t7, 8($t6)
	#lw $t9, 8($t8)
	# beq $s3, $t9, hold_bullet
	# sw $t7, 8($t6)
	# sw $t9, 8($t8)
	
	jal erase_signle_obstacle
	
	beq $a0, $s0, redraw_0	
	beq $a0, $s1, redraw_1	
	beq $a0, $s2, redraw_2	

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



GAMEOVER:
	#sw $t1, 16($t0)
	# E
	sw $t1, 144($t0)
	sw $t1, 272($t0)
	sw $t1, 400($t0)
	sw $t1, 528($t0)
	sw $t1, 656($t0)
	sw $t1, 148($t0)
	sw $t1, 152($t0)
	sw $t1, 404($t0)
	sw $t1, 408($t0)
	sw $t1, 660($t0)
	sw $t1, 664($t0)
	
	# N
	sw $t1, 168($t0)
	sw $t1, 172($t0)
	sw $t1, 296($t0)
	sw $t1, 304($t0)
	sw $t1, 424($t0)
	sw $t1, 432($t0)
	sw $t1, 552($t0)
	sw $t1, 564($t0)
	sw $t1, 680($t0)
	sw $t1, 696($t0)
	sw $t1, 568($t0)
	sw $t1, 440($t0)
	sw $t1, 312($t0)
	sw $t1, 184($t0)
	
	#D
	sw $t1, 196($t0)
	sw $t1, 324($t0)
	sw $t1, 452($t0)
	sw $t1, 580($t0)
	sw $t1, 708($t0)
	sw $t1, 200($t0)
	sw $t1, 332($t0)
	sw $t1, 464($t0)
	sw $t1, 588($t0)
	sw $t1, 712($t0)

	#Score
	#S
	sw $t2, 1040($t0)
	sw $t2, 904($t0)
	sw $t2, 908($t0)
	sw $t2, 1028($t0)
	sw $t2, 1160($t0)
	sw $t2, 1292($t0)
	sw $t2, 1424($t0)
	sw $t2, 1548($t0)
	sw $t2, 1544($t0)
	sw $t2, 1412($t0)
	
	#sw $t2, 1060($t0)
	#C
	sw $t2, 924($t0)
	sw $t2, 928($t0)
	sw $t2, 1048($t0)
	sw $t2, 1176($t0)
	sw $t2, 1304($t0)
	sw $t2, 1436($t0)
	sw $t2, 1440($t0)
	#sw $t2, 1316($t0)
	
	#O
	sw $t2, 940($t0)
	sw $t2, 944($t0)
	sw $t2, 1064($t0)
	sw $t2, 1192($t0)
	sw $t2, 1076($t0)
	sw $t2, 1204($t0)
	sw $t2, 1332($t0)
	sw $t2, 1320($t0)
	sw $t2, 1456($t0)
	sw $t2, 1452($t0)
	
	#r
	sw $t2, 956($t0)
	sw $t2, 1084($t0)
	sw $t2, 1212($t0)
	sw $t2, 1340($t0)
	sw $t2, 1468($t0)
	sw $t2, 1216($t0)
	sw $t2, 1092($t0)
	sw $t2, 968($t0)
	
	#e
	sw $t2, 976($t0)
	sw $t2, 1104($t0)
	sw $t2, 1232($t0)
	sw $t2, 1360($t0)
	sw $t2, 1488($t0)
	sw $t2, 980($t0)
	sw $t2, 984($t0)
	sw $t2, 1236($t0)
	sw $t2, 1240($t0)
	sw $t2, 1492($t0)
	sw $t2, 1496($t0)
	
	jal Check_first


Check_first:
	addi $t8, $0, 10
	div $s4, $t8
	
	mflo $t9
	
	beq $t9, 0, First_zero
	beq $t9, 1, First_one
	beq $t9, 2, First_two
	beq $t9, 3, First_three
	beq $t9, 4, First_four
	beq $t9, 5, First_five
	beq $t9, 6, First_six
	beq $t9, 7, First_seven
	beq $t9, 8, First_eight
	beq $t9, 9, First_nine
	
Check_second:

	addi $t8, $0, 10
	div $s4, $t8
	mfhi $t9
	
	beq $t9, 0, Second_zero
	beq $t9, 1, Second_one
	beq $t9, 2, Second_two
	beq $t9, 3, Second_three
	beq $t9, 4, Second_four
	beq $t9, 5, Second_five
	beq $t9, 6, Second_six
	beq $t9, 7, Second_seven
	beq $t9, 8, Second_eight
	beq $t9, 9, Second_nine
	
#0
First_zero:
	
	
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	sw $t1, 128($s6)
	sw $t1, 144($s6)
	sw $t1, 256($s6)
	sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 400($s6)
	sw $t1, 512($s6)
	sw $t1, 528($s6)
	sw $t1, 640($s6)
	sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second
	
	
	

Second_zero:
	
	
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	sw $t1, 128($s7)
	sw $t1, 144($s7)
	sw $t1, 256($s7)
	sw $t1, 272($s7)
	sw $t1, 384($s7)
	sw $t1, 400($s7)
	sw $t1, 512($s7)
	sw $t1, 528($s7)
	sw $t1, 640($s7)
	sw $t1, 656($s7)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall
	
	

	
#1
First_one:
	sw $t1, 8($s6)
	sw $t1, 136($s6)
	sw $t1, 264($s6)
	sw $t1, 392($s6)
	sw $t1, 520($s6)
	sw $t1, 648($s6)
	sw $t1, 776($s6)
	
	jal Check_second
	
Second_one:
	sw $t1, 8($s7)
	sw $t1, 136($s7)
	sw $t1, 264($s7)
	sw $t1, 392($s7)
	sw $t1, 520($s7)
	sw $t1, 648($s7)
	sw $t1, 776($s7)
	
	li $v0, 10
	syscall


#2
First_two:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	#sw $t1, 128($s6)
	sw $t1, 144($s6)
	#sw $t1, 256($s6)
	sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	sw $t1, 512($s6)
	#sw $t1, 528($s6)
	sw $t1, 640($s6)
	#sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second

Second_two:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	#sw $t1, 128($s6)
	sw $t1, 144($s7)
	#sw $t1, 256($s6)
	sw $t1, 272($s7)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	sw $t1, 512($s7)
	#sw $t1, 528($s6)
	sw $t1, 640($s7)
	#sw $t1, 656($s6)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall

#3
First_three:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	#sw $t1, 128($s6)
	sw $t1, 144($s6)
	#sw $t1, 256($s6)
	sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	#sw $t1, 512($s6)
	sw $t1, 528($s6)
	#sw $t1, 640($s6)
	sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second
	
Second_three:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	#sw $t1, 128($s6)
	sw $t1, 144($s7)
	#sw $t1, 256($s6)
	sw $t1, 272($s7)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	#sw $t1, 512($s6)
	sw $t1, 528($s7)
	#sw $t1, 640($s6)
	sw $t1, 656($s7)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall
	
#4
First_four:
	sw $t1, 0($s6)
	sw $t1, 8($s6)
	#sw $t1, 12($s6)
	#sw $t1, 16($s6)
	sw $t1, 128($s6)
	#sw $t1, 144($s6)
	sw $t1, 256($s6)
	#sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	#sw $t1, 512($s6)
	#sw $t1, 528($s6)
	#sw $t1, 640($s6)
	#sw $t1, 656($s6)
	#sw $t1, 768($s6)
	#sw $t1, 784($s6)
	#sw $t1, 772($s6)
	#sw $t1, 776($s6)
	#sw $t1, 780($s6)
	sw $t1, 136($s6)
	sw $t1, 264($s6)
	sw $t1, 392($s6)
	sw $t1, 520($s6)
	sw $t1, 648($s6)
	sw $t1, 776($s6)
	
	jal Check_second
	
Second_four:
	sw $t1, 0($s7)
	sw $t1, 8($s7)
	#sw $t1, 12($s6)
	#sw $t1, 16($s6)
	sw $t1, 128($s7)
	#sw $t1, 144($s6)
	sw $t1, 256($s7)
	#sw $t1, 272($s6)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	#sw $t1, 512($s6)
	#sw $t1, 528($s6)
	#sw $t1, 640($s6)
	#sw $t1, 656($s6)
	#sw $t1, 768($s6)
	#sw $t1, 784($s6)
	#sw $t1, 772($s6)
	#sw $t1, 776($s6)
	#sw $t1, 780($s6)
	sw $t1, 136($s7)
	sw $t1, 264($s7)
	sw $t1, 392($s7)
	sw $t1, 520($s7)
	sw $t1, 648($s7)
	sw $t1, 776($s7)
	
	li $v0, 10
	syscall
#5	
First_five:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	sw $t1, 128($s6)
	#sw $t1, 144($s6)
	sw $t1, 256($s6)
	#sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	#sw $t1, 512($s6)
	sw $t1, 528($s6)
	#sw $t1, 640($s6)
	sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second

Second_five:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	sw $t1, 128($s7)
	#sw $t1, 144($s6)
	sw $t1, 256($s7)
	#sw $t1, 272($s6)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	#sw $t1, 512($s6)
	sw $t1, 528($s7)
	#sw $t1, 640($s6)
	sw $t1, 656($s7)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall

#6
First_six:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	sw $t1, 128($s6)
	#sw $t1, 144($s6)
	sw $t1, 256($s6)
	#sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	sw $t1, 512($s6)
	sw $t1, 528($s6)
	sw $t1, 640($s6)
	sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second
	
Second_six:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	sw $t1, 128($s7)
	#sw $t1, 144($s6)
	sw $t1, 256($s7)
	#sw $t1, 272($s6)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	sw $t1, 512($s7)
	sw $t1, 528($s7)
	sw $t1, 640($s7)
	sw $t1, 656($s7)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall
	
#7
First_seven:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	#sw $t1, 128($s6)
	sw $t1, 144($s6)
	#sw $t1, 256($s6)
	sw $t1, 272($s6)
	#sw $t1, 384($s6)
	sw $t1, 400($s6)
	#sw $t1, 512($s6)
	sw $t1, 528($s6)
	#sw $t1, 640($s6)
	sw $t1, 656($s6)
	#sw $t1, 768($s6)
	#sw $t1, 784($s6)
	#sw $t1, 772($s6)
	#sw $t1, 776($s6)
	sw $t1, 784($s6)
	
	jal Check_second
	
Second_seven:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	#sw $t1, 128($s6)
	sw $t1, 144($s7)
	#sw $t1, 256($s6)
	sw $t1, 272($s7)
	#sw $t1, 384($s6)
	sw $t1, 400($s7)
	#sw $t1, 512($s6)
	sw $t1, 528($s7)
	#sw $t1, 640($s6)
	sw $t1, 656($s7)
	#sw $t1, 768($s6)
	#sw $t1, 784($s6)
	#sw $t1, 772($s6)
	#sw $t1, 776($s6)
	sw $t1, 784($s7)
	
	li $v0, 10
	syscall

#8
First_eight:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	sw $t1, 128($s6)
	sw $t1, 144($s6)
	sw $t1, 256($s6)
	sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	sw $t1, 512($s6)
	sw $t1, 528($s6)
	sw $t1, 640($s6)
	sw $t1, 656($s6)
	sw $t1, 768($s6)
	sw $t1, 784($s6)
	sw $t1, 772($s6)
	sw $t1, 776($s6)
	sw $t1, 780($s6)
	
	jal Check_second
	

Second_eight:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	sw $t1, 128($s7)
	sw $t1, 144($s7)
	sw $t1, 256($s7)
	sw $t1, 272($s7)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	sw $t1, 512($s7)
	sw $t1, 528($s7)
	sw $t1, 640($s7)
	sw $t1, 656($s7)
	sw $t1, 768($s7)
	sw $t1, 784($s7)
	sw $t1, 772($s7)
	sw $t1, 776($s7)
	sw $t1, 780($s7)
	
	li $v0, 10
	syscall
	
#9
First_nine:
	sw $t1, 0($s6)
	sw $t1, 4($s6)
	sw $t1, 8($s6)
	sw $t1, 12($s6)
	sw $t1, 16($s6)
	sw $t1, 128($s6)
	sw $t1, 144($s6)
	sw $t1, 256($s6)
	sw $t1, 272($s6)
	sw $t1, 384($s6)
	sw $t1, 388($s6)
	sw $t1, 392($s6)
	sw $t1, 396($s6)
	sw $t1, 400($s6)
	#sw $t1, 512($s6)
	sw $t1, 528($s6)
	#sw $t1, 640($s6)
	sw $t1, 656($s6)
	#sw $t1, 768($s6)
	#sw $t1, 784($s6)
	#sw $t1, 772($s6)
	#sw $t1, 776($s6)
	sw $t1, 784($s6)
	
	jal Check_second
	

Second_nine:
	sw $t1, 0($s7)
	sw $t1, 4($s7)
	sw $t1, 8($s7)
	sw $t1, 12($s7)
	sw $t1, 16($s7)
	sw $t1, 128($s7)
	sw $t1, 144($s7)
	sw $t1, 256($s7)
	sw $t1, 272($s7)
	sw $t1, 384($s7)
	sw $t1, 388($s7)
	sw $t1, 392($s7)
	sw $t1, 396($s7)
	sw $t1, 400($s7)
	#sw $t1, 512($s7)
	sw $t1, 528($s7)
	#sw $t1, 640($s7)
	sw $t1, 656($s7)
	#sw $t1, 768($s7)
	#sw $t1, 784($s7)
	#sw $t1, 772($s7)
	#sw $t1, 776($s7)
	sw $t1, 784($s7)
	
	li $v0, 10
	syscall
