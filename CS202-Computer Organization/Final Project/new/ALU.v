`timescale 1ns / 1ps

`include "param.v"
module ALU(rs1,rs2,imm,PC,alu_ctrl,selA,selB,ALUResult,Br);
    input[31:0]  rs1;		// rom register1
    input[31:0]  rs2;		// from register2
    input[31:0]  imm;		// from decoder
    input[31:0]  PC;        // from InstructionFetcher
    input[3:0]   alu_ctrl;  // from controler
    input selA;             // 0: rs1 1:pc
    input selB;             // 0: rs2 1:imm
    output [31:0] ALUResult;
    output Br;              //for branch or jal 1:jump

    reg[31:0] A;
    reg[31:0] B;
    reg[31:0] aluResult;
    reg br;
    assign ALUResult = aluResult;
    assign Br = br;
 
always @(*) begin
    case (selA) 
        0: A = rs1;
        1: A = PC;
    endcase
end

always @(*) begin
    case (selB) 
        0: B = rs2;
        1: B = imm;
    endcase
end

always @(*) begin
    case (alu_ctrl)
        `ADD: begin 
            aluResult = A + B; 
            br = 0; 
        end
        `SUB: begin 
            aluResult = A + (~B + 1); 
            br = 0; 
        end
        `AND: begin
             aluResult = A & B; 
             br = 0; 
        end
        `OR: begin 
            aluResult = A | B; 
            br = 0; 
        end
        `XOR: begin 
            aluResult = A ^ B; 
            br = 0; 
        end
        `SLL: begin 
            aluResult = A << B[4:0]; 
            br = 0; 
        end
        `SRL: begin 
            aluResult = A >> B[4:0]; 
            br = 0;
        end
        `SRA: begin 
            aluResult = ($signed(A)) >>> B[4:0];
            br = 0; 
        end
        `SLT: begin 
            aluResult = (($signed(A)) < ($signed(B))) ? 1:0; 
            br = 0; 
        end
        `SLTU: begin 
            aluResult = (A<B) ? 1:0; 
            br = 0; 
        end
        `BEQ: begin 
            if(A == B) begin
                br = 1;
            end else begin
                br = 0;
            end
        end
        `BNE: begin
            if(A == B) begin
                br = 0;
            end else begin
                br = 1;
            end
        end
        `BLT: begin
            if($signed(A)<$signed(B)) begin
                br = 1;
            end else begin
                br = 0;
            end
        end
        `BLTU: begin
            if(A < B) begin
                br = 1;
            end else begin
                br = 0;
            end
        end
        `BGE: begin
            if($signed(A) >= $signed(B)) begin
                br = 1;
            end else begin
                br = 0;
            end
        end
        `BGEU: begin
            if(A >= B) begin
                br = 1;
            end else begin
                br = 0;
            end
        end
        default: begin 
            aluResult = 0; 
            br = 0; 
        end
    endcase
end

endmodule