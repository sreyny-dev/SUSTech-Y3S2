`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 05:41:32 PM
// Design Name: 
// Module Name: substraction_sim
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

module substraction_sim( ); //verilog
reg[2:0] in1,in2;
wire overflow;
wire [2:0] result;
subtraction ua(in1,in2,result,overflow);
initial begin
{in1,in2}= 6'b0;
repeat(63) #10 {in1,in2} = {in1,in2} + 1;
#10 $finish;
end
endmodule
