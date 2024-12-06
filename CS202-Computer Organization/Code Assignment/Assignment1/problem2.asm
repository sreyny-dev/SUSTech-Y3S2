.data
.text
main:
	li a7,5
	ecall
	mv s0,a0 #low
	
	li a7,5
	ecall
	mv s1,a0 # high
	li t0,1 #f1=1
	li t1,1 #f2=1
	li t2,2 #f3=2
	li t3,-1 #count result
loop:
	blt s1,t0,print
	bge t1,s0,count
update:
	mv t0,t1
	mv t1,t2
	add t2,t0,t1
	j loop
count:
	addi t3,t3,1
	j update
print:
	mv a0,t3
	li a7,1
	ecall
	li a7,10
	ecall