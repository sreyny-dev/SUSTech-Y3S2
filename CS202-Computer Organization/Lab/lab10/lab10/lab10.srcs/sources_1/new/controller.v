`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 05:19:03 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input wire [31:0] instruction,
    output wire Branch,
    output wire nBranch,
    output reg [1:0] ALUOp,
    output wire ALUSrc, 
    output wire MemRead,
    output wire MemWrite,
    output wire MemtoReg,
    output wire RegWrite
    
    );
   wire [6:0] opcode=instruction[6:0];
   wire [2:0] funct3=instruction[14:12];
   assign     Branch=(opcode==7'h63 && funct3==3'b000)? 1'b1: 1'b0;
   assign     ALUSrc=(opcode==7'h03 || opcode==7'h23)? 1'b1 : 1'b0;  
   assign     MemRead=(opcode==7'h03)? 1'b1:1'b0;  
   assign     MemWrite=(opcode==7'h23)? 1'b1 : 1'b0;
   assign     MemtoReg=(opcode==7'h03)? 1'b1 : 1'b0;
   assign     RegWrite=(opcode==7'h03 || opcode==7'h33 )? 1'b1 : 1'b0;
   always @ (instruction) begin
   case (opcode)
       7'h03, 7'h23: ALUOp=2'b00;
       7'h63: ALUOp=2'b01;
       default: ALUOp=2'b10;
   endcase
   end
   
endmodule
