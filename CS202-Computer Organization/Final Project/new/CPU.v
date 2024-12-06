module CPU(
    input fpga_rst,                 //Active High
    input fpga_clk, 
    input [3:0]button4,
    input [15:0] switch16, 
    input start_pg,
    output [15:0] led16,
    output [7:0] SelTub, 
    output [7:0] TubNum1,
    output [7:0] TubNum2,
    // UART Programmer Pinouts
    // start Uart communicate at high level
    input rx,
    output tx
);

// UART Programmer Pinouts
    wire upg_clk, upg_clk_o;
    wire upg_wen_o; //Uart write out enable
    wire upg_done_o; //Uart rx data have done
    //data to which memory unit of program_rom/dmemory32
    wire [14:0] upg_adr_o;
    //data to program_rom or dmemory32
    wire [31:0] upg_dat_o;

    wire spg_bufg;
    BUFG U1(.I(start_pg), .O(spg_bufg)); // de-twitter// Generate UART Programmer reset signal

    reg upg_rst;

    always @ (posedge fpga_clk) begin
        if (spg_bufg) upg_rst = 0;
        if (fpga_rst) upg_rst = 1;
    end

    //used for other modules which don't relatetoUARTwire rst;
    wire rst;
    assign rst = (fpga_rst | (!upg_rst));
    wire cpu_clk;
    wire tube_clk;

cpuclk CPUclk (
        .clk_in1(fpga_clk),
        .clk_out1(cpu_clk),
        .clk_out2(upg_clk)
    );

 uart_bmpg_0 uart_bmpg_1
    (
        .upg_clk_i  (upg_clk),
        .upg_rst_i  (upg_rst),
        .upg_rx_i   (rx),
        .upg_clk_o  (upg_clk_o),
        .upg_wen_o  (upg_wen_o),
        .upg_adr_o  (upg_adr_o),
        .upg_dat_o  (upg_dat_o),
        .upg_done_o (upg_done_o),
        .upg_tx_o   (tx)
    );
    wire[31:0] inst;
    wire[31:0] PC;
    wire[31:0] PCplus4;
    wire[31:0] ALUResult;
    wire[31:0] write_data;
    wire[31:0] mread_data;
    wire[31:0] read_data;
    wire[31:0] address;
    wire[15:0] ioread_data;

    wire[31:0] rs1;
    wire[31:0] rs2;
    wire[31:0] imm;
    wire[3:0] alu_ctrl;
    
    wire isjal;
    wire isjalr;
    wire Branch;          
    wire Br;
    wire selA;
    wire selB;
    wire MemtoReg;
    wire RegWrite;
    wire MemWrite;
    wire MemRead;
    wire I_format;

    wire ioRead;
    wire ioWrite;

    wire SwitchCtrl;
    wire LEDCtrl;
    wire TubeCtrl;

InstructionFetcher instructionFetcher(
    .inst(inst),
    .oPC(PC),
    .PCplus4(PCplus4),
    .clock(cpu_clk),
    .reset(fpga_rst),
    .ALUResult(ALUResult),
    .imm(imm),

    .Branch(Branch),
    .isjal(isjal),
    .isjalr(isjalr),
    .Br(Br),

    .upg_rst_i(upg_rst),
    .upg_clk_i(upg_clk_o),
    .upg_wen_i(upg_wen_o & !upg_adr_o[14]),
    .upg_adr_i(upg_adr_o[13:0]),
    .upg_dat_i(upg_dat_o),
    .upg_done_i(upg_done_o)
);

ALU alu(
    .rs1(rs1),
    .rs2(rs2),
    .imm(imm),
    .PC(PC),
    .alu_ctrl(alu_ctrl),
    .selA(selA),
    .selB(selB),
    .ALUResult(ALUResult),
    .Br(Br)
); 

Controller controller(
    .inst(inst),
    .selA(selA),
    .selB(selB),
    .alu_ctrl(alu_ctrl),
    .Branch(Branch),
    .isjalr(isjalr),
    .isjal(isjal),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .IOwrite(ioWrite),
    .IOread(ioRead),
    .Memread(MemRead),
    .addr(address[31:10])
);
Decoder decoder(
    .rs1(rs1),
    .rs2(rs2),
    .inst(inst),
    .mem_data(read_data),
    .ALUResult(ALUResult),
    .isjal(isjal),
    .isjalr(isjalr),
    .RegWrite(RegWrite),
    .MemtoReg(MemtoReg),
    .imm(imm),
    .cpu_clk(cpu_clk),
    .rst(fpga_rst),
    .PCplus4(PCplus4)
);

dmemory32 dmemory32_1(
    .ram_clk_i(cpu_clk),
    .ram_wen_i(MemWrite),
    .ram_adr_i(address),
    .ram_dat_i(rs2),
    .ram_dat_o(mread_data),

    .upg_rst_i(upg_rst),
    .upg_clk_i(upg_clk_o),
    .upg_wen_i(upg_wen_o & (!upg_adr_o[14])),
    .upg_adr_i(upg_adr_o[13:0]),
    .upg_dat_i(upg_dat_o),
    .upg_done_i(upg_done_o)
);


wire flag;
MemOrIO MemOrIO_1(
    .mRead(MemRead),
    .mWrite(MemWrite),
    .IORead(ioRead),
    .IOWrite(ioWrite),
    .addr_in(ALUResult),
    .addr_out(address),
    .m_rdata(mread_data),
    .io_rdata(ioread_data),
    .r_rdata(rs2),
    .r_wdata(read_data),
    .write_data(write_data),
    .flag(flag),
    .LEDCtrl(LEDCtrl),
    .TubeCtrl(TubeCtrl),
    .SwitchCtrl(SwitchCtrl)
);
Switch switch (
    .clk(cpu_clk),
    .rst(fpga_rst),				
	.ior(ioRead),				
    .switchCtrl(SwitchCtrl),
    .button4(button4),		
    .addr(ALUResult[7:0]),	
    .switches(switch16),	
    .SwitchData(ioread_data)
    //.ledout(led16)		
);

LED led(
    .ledrst(fpga_rst),		
    .led_clk(cpu_clk),
    .LEDCtrl(LEDCtrl),
    .ledaddr(ALUResult[1:0]),	
    .ledwdata(write_data),	
    .ledout(led16)
);

Tube tube (
    .iow(ioWrite),
    .TubeCtrl(TubeCtrl),
    .Data(write_data),
    .fpga_clk(fpga_clk),
    .cpu_clk(cpu_clk),
    .rst(fpga_rst),
    .SelTub(SelTub),
    .TubNum1(TubNum1),
    .TubNum2(TubNum2)
);

endmodule
