// rdysetgoTest.v
// top-level module for rdysetgoTest


module rdysetgoTest(Go, an, seg, clk, reset , correct);
	output [3:0] an;
	output [0:6] seg;
	input clk, reset, Go;
	input [1:0] correct;
	
	wire IncCounter;
	wire [7:0] Count;
	wire [3:0] A, B, C, D, blank;
	wire [3:0] HexVal;
	
	ClockDivide CD(IncCounter, clk, reset);
	
	rdysetgo 	rdy(A, B, C, D, blank, correct, Go, clk, reset);
	
	Mux4Machine MM(HexVal,an,A,B,C,D,clk,reset,blank);
	
	Hex27Seg 	HS(seg,HexVal);
	
endmodule
