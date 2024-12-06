.data
input_buffer: .space 1001

.text
main:
    
    la a0, input_buffer   
    li a1, 1000            
    
    li a7, 8
    ecall

   
    li a7, 4
    ecall
    
    li a7, 10
    ecall
