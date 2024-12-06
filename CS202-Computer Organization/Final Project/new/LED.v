`timescale 1ns / 1ps

module LED (
    input			ledrst,		
    input			led_clk,	
    input           LEDCtrl,    // only 1 can turn on the LED
    input	[1:0]	ledaddr,	// 2'b00: use 16LED 
                                // 2'b10: use 8 first half LED 
                                // 2'b 11:last half 8 LED
    input	[31:0]	ledwdata,	// the data (from register/memorio)  waiting for to be writen to the leds of the board
    
    output [15:0]	ledout		// connonet with LED on board [pin]
);
  
    reg [15:0]led = 0;
    assign ledout = led;
    always @ (negedge led_clk or negedge ledrst) begin
        if (!ledrst) begin
            led <= 16'h0000;
        end else if (LEDCtrl) begin
            case (ledaddr)
                2'b00: led[15:0] <= ledwdata[15:0];
                2'b10: led[15:8] <= ledwdata[7:0];
                2'b11: led[7:0]  <= ledwdata[7:0];
                default: led <= led;
            endcase
        end
    end
	
endmodule
