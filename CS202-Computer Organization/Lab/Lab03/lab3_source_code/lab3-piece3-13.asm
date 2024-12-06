#Piece 3-13

.include "macro_print_str.asm"
.data
	tdata0: .word   0x11223344, 0x55667788
.text
main:
	la t0, tdata0
	lb a0, (t0)
	li a7, 34
	ecall
	
	la t0, tdata0
	lb a0, 1(t0)
	ecall
	
	lb a0, 2(t0)
	ecall
	
	lb a0, 3(t0)
	ecall
	
	lw a0, 4(t0)
	ecall
	
	end
