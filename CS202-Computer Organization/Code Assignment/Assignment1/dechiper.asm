.data
	chiper: .asciz 
.text 
.global main

dechiperA:
	addi s1,t2,0 #char store ascii value of newchar(input char)
	li s2,0x41 #store ascii value of oiginal A
	
	blt s2,s1,cal_offset #oldchar<newChar 
	sub s3,s1,s2   #S3 store offset 
	addi s3,s3,26 #offset=newchar -oldchar+26
	li t3,0
	j end_dechiper #always check offsest value

dechiperI:
	addi s1,t1,0 #store ascii value of newchar
	li s2,0x49 #store ascii value of original char I
	
	blt s2,s1,cal_offset #oldchar<newChar 
	sub s3,s1,s2   #S3 store offset 
	addi s3,s3,26 #offset=newchar -oldchar+26
	li t3,0
	j end_dechiper #always check offsest value
cal_offset:
	sub s3,s1,s2 #offset=newchar-oldchar
	li t3,0
	j print
end_dechiper:
	li s4,26
	beq s3,s4,no_shift #if offset=26, then no shift return 0
	li t0,0
	j print
no_shift:
	li s3,0
	li t3,0
	j print
main:
	li a7,8 #store in a0
	la a0,chiper #add\n teminator
	li a1, 2000 #max char
	ecall
	
	li s3,-1 #init offsst to be -1
	
	la s0, chiper #contain addr of first char[0]
	
	addi t4, zero,0x0a #null terminator
	addi t5,zero,0x20 #space
	
	addi s0,s0,1 #start from char[1]
	addi a2,s0,-1
	addi a3, s0,0
	addi a4,s0,1
	
	lb t1,0(a2) #left char addr
	lb t2,0(a3) # mid char addr
	lb t3,0(a4) #right char addr
	
	beq t2,t4,dechiperI #second char null
	beq t2,t5,dechiperI #second char space

loop:
	addi s0,s0,1 #increment addr if t
	addi a2,s0,-1
	addi a3, s0,0
	addi a4,s0,1
	
	lb t1,0(a2) #left char addr
	lb t2,0(a3) # mid char addr
	lb t3,0(a4) #right char addr
	
	beq t3,t5,check_thirdchar
	beq t3, t4,check_thirdchar
	j loop
check_thirdchar:
	beq t1,t5,dechiperA
	beq t3,t4,print
	j loop
print: 
	mv a0,s3
	li a7,1
	ecall
	li a7,10
	ecall	
	
	