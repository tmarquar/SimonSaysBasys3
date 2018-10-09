module ClockDivide(IncCounter, clk, reset);
	output reg IncCounter;
	input clk, reset;
	
	reg [26:0] Count, nCount;
	parameter [26:0] oneSecond = 500000;
	// clock and reset: non Blocking (<=)
	always @ (posedge clk or posedge reset) begin // async
		if (reset) 
		begin 
			IncCounter <= 0; 
			Count <= 0; 
		end
		else Count <= nCount;
	end
	// find next state: Blocking (=)
	always @ (Count) begin 
		if (Count == oneSecond) 
		begin 
			nCount = 0;
			IncCounter = ~IncCounter;
		end
		else
		begin
			nCount = Count + 1;
			
		end
	end
	
	
endmodule