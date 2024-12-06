# Piece 3-3
.include "macro_print_str.asm"
.data
	dvalue1: .word 0x87654321
.text
	lw a0, dvalue1
	li a7, 34
	ecall
	
	mv t1, a0
	slli t2, t1, 16
	#srli t3, t1, 16
	srai t3, t1, 16
	or t1, t2, t3
	
	print_string("\n")
	mv a0, t1
	li a7, 34
	ecall
	end
	
