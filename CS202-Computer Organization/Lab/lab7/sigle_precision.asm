.include "macro_print_str.asm"
.data
	float1:.float 12.432
	float2: .float 23.12
.text
	#la t0,float1
	#flw ft0,(t0)
	li a7,6
	ecall
	fmv.s ft0,fa0
	li a7,5
	ecall
	mv s0,a0
	
	li t1,10
	fcvt.s.w ft1,t1
	li t2,1
	fcvt.s.w ft2,t2
	li s1,0 #init loop counter
	j round
mul:
	fmul.s ft2,ft2,ft1
	addi s1,s1,1
	j round
round:
	blt s1,s0,mul
	
	fmul.s ft3,ft0,ft2
	fcvt.w.s t3,ft3
	fcvt.s.w ft4,t3
	fdiv.s fa0, ft4,ft2
	li a7,2
	ecall
	li a7,10
	ecall
