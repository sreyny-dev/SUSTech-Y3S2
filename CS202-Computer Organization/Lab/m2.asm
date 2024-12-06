.data #Demo2 ：1/3
# 32*2 word (rows: 2, columns: 32)
matrix: .space 256
.macro getindex(%ans,%i,%j)
slli %ans,%i,5
add %ans,%ans,%j
slli %ans,%ans,2
.end_macro
#Demo2 ：2/3
.text
addi t0,x0,0 #i
addi s0,x0,2
addi t1,x0,0 #j
addi s1,x0,32
la t6, matrix
#Demo2:3/3
loopj:
beq t1,s1,loopjend
addi t0,x0,0
loopi:
beq t0,s0,loopiend
getindex(a0,t0,t1)
add t5,t6,a0
sw a0, 0(t5)
addi t0,t0,1
j loopi
loopiend:
addi t1,t1,1
j loopj
loopjend:
li a7,10
ecall