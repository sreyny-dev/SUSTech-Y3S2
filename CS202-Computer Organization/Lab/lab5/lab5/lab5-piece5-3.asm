# Piece 5-3
.include "macro_print_str.asm"
.data
	dvalue1: .word 0x00000abc
	dvalue2: .word 0x7fffffff
.text
main:
	lui a0, 0x12345
	lw t1, dvalue1
	add a0, a0, t1
	#li a7, 34	# 1st number
	#ecall
	li a7, 1
	ecall
	print_string("\n")

	lui a0, 0x12345
	lw t1, dvalue2
	add a0, a0, t1
	#li a7, 34	# 2nd number
	#ecall
	li a7, 1
	ecall
	end
