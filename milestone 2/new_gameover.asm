#new gameover page
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
	
	addi $s6, $t0, 1696             # Initial point to show the First digit score
    	addi $s7, $t0, 1744
	
	la $t6, bullets_location
	sw $t5, 0($t6)
	sw $t5, 4($t6)
	sw $t5, 8($t6)
	
Game_over:
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
