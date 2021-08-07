.data
displayAddress: .word 0x10008000

.text
lw $t0, displayAddress # $t0 stores the base address for display
li $t1, 0xff0000 # $t1 stores the red colour code


# GAME OVER
# E
gameover:
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


