.data
.text
main:
	li a7,6
	ecall
	fmv.s ft0, fa0
	li a1,1
	li t1,0
	fcvt.s.w ft1,t1		#store result
	li t2,15
	fcvt.s.w ft2,t2
	li t3,20
	fcvt.s.w ft3,t3
	fle.s a2,ft0,ft2
	beq a1,a2,rule1
	flt.s a3,ft2,ft0
	beq a1,a3,check_rule
rule1:
	fmv.s ft1,ft0
	j print_result
check_rule:
	fle.s a4,ft0,ft3
	beq a1,a4,rule_2
	flt.s a5,ft3,ft0
	beq a1,a5,rule_3
rule_2:
	fmv.s ft1,ft2
	fsub.s fs1,ft0,ft2
	li s0,2
	fcvt.s.w fs0,s0
	fmul.s ft4,fs1,fs0
	fadd.s ft1,ft1,ft4
	j print_result
rule_3:
	fmv.s ft1,ft2
	li s0,2
	fcvt.s.w fs0,s0
	fsub.s ft4,ft3,ft2
	fmul.s ft5,ft4,fs0
	fadd.s ft1,ft1,ft5
	fsub.s ft6,ft0,ft3
	li s1,3
	fcvt.s.w fs1,s1
	fmul.s fs2,ft6,fs1
	fadd.s ft1,ft1,fs2
	j print_result
print_result:
	fmv.s fa0,ft1
	li a7,2
	ecall
	li a7,10
	ecall
	
	
