.include "macro_print_str.asm"
.data
multi : .string " * "
spa : .string " "
row : .asciz  " \n"
equ : .string " = "

.text
main:	
	addi s0, zero, 1 

loop1:
	slti t0,s0,10
	beq t0,zero, exit
	addi s1, zero, 1
loop2:
	slti t0,s1,10
	beq t0,zero,label
	
	mv t0, s0
	mv t1, s1
	
	mul t2, t0,t1
	
	mv a0, t0
	li a7, 1
	ecall
	
	la a0, multi
	li a7, 4
	ecall
	
	mv a0, t1
	li a7, 1
	ecall
	
	la a0, equ
	li a7, 4
	ecall
	
	mv a0, t2
	li a7, 1
	ecall
	print_string("\n")
	la a0, row
	li a7, 4
	ecall
	addi s1, s1,1
	j loop2
	
label:
	print_string("\n")
	la a0, row
	li a7, 4
	ecall
	
	addi s0, s0,1
	j loop1
exit:
	li a7, 10
	ecall
end
		