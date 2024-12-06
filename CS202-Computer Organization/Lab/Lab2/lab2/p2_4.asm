# Piece 2-4
.data
	a:	.word 0x12345678
	b:	.word 0x9abcdef0

.text
main:	
	lw t0, a	# load word
	lw t1, b
	
	lb t0, a	# load byte
	lb t1, b

	lh t0, a	#load halfword
	lh t1, b	
	
	
	
