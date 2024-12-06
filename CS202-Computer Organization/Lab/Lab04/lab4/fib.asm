.include "macro_print_str.asm"
.data
spa: .asciz " "
.text
main:
	print_string("Please enter an integer: ")
	li a7, 5
	ecall
	jal fib
	li a7,1
	ecall
	end
fib:
	addi sp, sp,-8
	sw ra, 4(sp) #store return addr
	sw a0, 0(sp) #store value of input value a0
	
	slti t0,a0,1
	beq t0, zero, fib_helper
	addi a0,zero,1
	addi sp,sp,8 #pop 2 items off the stack
	jr ra
	
fib_helper:
	addi a0,a0,-1 #n-1
	jal fib #call fib(n-1)
	
	add t1,t2,zero 
	add t2,a0,zero
	add a0,t2,t1
	
	lw ra, 4(sp)
	addi sp, sp, 8
	jr ra
