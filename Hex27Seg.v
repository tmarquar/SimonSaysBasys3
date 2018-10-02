module Hex27Seg(Leds,HexVal);
	output [0:6] Leds;
	input [3:0] HexVal;
	reg [0:6] Leds;
	// Signal correspodence is as follows:
	// Display Ledsment: a b cc d e f g (all active low: 0--on, 1--off)
	// Leds output bit: 0 1 2 3 4 5 6 
	// HexVal[3:0] has MSb at bit 3,LSb at bit 0
	always  @(HexVal) // Do this whenever HexVal changes
	begin
	case(HexVal)
		4'h0: Leds = 7'b000_0001; // forms the character for 0
		4'h1: Leds = 7'b100_1111;
		4'h2: Leds = 7'b001_0010;
		4'h3: Leds = 7'b000_0110;
		4'h4: Leds = 7'b100_1100;
		4'h5: Leds = 7'b010_0100;
		4'h6: Leds = 7'b010_0000;
		4'h7: Leds = 7'b000_1111;
		4'h8: Leds = 7'b000_0000;
		4'h9: Leds = 7'b000_0100;
		4'hA: Leds = 7'b000_1000; // r
		4'hB: Leds = 7'b110_0000; // G
		4'hC: Leds = 7'b011_0001; // y
		4'hD: Leds = 7'b100_0010; // d
		4'hE: Leds = 7'b011_0000; // o
		4'hF: Leds = 7'b011_1000; // forms the character for F
		default: Leds = 7'b111_1111; // specify a default (all off)
	endcase
	end
endmodule