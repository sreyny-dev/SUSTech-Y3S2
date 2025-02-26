`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 05:20:49 PM
// Design Name: 
// Module Name: addb
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


module addb( ); //verilog
reg[2:0] in1,in2;
wire overflow;
wire [2:0] sum;
add ua(in1,in2,sum,overflow);
initial begin
{in1,in2}= 6'b0;
//$monitor("%3b+%3b:sum=%3b(%d), ro=%3b(%d)", in1,in2,sum,$signed(sum));
repeat(63) #10 {in1,in2} = {in1,in2} + 1;
#10 $finish;
end
endmodule
