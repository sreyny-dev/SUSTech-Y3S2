#Piece 3-12

.include "macro_print_str.asm"
.data
	tdata0: .byte   0x11,0x22,0x33,0x44
	tdata:   .word  0x44332211
.text
main:
	lb a0, tdata0
	li a7, 34
	ecall	
	
	lb a0, tdata
	li a7, 34
	ecall
	
	end