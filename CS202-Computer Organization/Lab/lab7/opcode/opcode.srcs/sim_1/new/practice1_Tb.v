`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 12:27:18 PM
// Design Name: 
// Module Name: practice1_Tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module practice1_Tb();
    reg [31:0] instruction;
    wire writeReg;
    wire writeMem;
    
    practice1 DUT (.instruction(instruction),
                   .writeReg(writeReg),
                   .writeMem(writeMem));
                   
    initial begin
        instruction = 32'b00000000010100101000001010110011;
        #10
        instruction = 32'b11111111110000101000001010011011;
        #10
        instruction = 32'b00001111110000010000001100100011;
        #10
        instruction = 32'b11111111010000110010001101100011;
        #10
        instruction = 32'b00000000010000000000000010110111;
        #10
        instruction = 32'b000000000110001010000110011101111;
        #10
        $finish;
    end          
           
endmodule
