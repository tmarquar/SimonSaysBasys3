module ColorMaster(Colors, IncCounter, PlayerInput, rdyGo, SetColors, ColorOut, ScoreOut, clk, reset);
	output reg SetColors, rdyGo;
	output reg [1:0] ColorOut, ScoreOut;
	input [31:0] Colors;
	input [2:0] PlayerInput;
	input clk, reset
	reg DisplaySequence;
	reg [5:0] CurrentEnd, CurrentColor;
	reg [1:0] tempScoreOut;
	reg Delay[1:0];
	
	
	// clock and reset: non Blocking (<=)
	always @ (posedge clk) begin // async
		if (!reset) 
		begin
			SetColors <= 0;
			CurrentEnd <= 1;
			CurrentColor <= 1;
			DisplaySequence <= 1;
			Delay <= 0;
		end	
		else
		begin
			ColorOut <= {Colors[CurrentColor], Colors[CurrentColor-1]};
			SetColors <= 1;
		end
	end
	// find next state: Blocking (=)
	always @ (posedge IncCounter) begin 
		if (DisplaySequence && Delay != 2'b11)
			delay <= delay + 1;
			
		if (DisplaySequence && Delay == 2'b11)
		begin
			if (CurrentColor >= CurrentEnd)
			begin
				CurrentColor <= 1;
				DisplaySequence <=0;
				rdyGo <= 1;
			end
			else 
			begin
				
				CurrentColor <= CurrentColor + 2;
			end
		end
		
	end
	
	always @(PlayerInput) begin
		if (!DisplaySequence)
		begin
			rdyGo = 0;
			if (PlayerInput[2])
			begin
				ScoreOut = tempScoreOut;
				tempScoreOut = 2'b00;
				if (ScoreOut == 2'b01)
				begin
					if (CurrentColor >= CurrentEnd)
					begin
						CurrentEnd = CurrentEnd + 2;
						CurrentColor = 1;
						Delay = 2'b00; 
						DisplaySequence = 1; // Won't we want a small delay?
					end
					else 
					begin
						CurrentColor = CurrentColor + 2;
					end
				end
				else 
				begin
					CurrentEnd = 1;
					CurrentColor = 1;
					//DisplaySequence = 0;
				end
				
			end
			else
			begin
				ColorOut = PlayerInput[1:0];
				if (PlayerInput[1:0] == {Colors[CurrentColor], Colors[CurrentColor-1]})
				begin
					tempScoreOut = 2'b01;
				end
				else 
				begin
					tempScoreOut = 2'b10;
				end
			end
		end
		//ScoreOut = 
	end
	
endmodule