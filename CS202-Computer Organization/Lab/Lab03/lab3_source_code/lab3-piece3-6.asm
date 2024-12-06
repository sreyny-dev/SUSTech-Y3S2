# Piece 3-6

.include "macro_print_str.asm"
.text
	print_string("please input your score (0~100):")
	li a7, 5
	ecall	
	mv t0, a0
case1:
	li t1, 60
	bge t0, t1, passLable
	j case2
case2: 
	j failLable
	
passLable:
	print_string("\nPASS (exceed or equal to 60) ")
	j caseEnd
failLable:
	print_string("\nFail (less than 60)")
	j caseEnd
caseEnd:
	end
