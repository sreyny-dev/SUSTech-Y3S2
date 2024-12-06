.data	

.text
main:	
	li s0,1 #low
	li s1,8 #high
	li t0,1 #f1
	li t1,1 #f2
	li t2,2 #f3
	li t3,-1 #count
	
loop:
	blt s1,t0,exit
	bge t0,s0,count
	mv a0,t3
	li a7,1
	ecall
update:
	mv t0,t1
	mv t1,t2
	add t2,t0,t1
	j loop
	
count:
	li t3,1
	j update
exit:
	li a7,10
	ecall
	