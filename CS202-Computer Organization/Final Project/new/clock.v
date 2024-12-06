module Clock(fpga_clk, cpu_clk, upg_clk, tube_clk);
    input fpga_clk;
    output cpu_clk;
    output upg_clk;
    output reg tube_clk;

    cpuclk CPUclk (
        .clk_in1(fpga_clk),
        .clk_out1(cpu_clk),
        .clk_out2(upg_clk)
    );
    reg [31:0] count3; 
    initial begin
        count3<=0;
        tube_clk<=0;
    end
    always @ (posedge fpga_clk) begin
        if(count3==(50000>>1)-1) begin
            tube_clk <= ~tube_clk;            // invert clock
            count3<=0;
        end 
        else begin
            count3 <= count3+1;
        end
    end
endmodule
