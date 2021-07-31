.data
displayAddress: .word 0x10008000

.text
lw $t0, displayAddress # $t0 stores the base address for display
li $t3, 0xff0000 # $t3 stores the red colour code


# GAME OVER
# E
	gameover:
	addi $t1, $t0, 1164
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)

	addi $t1, $t0, 1164
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t2, $t1, 0
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)

	addi $t1, $t2, 0
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)

	# N
	addi $t1, $t0, 1196
	addi $t2, $t1, 0
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128	
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)

	addi $t1, $t2, 0
	addi $t1, $t1, 4	
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128

	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)
	subi $t1, $t1, 128
	sw $t3, 0($t1)

	# D
	addi $t1, $t0, 1236
	sw $t3, 0($t1)
	addi $t2, $t1, 0
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)

	addi $t1, $t2, 0
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	addi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	subi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	subi $t1, $t1, 4
	sw $t3, 0($t1)
	addi $t1, $t1, 128
	subi $t1, $t1, 4
	sw $t3, 0($t1)
	subi $t1, $t1, 4
	sw $t3, 0($t1)


li $t9, 0xffff0000 
lw $t8, 0($t9)
beq $t8, 1, keypress_happened

lw $t2, 4($t9) # this assumes $t9 is set to 0xfff0000 from before 
beq $t2, 0x61, respond_to_a # ASCII code of 'a' is 0x61 or 97 in decimal

li $v0, 10 # terminate the program gracefully
syscall
