# The score hardcode page

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
    	
    	addi $s6, $t0, 1696             # Initial point to show the First digit score
    	addi $s7, $t0, 1744		# Initial point to show the Second digit score

main: j First_six
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

	
#1
First_one:
	sw $t1, 8($s6)
	sw $t1, 136($s6)
	sw $t1, 264($s6)
	sw $t1, 392($s6)
	sw $t1, 520($s6)
	sw $t1, 648($s6)
	sw $t1, 776($s6)
	
Second_one:
	sw $t1, 8($s7)
	sw $t1, 136($s7)
	sw $t1, 264($s7)
	sw $t1, 392($s7)
	sw $t1, 520($s7)
	sw $t1, 648($s7)
	sw $t1, 776($s7)


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