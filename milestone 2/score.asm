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
    	addi $t7, $0, 99
    	addi $t8, $0, 10
	div $t7, $t8
	
	mfhi $t5
	mflo $t6

main: #j First_nine
	jal Check_first
	
	beq $t5, 0, Second_zero
	
	beq $t6, 0, First_zero
	
	li $v0, 10
	syscall

Check_first:
	beq $t6, 0, First_zero
	beq $t6, 1, First_one
	beq $t6, 2, First_two
	beq $t6, 3, First_three
	beq $t6, 4, First_four
	beq $t6, 5, First_five
	beq $t6, 6, First_six
	beq $t6, 7, First_seven
	beq $t6, 8, First_eight
	beq $t6, 9, First_nine
	
Check_second:
	beq $t5, 0, Second_zero
	beq $t5, 1, Second_one
	beq $t5, 2, Second_two
	beq $t5, 3, Second_three
	beq $t5, 4, Second_four
	beq $t5, 5, Second_five
	beq $t5, 6, Second_six
	beq $t5, 7, Second_seven
	beq $t5, 8, Second_eight
	beq $t5, 9, Second_nine
	

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
