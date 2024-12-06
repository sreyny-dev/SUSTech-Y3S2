# Piece 5-2
.text
main:
	lui a0, 0x12345	# a0 = 0x12345000
	addi a0, a0, 0xabc	# a0 = 0x12345abc ?
	li a7, 34
	ecall
