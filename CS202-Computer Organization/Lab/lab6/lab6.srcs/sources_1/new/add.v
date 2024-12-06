`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 05:20:15 PM
// Design Name: 
// Module Name: add
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

module add (in1, in2, sum, overflow); //in verilog
input [2:0]in1, in2;
output [2:0] sum;
output overflow;
assign sum = in1 + in2;
assign overflow =
( in1[2] & in2[2] & ~sum[2] ) | /* two +ve operands, get -ve operand*/
(~in1[2] & ~in2[2] & sum[2] ); /* two -ve operands, get +ve operand*/
endmodule
