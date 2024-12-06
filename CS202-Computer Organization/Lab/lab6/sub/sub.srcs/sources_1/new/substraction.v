`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 05:40:23 PM
// Design Name: 
// Module Name: substraction
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


module subtraction(in1,in2,result,overflow);
input [2:0]in1,in2;
output [2:0] result;
output overflow;
assign result= in1 -in2;
assign overflow =(in1[2]& ~in2[2]& ~result[2])|
        (~in1[2]& in2[2]& result[2]);
endmodule