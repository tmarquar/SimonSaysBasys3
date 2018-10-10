module ClockDivide(IncCounter, clk, reset);
	output reg IncCounter;
	input clk, reset;
	
	reg [26:0] Count, nCount;
	// clock and reset: non Blocking (<=)
	always @ (posedge clk) begin 
		if (reset) Count <= 0;
		else Count <= nCount;
		
	end
	// find next state: Blocking (=)
	always @ (Count) begin 
		if (Count == 100_000_000) 
		begin 
			nCount = 0;
			IncCounter = 1;
		end
		else
		begin
			nCount = Count + 1;
			IncCounter = 0;
		end
	end
	
	
        
endmodule