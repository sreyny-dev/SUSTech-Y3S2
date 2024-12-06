# Byte value at address 0xffff0010 : command right seven segment display 
#  Byte value at address 0xffff0011 : command left seven segment display 
#  Each bit of these two bytes are connected to segments (bit 0 for a segment, 1 for b segment and 7 for point 
.data
ta: .byte 0xff
a_addr: .word 0xffff0010
.text
lw x1,a_addr
lb x2,ta
sb x2,(x1)

li a7,10
ecall

