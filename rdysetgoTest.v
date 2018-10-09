// rdysetgoTest.v
// top-level module for rdysetgoTest


module rdysetgoTest(Go, an, seg, clk, reset );
	output [3:0] an, seg;
	input clk, reset, Go;
	
	wire IncCounter;
	wire [7:0] Count;
	wire [3:0] A, B, C, D, blank;
	wire [3:0] HexVal;
	
	ClockDivide CD(IncCounter, clk, reset);
	
	rdysetgo 	BC(A, B, C, D, blank, , Go, IncCounter, clk, reset);
	
	Mux4Machine MM(HexVal,an,A,B,C,D,clk,reset,blank);
	
	Hex27Seg 	HS(seg,HexVal);
endmodule
