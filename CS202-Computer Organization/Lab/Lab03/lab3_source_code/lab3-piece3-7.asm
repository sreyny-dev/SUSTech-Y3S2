#Piece 3-7

.include "macro_print_str.asm"
.data
	#....
.text
	add t1, zero, zero
	addi t0, zero, 0
	addi t3, zero, 10	
calcu:
	addi t0, t0, 1       # i++
	add t1, t1, t0    # sum+=i
	blt t0, t3, calcu  #if(t0 < t3)  add i to sum
	
	print_string ("The sum from 1 to 10: ")
	mv a0, t1
	li a7, 1
	ecall
	
	end
