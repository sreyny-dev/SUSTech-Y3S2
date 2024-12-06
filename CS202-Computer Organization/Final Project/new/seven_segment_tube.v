module Tube(
    input iow,
    input TubeCtrl,
    input [31:0] Data,
    input fpga_clk,
    input cpu_clk,
    input rst,
    output [7:0] SelTub,   
    output [7:0] TubNum1,
    output [7:0] TubNum2
    );

    reg [7:0] tubNum1;
    reg [7:0] tubNum2;
    reg [7:0] selTub;
    reg [31:0] data=0;
    reg [1:0] cnt=0;

    assign SelTub = selTub;
    assign TubNum1 = tubNum1;
    assign TubNum2 = tubNum2;

    reg[18:0] divclk_cnt = 0;
    reg tube_clk = 0;
    parameter maxcnt = 50000;
    always@(posedge fpga_clk) begin
        if(divclk_cnt == maxcnt) begin
            tube_clk=~tube_clk;
            divclk_cnt=0;
        end else begin
            divclk_cnt=divclk_cnt+1'b1;
        end
    end

    always@(posedge cpu_clk or negedge rst) begin
        if(TubeCtrl) begin
             data <= Data;
        end
        if(rst == 0) begin
            data <= 32'h00000000;
        end
    end


    always @(posedge tube_clk) begin
        if(cnt==2'b11) begin 
            cnt = 2'b00;
        end
        else begin
            cnt = cnt+1;
        end
    end


    task decode(input [3:0] udata, output reg [7:0] tubNum);
        case (udata)
            4'b0001: tubNum = `TUB_NUM_1;
            4'b0010: tubNum = `TUB_NUM_2;
            4'b0011: tubNum = `TUB_NUM_3;
            4'b0100: tubNum = `TUB_NUM_4;
            4'b0101: tubNum = `TUB_NUM_5;
            4'b0110: tubNum = `TUB_NUM_6;
            4'b0111: tubNum = `TUB_NUM_7;
            4'b1000: tubNum = `TUB_NUM_8;
            4'b1001: tubNum = `TUB_NUM_9;
            4'b1010: tubNum = `TUB_NUM_A;
            4'b1011: tubNum = `TUB_NUM_B;
            4'b1100: tubNum = `TUB_NUM_C;
            4'b1101: tubNum = `TUB_NUM_D;
            4'b1110: tubNum = `TUB_NUM_E;
            4'b1111: tubNum = `TUB_NUM_F;
            default: tubNum = `TUB_NUM_0;
        endcase
    endtask

    always @(cnt) begin
        case (cnt)
            2'b11: begin
                decode(data[31:28], tubNum1);
                decode(data[15:12], tubNum2);
                selTub = 8'b1000_1000;
            end
            2'b10: begin
                decode(data[27:24], tubNum1);
                decode(data[11:8], tubNum2);
                selTub = 8'b0100_0100;
            end
            2'b01: begin
                decode(data[23:20], tubNum1);
                decode(data[7:4], tubNum2);
                selTub = 8'b0010_0010;
            end
            2'b00: begin
                decode(data[19:16], tubNum1);
                decode(data[3:0], tubNum2);
                selTub = 8'b0001_0001;
            end
        endcase
    end
endmodule
