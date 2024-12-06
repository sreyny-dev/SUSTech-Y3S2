.data
.text
main:
	li a7,5 	#get the dimension of vector
	ecall
	
	mv t0,a0
	slli a0,t0,3
	li a7,9
	ecall
	mv t5,a0 	#t1 the start of the heap of vector 1
	mv t2,a0  	#t2 is pointer
	mv t1,t0 	#size if the vector
	slli t1,t1,2 	#allocate the second pointer
	add t3,t5,t1 	#t3 is the start of  vector 2
	
	slli t0,t0,1

	add t4,zero,zero 	#st t4 as i
	
	li s1,0 		#init result=0
	fcvt.s.w fs1,s1
	
	li s2,0 		#loop count for mul
	
loop_read:
	li a7,6
	ecall
	fsw fa0,(t2)
	addi t2,t2,4
	addi t4,t4,1
	bne t4,t0,loop_read
multi:
	flw ft0, (t5)
	flw ft1, (t3)
	
	fmul.s ft2, ft0,ft1
	fadd.s fs1,fs1,ft2
	
	addi t5,t5,4
	addi t3,t3,4
	addi s2,s2,1
	
	ble s2,t0,multi
	
	fmv.s fa0,fs1
	li a7,2
	ecall
	li a7,10
	ecall
	
	
	
	
	
	
