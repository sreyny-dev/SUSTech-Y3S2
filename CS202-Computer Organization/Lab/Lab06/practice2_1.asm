.include "macro_print_str.asm"

.data
	m1_1: .half 0x7fff 	 	# highest positve
	m2_1: .half 0x7fff   		# highest positive
	m1_2: .half 0x8000		# lowest negative
	m2_2: .half 0x8000		# lowest negative
	m1_3: .half 5000
	m2_3: .half -20
	m1_4: .half -10000
	m2_4: .half 5
	m1_5: .half 0
	m2_5: .half 0x7fff

.text
main:
	lh t0, m1_1	 	
	lh t1, m2_1	 		
	jal mul
	
	lh t0, m1_2	 	
	lh t1, m2_2	 		
	jal mul
	
	lh t0, m1_3	 	
	lh t1, m2_3	 		
	jal mul
	
	lh t0, m1_4	 	
	lh t1, m2_4	 		
	jal mul
	
	lh t0, m1_5	 	
	lh t1, m2_5	 		
	jal mul

	end
	
mul:	
	mv s0, t0			# for later reference of multiplicand		
	mv s1, t1			# for later reference of multiplier
	add t2, zero, zero		# product result
	li a0, 0			# loop counter
	li a1, 16 	 		# max number of loop
	lui s3 0x00008			# s3 = 0x0000_8
	addi s3, s3, 0x000		# s3 = 0x0000_8000 to get the highest bit
	
check_convert1:
	and s4, t0, s3			# get the highest bit of multiplicand
	beq s4, s3, convert1		# if multiplicand = 0x0000_8000

check_convert2:
	and s5, t1, s3			# get the highest bit of multiplier
	beq s5, s3, convert2		# if multiplicand = 0x0000_8000
	j loop	

convert1:
	not t0, t0			# t0 = ~t0
	addi t0, t0, 1			# t0 = ~t0 + 1
	j check_convert2
	
convert2:	
	not t1, t1			# t1 = ~t1
	addi t1, t1, 1			# t1 = ~t1 + 1

loop:
	andi s2, t1, 1   		# get the lowest bit of t1
	beq s2, zero, shift  	        # if lowest bit = 0
	add t2, t0, t2			# else if lowest bit = 1, add multiplicand to the current result

shift:
	slli t0, t0, 1			# shift multiplicand to the left by 1
	srli t1, t1, 1			# shift multiplier to the right by 1
	addi a0, a0,1 			# increment loop counter
	blt a0, a1, loop		# if a0 < 16
	
	beq s4, s5, print_result	# if both signs are the same	
	not t2, t2			# t2 = ~t2
	addi t2, t2, 1			# t2 = ~t2 + 1
	
print_result:	
	mv a0, s0
	li a7, 1
	ecall
	
	print_string(" × ")
	
	mv a0, s1
	li a7, 1
	ecall
	
	print_string(" = ")
	
	mv a0, t2
	li a7, 1
	ecall
	
	print_string("\n")
	
	jr ra
