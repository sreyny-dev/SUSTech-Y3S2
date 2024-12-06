# Piece 2-12
.data
	str: .ascii "\nWelcome"
	sid: .space 8
	e1: .asciz "to RISC-V World"
.text
main:
	li a7, 8 # to get a string
	la a0, sid
	li a1, 8
	ecall
	#complete code here
	la a0, sid
	li t1, 0x20
	sb t1,8(a0)
	
	li a7, 4 # to print a string
	la a0, str
	ecall
	
	li a7, 10 # to exit
	ecall