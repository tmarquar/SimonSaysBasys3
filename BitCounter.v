module BitCounter(Colors, set, clk, reset);
	output [31:0] Colors;
	input clk, reset, set;
	
	reg [7:0] Count, nCount;
	
	// clock and reset: non Blocking (<=)
	always @ (posedge clk) begin
		if (reset) 
		begin
			Count <= 0;
		end
		else 
		begin
			Count <= nCount;
			//Colors <= {Count[7:0], Count[7:0], Count[7:0], Count[7:0]} ;
		end
	end
	// find next state: Blocking (=)
	always @ (Count) begin 
		if (!set)
			nCount = Count + 1;
			
	end
	assign Colors = {Count[7:0], Count[7:0], Count[7:0], Count[7:0]} ;
endmodule