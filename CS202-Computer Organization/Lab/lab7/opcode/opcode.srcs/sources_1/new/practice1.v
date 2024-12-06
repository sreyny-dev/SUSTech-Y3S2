`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 12:26:07 PM
// Design Name: 
// Module Name: practice1
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
module practice1(
    input wire [31:0] instruction,
    output reg writeReg,
    output reg writeMem
    );
    
    wire [6:0] opcode = instruction[6:0];
    
    always @(instruction) begin
        case (opcode)
            7'b0110011: {writeReg, writeMem} = 2'b10;   // R format
            7'b0011011: {writeReg, writeMem} = 2'b10;   // I format
            7'b0100011: {writeReg, writeMem} = 2'b01;   // S format
            7'b1100011: {writeReg, writeMem} = 2'b00;   // SB format
            7'b0110111: {writeReg, writeMem} = 2'b10;   // U format
            7'b1101111: {writeReg, writeMem} = 2'b10;   // UJ format
            default: {writeReg, writeMem} = 2'b00;
        endcase
    end
    
endmodule
