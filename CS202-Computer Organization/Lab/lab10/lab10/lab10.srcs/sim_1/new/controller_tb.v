`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 05:50:24 PM
// Design Name: 
// Module Name: controller_tb
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


module controller_tb();
reg [31:0] instruction;
wire Branch;
wire [1:0] ALUOp;
wire ALUSrc;
wire MemRead;
wire MemWrite;
wire MemtoReg;
wire RegWrite;
controller DUT(.instruction(instruction), .Branch(Branch), .ALUOp(ALUOp), .ALUSrc(ALUSrc),.MemRead(MemRead),.MemWrite(MemWrite), .MemtoReg(MemtoReg),.RegWrite(RegWrite));
initial begin
    instruction = 32'h0000a083;
        #10
        instruction = 32'h001080b3;
        #10
        instruction = 32'h00102423;
        #10
        instruction = 32'hfe1008e3;
        #10
        instruction = 32'h00101663;
        #10
        instruction = 32'h403000b3;
        #10
        instruction = 32'h0041f133;
        #10
        instruction = 32'h005261b3;
        #10
        $finish;
end
endmodule
