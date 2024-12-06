# Piece 2-2
.data
	str:		.ascii    "Welcome "
	startpoint:	.space  9
	test: 		.ascii "test"

.text
main:
	li a7,8       # to get a string from input
	la a0,startpoint #load startpoint to a0 register
	li a1,10 #max data can read
	ecall
	
	li a7,4      # to print a string
	la a0,str
	ecall
	
	li a7,10    # to exit
	ecall
