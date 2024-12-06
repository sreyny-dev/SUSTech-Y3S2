# Piece 4-2
# Piece 4-2-1
.data	
	tdata: .word 0x00000001
	str1:  .asciz "\nThe result is: "
	str2:  .asciz "\n"
.text	
	li a7, 5
	ecall
	lw a1, tdata
	add a0, a0, a1
	mv t0, a0	
# Piece 4-2-2
	la a0, str1
	jal print_string
	
	mv a0, t0
	jal print_dec_result
	jal print_new_line	
	jal print_hex_result	
	
	li a7, 10
	ecall
# Piece 4-2-3	
print_string: 
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)	
	li a7, 4
	ecall
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	jr ra
# Piece 4-2-4
print_new_line: 
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)
	la a0, str2	
	li a7, 4
	ecall
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	jr ra
# Piece 4-2-5
print_dec_result:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)	
	li a7, 1
	ecall
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	jr ra
# Piece 4-2-6
print_hex_result:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)	
	li a7, 34
	ecall
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	jr ra
