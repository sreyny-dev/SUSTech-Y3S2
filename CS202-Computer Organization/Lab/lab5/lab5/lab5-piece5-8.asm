# Piece 5-8
.data
	str1:  .ascii  "Welcome"
	#.align 2
	str2:  .ascii  "to"
	str3:  .asciz  "RISC-V World"
.text
	la t0, str2	
	lw t1, (t0)
	addi t1, t1, -32
	sw t1, (t0)

	la a0, str2
	li a7, 4
	ecall

	li a7, 10
	ecall
