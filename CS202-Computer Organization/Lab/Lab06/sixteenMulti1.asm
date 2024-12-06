.include "macro_print_str.asm"
.data
	m1:.half -11
	m2:.half 0
.text
main:
	lh t0,m1
	lh t1,m2
	jal mul
	end
mul:
	mv s0,t0 			#multiplicant mv to keep original number with it own sign
	mv s1,t1 			#multiplifier
	lui s2 0x00008			# s3 = 0x0000_8
	addi s2, s2, 0x000		# s3 = 0x0000_8000 to get the highest bit
check_sign_cand: 			#to convert the sign of multiplicant
	and s3,s2,t0 			#get highest big of multiplifier
	beq s3,s2,convert_cand 		#if s3 is 10000000=0x0000_8000 meaning that it is neg
check_sign_fier:
	and s4,s2,t1 			#get highest big of multiplifier
	beq s4,s2,convert_fier
	j loop
convert_cand:
	not t0,t0
	addi t0,t0,1
	j check_sign_fier
convert_fier:
	not t1,t1
	addi t1,t1,1
	j loop
loop:
	li s5,1 			#to get lowest bit 
	and s6,s5,t1 			#of multplifier
	beq s6,zero,shift		#if lowest bit of multplifier 0, no operation , jusst shift
	add t2,t2,t0 			#add prof and multiplicand
shift:
	slli t0,t0,1
	srli t1,t1,1
	addi a0,a0,1 			#loop counter
	li a1,16 			#16 loop
	blt a0,a1,loop
	
	beq s3,s4,print_result
	not t2,t2
	addi t2,t2,1
	
print_result:
	mv a0,s0
	li a7,1
	ecall
	print_string(" * ")
	mv a0, s1
	li a7,1
	ecall
	print_string(" = ")
	mv a0,t2
	li a7,1
	ecall
	
	jr ra

	
	
	
