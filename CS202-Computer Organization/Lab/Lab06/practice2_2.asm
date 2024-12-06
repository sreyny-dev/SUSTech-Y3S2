.include "macro_print_str.asm"

.data	
	dividend1: .word 119
	divisor1: .word 0
	
	dividend2: .word 0x0fffffff
	divisor2: .word 0x0ffffff0
	
	dividend3: .word -15003
	divisor3: .word 500
	
	dividend4: .word 3000
	divisor4: .word -2997
	
	dividend5: .word -10
	divisor5: .word -3
	
	dividend6: .word -3
	divisor6: .word -5

.text
main:
	lw t1, dividend1	
	lw t2, divisor1	
	jal div
	
	lw t1, dividend2	
	lw t2, divisor2	
	jal div
	
	lw t1, dividend3	
	lw t2, divisor3
	jal div
	
	lw t1, dividend4	
	lw t2, divisor4
	jal div
	
	lw t1, dividend5	
	lw t2, divisor5
	jal div
	
	lw t1, dividend6	
	lw t2, divisor6
	jal div
	
	end

div:	
	mv s5, t1		# save dividend for later reference
	mv s6, t2		# save divisor for later reference
	beqz s6, print_result   # if divisor is zero
	li a1, 0x80000000 	# a1: used to get the highest bit
	
check_dividend_neg:
	and s1, t1, a1		# get highest bit of dividend
	beq s1, a1, convert_dividend_pos
	
check_divisor_neg:
	and s2, t2, a1		# get highest bit of divisor
	beq s2, a1, convert_divisor_pos
	j div_init

convert_dividend_pos:
	not t1, t1		# t1 = ~t1
	addi t1, t1, 1		# t1 = ~t1 + 1
	j check_divisor_neg
	
convert_divisor_pos:
	not t2, t2		# t2 = ~t2
	addi t2, t2, 1		# t2 = ~t2 + 1
	
div_init:
	slli t2, t2, 32		# put divisor in the higher 32 bits
	mv t3, t1 		# t3: remainder
	add t4, zero, zero 	# t4 quotient
	add t0, zero, zero 	# t0: loop counter
	li t6, 33		# t6: max number of loops

loop_bit:
	# t1: dividend, t2: divisor, t3: remainder, t4: quotient
	# a1: 0x8000, t6: 29
	
	sub t3, t3, t2 		# dividend - divisor
	and s0, t3, a1 		# get the highest bit of remainder to check if rem < 0
	slli t4, t4, 1 		# shift left quotient by 1 bit
	beq s0, zero, sdr_uq	# if rem >= 0, shift div right
	add t3, t3, t2 		# if rem < 0, rem = rem + div
	srli t2, t2, 1		
	addi t4, t4, 0		# set the new rightmost bit of quotient to 0
	j loop_increment
	
sdr_uq:
	addi t4, t4, 1 		# set the new rightmost bit of quotient to 1
	srli t2, t2, 1		# shift right divisor by 1 bit
	       
loop_increment:
	addi t0, t0, 1
	blt t0, t6, loop_bit

check_quotient_neg:
	beq s1, s2, check_remainder_neg	# if dividend and divisor have the same sign
	not t4, t4			# else convert quotient
	addi t4, t4, 1
	
check_remainder_neg:
	bne s1, a1, print_result 	# if dividend is positive
	not t3, t3			# else convert remainder
	addi t3, t3, 1
	
print_result:
	print_string("\noperation: ")
	
	li a7, 1
	mv a0, s5		
	ecall
	
	print_string(" ÷ ")
	
	li a7, 1
	mv a0, s6		
	ecall
	
	beqz s6, print_exception
	
	print_string("\nquotient: ")
	
	li a7, 1
	mv a0, t4 		
	ecall
	 
	print_string("\nremainder: ")
	
	li a7, 1
	mv a0, t3 	
	ecall
	
	j return
	
print_exception:
	print_string("\nexception: division by zero")

return:	
	print_string("\n")
	jr ra
	
