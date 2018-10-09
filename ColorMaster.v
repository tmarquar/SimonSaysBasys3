module ColorMaster(Colors, PlayerSelection, IncCounter, Go, CurrentColor, Score, clk, reset);
	output reg [1:0] CurrentColor, Score;
	input [31:0] Colors;
	input [2:0] PlayerSelection;
	input clk, reset, IncCounter, Go; 
	reg [5:0] level; // 2^6 = 32 total colors
	reg [1:0] NextColor, NextScore;
	reg [1:0] PlayerColor;
	reg [2:0] timeout; 
	reg [5:0] numColors; // threshold
	// (Score) 
	// 00 waiting
	// 01 right
	// 10 wrong
	// 11 timeout
	
	// clock and reset: non Blocking (<=)
	always @ (posedge clk or posedge reset) begin // async
		if (reset) 
		begin
			Score <= 2'b00;
			timeout <= 3'b000;
			level <= 6'b000_001;
			numColors <= 6'b000_001;
		end
		else 
		begin
			Score <= NextScore;
		end
	end
	// find next state: Blocking (=)
	always @ (PlayerSelection or timeout) begin 
		if (PlayerSelection[2])
		begin
			if (PlayerSelection[1:0] == CurrentColor[1:0])
			begin
				NextScore = 2'b01;
				level = level + 2;
				if (level > numColors)
				begin
					level = 6'b000_001;
					numColors = numColors + 2;
				end
			end
			else
			begin
				NextScore = 2'b10;
			end
		end
		if (timeout == 3'b111) NextScore = 2'b11; 
	end
	
	always @ (posedge IncCounter or negedge IncCounter) begin 
		if (Go) timeout <= timeout + 1;
		else timeout <= 3'b0;
	end
	
	assign CurrentColor = Colors[level:level-1];
	
	
endmodule