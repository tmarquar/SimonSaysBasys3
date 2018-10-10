// ColorTest.v
// top-level module for DisplayColors


module ColorTest(DisplayColors, clk, reset, ColorOut);
	input clk, reset, DisplayColors;
	output [1:0] ColorOut;
	//wire set;
	reg [31:0] Colors = 32'b11110000_11110000_11110000_11100100;
	
	//BitCounter 	   BC(Colors, set, clk, reset);
	
	DisplayColors  DC(Colors, DisplayColors,, ColorOut, clk, reset);
	
endmodule
