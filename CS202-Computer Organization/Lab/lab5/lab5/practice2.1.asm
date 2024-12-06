
#Group 1. dvalue1: 0x7fffffff; dvalue2: 0x00000001 overflow
#Group 2. dvalue1: 0x7fffffff; dvalue2: 0xffffffff 
#Group 3. dvalue1: 0x7fffffff; dvalue2: -1 
#Group 4. dvalue1: 0x7fffffff; dvalue2: 0x80000000 
#Group 5. dvalue1: 0x7fffffff; dvalue2: 0x7fffffff 
#Group 6. dvalue1: 0x80000001; dvalue2: 0x80000001 
#Group 7. dvalue1: 0x80000001; dvalue2: 1

# Piece 5-4
.include "macro_print_str.asm"
.data
	dvalue1: .word 0x7fffffff 
	dvalue2: .word 0x80000000 
.text
	lw t1, dvalue1
	lw t2, dvalue2		
	sub t0, t1, t2		# sub two values  
	slti t3, t2, 0		# t3 = (t2 < 0) t3=1 if t2<0
	slt t4, t1, t0		#sub=a-b, if sub>a, then false
	
	mv a0, t0		# print the sum
	li a7, 1
	ecall
	bne t3,t4,overflow # or if (t2 <0) && (t1-t2>t1)
						
	print_string("\nNo overflow occured.")
	jal exit	
overflow:
	print_string("\nOne overflow occured.")
exit:	
	end
