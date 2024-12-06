# Piece 3-1

.data
	dvalue1: .byte 27
	dvalue2: .byte 4
.text
	lb t0, dvalue1
	lb t1, dvalue2
	
	rem a0, t0, t1
	
	li a7, 1
	ecall

	li a7, 10
	ecall
