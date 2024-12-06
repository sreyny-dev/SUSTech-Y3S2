`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 05:02:53 PM
// Design Name: 
// Module Name: Decoder_tb
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


module Decoder_tb();
reg [31:0] inst;
wire [31:0] rs1Data, rs2Data;
wire [31:0] imm32; 
Decoder DUT(
    .inst(inst),
    .rs1Data(rs1Data),
    .rs2Data(rs2Data),
    .imm32(imm32)
);
initial begin
        inst = 32'h00100033;
        #10
        inst = 32'hfa1008e3;
        #10
        inst = 32'h01f00033;
        #10
        inst = 32'h002081b3;
        #10
        $finish;
end
endmodule