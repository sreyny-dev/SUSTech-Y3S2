.data
	epsilon: .double 1e-6
.text
main:
	li a7,7
	ecall
	fmv.d fs0,fa0 #a
	li a7,7
	ecall
	fmv.d fs1,fa0 #b
	li a7,7
	ecall
	fmv.d fs2,fa0 #c
	li a7,7
	ecall
	fmv.d fs3,fa0 #d
	li a7,7
	ecall
	fmv.d fs4,fa0 #x1
	li a7,7
	ecall
	fmv.d fs5,fa0 #x2
	
	
	#init
	li t0,1  #set as i
	li t1,1000 	#max_iter
	li t2,2
	fcvt.d.w fs6,t2		#fs6=2.00
	la t3,epsilon
	fld fs7,(t3) 	#fs7=1e-6   
	
	li t4, 1	#for comparation
	li t5,0		#for comparation
	fcvt.d.w fs8,t5		#fs8=0
	li t6,-1
	fcvt.d.w fs9,t6		#fs9=-1
	

loop:
	fadd.d fa1,fs4,fs5	#x1+x2
	fdiv.d ft0,fa1,fs6	#x3=(x1+x2)/2
	jal find_fx3
	flt.d a1,ft1,fs8	#set a1 to 1 if fx3<0
	beq a1,t4,compare1	#if fx3<0, convert
	fle.d a4,fs8,ft1	#fx3>0, compare2
	beq a4,t4,compare2
	
compare_update:	 	
	fmul.d ft3,ft2,ft1	#fx1*fx3
	flt.d a5,ft3,fs8	#fx1*fx3<0
	beq a5,t4,update_x2
	bne a5,t4,update_x1
compare1:
	fmul.d fs10,ft1,fs9	#multi fx3 by -1
	flt.d a3,fs10,fs7	#if abs. fx3<epsilon
	beq a3,t4,result
	j find_fx1 			#after convert to +, compare epsilon , if not jum to find_fx1
compare2:
	flt.d a2,ft1,fs7	#fx3<esilon
	beq a2,t4,result	#result x3 if fx3,epsilon
	j find_fx1
find_fx3:
	#ax_3^3
	fmul.d fa2,ft0,ft0
	fmul.d fa2,fa2,ft0
	fmul.d fa2,fa2,fs0
	#bx^2
	fmul.d fa3, ft0,ft0
	fmul.d fa3,fa3,fs1
	#cx
	fmul.d fa4,ft0,fs2
	#ax^3+bx^2+cx=d
	fadd.d ft1,fa2,fa3
	fadd.d ft1,ft1,fa4
	fadd.d ft1,ft1,fs3	#ft1=f(x3)
	jr ra

find_fx1:
	#ax_1^3
	fmul.d fa5,fs4,fs4
	fmul.d fa5,fa5,fs4
	fmul.d fa5,fa5,fs0
	#bx_1^2
	fmul.d fa6,fs4,fs4
	fmul.d fa6,fa6,fs1
	#cx
	fmul.d fa7,fs4,fs2
	#ax^3+bx^2+cx+d
	fadd.d ft2,fa5,fa6
	fadd.d ft2,ft2,fa7
	fadd.d ft2,ft2,fs3
	j compare_update
	
update_x2:	
	#fmul.d fs5,fs5,fs8	#set x2 to 0
	#fadd.d fs5,fs5,ft0	#add x2 by x3 to make it become x3
	fmv.d fs5,ft0
	j increasei
update_x1:
	#fmul.d fs4,fs4,fs8
	#fadd.d fs4,fs4,ft0
	fmv.d fs4,ft0
	j increasei
increasei:
	addi t0,t0,1
	ble t0,t1,loop
	j result	#if 1000 iter, still not find solution, return x3
result:
	fmv.d fa0,ft0
	li a7,3
	ecall
	li a7,10
	ecall
	

	
	
	
	
	
