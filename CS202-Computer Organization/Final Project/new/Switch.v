`timescale 1ns / 1ps

module Switch(
    input clk,
    input rst,
    input ior,
    input switchCtrl,
    input [3:0] button4,
    input [7:0] addr,
    input [15:0] switches,
    output [15:0] SwitchData
    //output [15:0] ledout
);
    
    reg [15:0] switchData = 0;
    reg [15:0] led = 0;
    assign SwitchData = switchData;
    //assign ledout = led;

    always @(negedge clk or negedge rst) begin
        if (rst==0) begin
            switchData <= 16'h0;
        end else begin
            if (switchCtrl==1 && ior==1) begin
                if (addr == 8'b01110000) begin              //70 use 16 switches to input data
                    switchData[15:0] <= switches[15:0];
                    //led[15:0] <= switches[15:0];
                end else if(addr == 8'b01110001) begin      //71 use 12 switches to input data
                    switchData[15:0] <= {4'b0000, switches[15:4]};  
                end else if (addr == 8'b01110010) begin     //72 use 8 switches to input data
                    switchData[15:0] <= {8'b00000000, switches[15:8]};
                end else if (addr == 8'b01110100) begin     //74 确认A
                    switchData[15:0] <= {15'b0, button4[1]};
                end else if (addr == 8'b01110101) begin     //75 确认样例
                    switchData[15:0] <= {15'b0, button4[0]};
                end else if (addr == 8'b01110110) begin     //76 确认B
                    switchData[15:0] <= {15'b0, button4[3]};
                end else if (addr == 8'b01110111) begin     //77 确认
                    switchData[15:0] <= {15'b0, button4[2]};
                end 
            end
        end
    end
endmodule