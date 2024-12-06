# Piece 5-5
.text
print_string:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, (sp)

	li a7, 4
	ecall

	lw a0, (sp)
	lw ra, 4(sp)
	addi sp, sp, 8

	jr ra
