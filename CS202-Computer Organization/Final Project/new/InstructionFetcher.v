module InstructionFetcher(inst, oPC, PCplus4, clock, reset, ALUResult, imm, Branch, isjal, isjalr, Br, 
    upg_rst_i, upg_clk_i, upg_wen_i, upg_adr_i, upg_dat_i, upg_done_i);
    output[31:0] inst; 
    output[31:0] oPC; 
    output[31:0] PCplus4;              // (pc+4) to Decoder for jal and jalr
    input clock, reset;                

    input[31:0] ALUResult;             // where to jump for jalr: PC = rs1 + imm
    input Br;                          // whether to jump

    input[31:0] imm;                   

    input Branch;                      // 1:Btype instruction
    input isjal; 
    input isjalr; 
    


    input upg_rst_i;                    // UPG reset (Active High)
    input upg_clk_i;                    // UPG clock (10MHz)
    input upg_wen_i;                    // UPG write enable 
    input[13:0] upg_adr_i;              // UPG write address
    input[31:0] upg_dat_i;              // UPG write data
    input upg_done_i;                   // 1 if program finished

    reg[31:0] PC=0, NPC=0;  
    assign PCplus4 = PC + 4;

    always @(Branch or Br or imm or isjal or isjalr or PC or inst or ALUResult) 
    begin
        if((Branch == 1 && Br == 1)  || isjal == 1)
            NPC = PC + imm;
        else if(isjalr == 1)
            NPC = ALUResult;
        else
            NPC = PC + 4;
    end

    always @( negedge clock or negedge reset)
    begin 
        if(reset == 0) PC <= 32'h0000_0000; 
        else PC <= NPC; 
    end


    assign oPC = PC;

    wire kickOff = upg_rst_i | (~upg_rst_i & upg_done_i);
    prgrom instmem(
        .clka (kickOff ? clock : upg_clk_i),
        .wea (kickOff ? 1'b0 : upg_wen_i),
        .addra (kickOff ? PC[15:2] : upg_adr_i),
        .dina (kickOff ? 32'h00000000 : upg_dat_i),
        .douta (inst)
    );

endmodule
