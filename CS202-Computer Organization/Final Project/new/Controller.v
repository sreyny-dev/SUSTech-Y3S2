`include "param.v"
module Controller(inst,selA,selB,alu_ctrl,Branch,isjalr,isjal,MemtoReg,RegWrite,MemWrite,IOwrite,IOread,Memread,addr);
    input[31:0]  inst;            // from InstructionFetcher
    input[21:0]  addr;            // from ALU, to judge memory or IO(0x3fffff)
    output       selA;            // 0: rs1 1:PC
    output       selB;            // 0: rs2 1:imm
    output[3:0]  alu_ctrl;        // which operation in ALU
    output       Branch;          // 1: B-type instruction 0:not
    output       isjal;           // 1: jal instrucion 0:not
    output       isjalr;          // 1: jalr instrucion 0:not
    output       MemtoReg;        // 1: From memory or IO to reg
    output       RegWrite;   	  // 1: Write data to reg
    output       MemWrite;        // 1: Write data to memory
    output       IOwrite;         // 1: Write data to IO
    output       IOread;          // 1: Read data from IO 
    output       Memread;         // 1: Read data from memory
    
    wire Rtype;
    wire sw;         
    wire lw;
    wire I_alu;
    wire[6:0] Opcode;
    wire[3:0] fun3;
    wire[7:0] fun7;
    reg[3:0] aluCtrl;
    reg sela;
    reg selb;

    
    assign selA = sela;
    assign selB = selb;
    assign Opcode = inst[6:0];
    assign fun3 = inst[14:12];
    assign fun7 = inst[31:25];
    assign alu_ctrl = aluCtrl;

    assign Rtype    = (Opcode == 7'b0110011);
    assign I_alu    = (Opcode == 7'b0010011);           // ALU with imm instrucion  
    assign sw       = (Opcode == 7'b0100011);           // include sw,sb,sh
    assign lw       = (Opcode == 7'b0000011);           // include lw,lb,lh,lbu,lhu
    assign Branch   = (Opcode == 7'b1100011);
    assign isjal    = (Opcode == 7'b1101111);
    assign isjalr   = (Opcode == 7'b1100111);
    
    assign RegWrite = (Rtype||I_alu||MemtoReg||isjal)&&(~(Branch||sw));  // can not be S-type or Branch
    assign MemtoReg = (lw);                                           
    assign MemWrite = (sw)&&(addr!=22'h3fffff);
    assign IOwrite  = (sw)&&(addr==22'h3fffff);
    assign IOread   = (lw)&&(addr==22'h3fffff);
    assign Memread  = (lw)&&(addr!=22'h3fffff);

    always @(*) begin
        case (Opcode) 
            7'b0110011: begin                             //Rtype-type
                sela = 0;
                selb = 0;
                case (fun3)
                    `FUN3_ADD_SUB: begin
                        case (fun7[5]) 
                            1'b0: aluCtrl = `ADD;
                            1'b1: aluCtrl = `SUB;
                        endcase
                    end
                    `FUN3_AND: begin
                        aluCtrl = `AND;
                    end
                    `FUN3_OR: begin
                        aluCtrl = `OR;
                    end
                    `FUN3_XOR: begin
                        aluCtrl = `XOR;
                    end
                    `FUN3_SLL: begin
                        aluCtrl = `SLL;
                    end
                    `FUN3_SHIFT_RIGHT: begin
                        case (fun7[5]) 
                            1'b0: aluCtrl = `SRL;
                            1'b1: aluCtrl = `SRA;
                        endcase
                    end
                    `FUN3_SLT: begin
                        aluCtrl = `SLT;
                    end
                    `FUN3_SLTU: begin
                        aluCtrl = `SLTU;
                    end
                endcase 
            end
            7'b0010011: begin
                sela = 0;
                selb = 1;
                case (fun3)
                    `FUN3_ADDI: begin
                        aluCtrl = `ADD;
                    end
                    `FUN3_ANDI: begin
                        aluCtrl = `AND;
                    end
                    `FUN3_ORI: begin
                        aluCtrl = `OR;
                    end
                    `FUN3_XORI: begin
                        aluCtrl = `XOR;
                    end
                    `FUN3_SLLI: begin
                        aluCtrl = `SLL;
                    end
                    `FUN3_SHIFT_RIGHT: begin
                        case (fun7[5]) 
                            1'b0: aluCtrl = `SRL;
                            1'b1: aluCtrl = `SRA;
                        endcase
                    end
                    `FUN3_SLTI: begin
                        aluCtrl = `SLT;
                    end
                    `FUN3_SLTIU: begin
                        aluCtrl = `SLTU;
                    end
                endcase
            end
            `OPCODE_L: begin
                sela = 0;
                selb = 1;
                aluCtrl = `ADD;
            end
            `OPCODE_JALR: begin         //PC = rs1 + imm
                sela = 0;
                selb = 1;
                aluCtrl = `ADD;
            end
            `OPCODE_S: begin
                sela = 0;
                selb = 1;
                aluCtrl = `ADD;
            end
            `OPCODE_B: begin
                sela = 0;
                selb = 0;
                case (fun3)
                    `FUN3_BEQ: begin
                        aluCtrl = `BEQ;
                    end
                    `FUN3_BNE: begin
                        aluCtrl = `BNE;
                    end
                    `FUN3_BLT: begin
                        aluCtrl = `BLT;
                    end
                    `FUN3_BLTU: begin
                        aluCtrl = `BLTU;
                    end
                    `FUN3_BGE: begin
                        aluCtrl = `BGE;
                    end
                    `FUN3_BGEU: begin
                        aluCtrl = `BGEU;
                    end
                    default: begin
                        aluCtrl = 0;
                    end
                endcase
            end
            `OPCODE_LUI: begin
            end
            `OPCODE_AUIPC: begin
                sela = 1;
                selb = 1;
                aluCtrl = `ADD;
            end
            `OPCODE_JAL: begin
            end
        endcase
    end
endmodule

