`timescale 1ns / 1ps



module MemOrIO(
        input mRead,                  // 1:read data from memory
        input mWrite,                 // 1:write data to memory
        input IORead,                 // 1:read data from IO
        input IOWrite,                // 1:write data to IO
        input[31:0] addr_in,          // from ALU, to judge IO or memory
        output[31:0] addr_out,        // ...
        input[31:0] m_rdata,          // data from memory
        input[15:0] io_rdata,         // data from IO
        input[31:0] r_rdata,          // data from register
        output[31:0] r_wdata,         // data to be wriiten to register
        output reg [31:0] write_data, // Data to be writen to memory or I/O
        output flag,
        output LEDCtrl,               
        output TubeCtrl,              
        output SwitchCtrl);         
    
    assign addr_out   = addr_in;
    assign r_wdata    = (IORead == 1)?{16'h0000,io_rdata}:m_rdata;                //only 16 switches
    assign SwitchCtrl = (IORead == 1 && addr_in[7:4] == 4'b0111)?1'b1:1'b0;       //0xFFFF_FC70
    assign LEDCtrl    = (IOWrite == 1 && addr_in[7:4] == 4'b0110)?1'b1:1'b0;      //0xFFFF_FC60
    assign TubeCtrl   = (IOWrite == 1 && addr_in[7:4] == 4'b0101)?1'b1:1'b0;      //ַ0xFFFF_FC50
    assign flag       = (IOWrite == 1 && addr_in[7:0] == 8'b01010001)?1'b1:1'b0;  //ַ0xFFFF_FC51
    
   
    always @*begin
        if ((mWrite == 1'b1)||(IOWrite == 1'b1)) begin
            case (flag)
                1'b0: write_data = r_rdata;
                1'b1: write_data = 32'h000c5202;
            endcase
        end
        // else begin
        //     write_data = 32'hZZZZ_ZZZZ;
        // end
    end
endmodule
