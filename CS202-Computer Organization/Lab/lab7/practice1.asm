.data
#deci:.float 409.267
#deci:.float -409.267
#deci:.word 0xc1a6fae1
deci:.word 0xc0611bf1a9fbe76d

.text
main:
	la t0,deci
	flw fa0,(t0)
	li a7,2
	ecall
	li a7,10
	ecall