.data
str: .asciiz "Hello World"

.text

li $t9, 0xffff0000 
lw $t8, 0($t9)

# while loop
START:  beq $t8, 1, keypress_happened
	
	lw $t8, 0($t9)
	j START

keypress_happened: 
	lw $t2, 4($t9) # this assumes $t9 is set to 0xfff0000 from before 
	beq $t2, 0x70, respond_to_p 
	
	j START
	
	respond_to_p:
		li $v0, 4
		la $a0, str
		syscall
		
END:
	li $v0, 10 # terminate the program gracefully
	syscall