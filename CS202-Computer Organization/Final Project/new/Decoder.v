module Decoder(rs1,rs2,inst,mem_data,ALUResult,isjal,isjalr,RegWrite,MemtoReg,imm,cpu_clk,rst,PCplus4);
    output[31:0] rs1;                   // data from register1
    output[31:0] rs2;                   // data from register2
    input[31:0]  inst;                  // from InstructionFetcher
    input[31:0]  mem_data;   			// data from memory or IO to be written
    input[31:0]  ALUResult;   			// data from ALUResult
    input        isjal;                 // 1: jal instruction 0:not
    input        isjalr;                // 1: jalr instruciton 0:not
    input        RegWrite;              // 1: Write data to register
    input        MemtoReg;              // memtoreg signal from ctrler
    output[31:0] imm;                   // from ImmGenerator
    input		 cpu_clk,rst;           // cpu_clk and reset signal
    input[31:0]  PCplus4;               // pc+4 to isjal

    reg[31:0] register[0:31];
    reg[31:0] WritingData = 0;
    reg[31:0] reg_s1;          
    reg[31:0] reg_s2;      
    wire[4:0] rd;          
    assign rd = inst[11:7];
    
    ImmGenerator immGenerator(inst,imm);

    assign rs1 = reg_s1;
    assign rs2 = reg_s2;

    always @ * begin
        case (inst[6:0])
            7'b0110011,7'b1100011:begin               // add,addi...
                reg_s1 = register[inst[19:15]];
                reg_s2 = register[inst[24:20]];
            end
            7'b0010011,7'b1100111,7'b0000011:begin    
                reg_s1 = register[inst[19:15]];
                reg_s2 = 0;
            end
            7'b0100011:begin  //Store Type
                reg_s1 = register[inst[19:15]];
                case (inst[14:12])                                        //store in memory
                    3'b000: reg_s2 = {24'b0,register[inst[24:20]][7:0]};  //sb
                    3'b001: reg_s2 = {16'b0,register[inst[24:20]][15:0]}; //sh                                              
                    3'b010: reg_s2 = register[inst[24:20]];               //sw
                endcase
            end
            default:begin
                reg_s1 = 0;
                reg_s2 = 0;
            end
        endcase
    end


    integer i;

    initial begin
        for (i=0;i<32;i=i+1) register[i] <= 0;
        register[1] = 14'b10000000000000;  //sp
    end
    
    always @(*) begin
        if (isjal||isjalr) begin
            WritingData = PCplus4;
        end
        else if(~MemtoReg) begin
            WritingData = ALUResult;
        end
        else begin
            WritingData = mem_data;
        end
    end

    always @(posedge cpu_clk or negedge rst) begin
        if (rst==0)begin
            for (i=0;i<32;i=i+1) register[i] <= 0;
            register[1] = 14'b10000000000000;  //sp
        end
        else if(RegWrite == 1 && inst[11:7] != 5'b00000) begin
             case (inst[6:0])
                
                7'b0000011: begin
                    case(inst[14:12])
                        3'b000: register[inst[11:7]] <= {{24{WritingData[7]}}, WritingData[7:0]};       //lb
                        3'b001: register[inst[11:7]] <= {{16{WritingData[15]}}, WritingData[15:0]};     //lh
                        3'b010: register[inst[11:7]] <= WritingData;                                    //lw
                        3'b100: register[inst[11:7]] <= {{24{1'b0}}, WritingData[7:0]};                 //lbu
                        3'b101: register[inst[11:7]] <= {{16{1'b0}}, WritingData[15:0]};                //lhu
                    endcase 
                    
                end
                default: begin
                    register[inst[11:7]] <= WritingData;
                end
            endcase
        end
    end
endmodule