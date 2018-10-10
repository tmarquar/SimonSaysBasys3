module rdysetgo (A, B, C, D, blank, correct, start, clk, reset);
	output reg [3:0] A, B, C, D, blank;
	input start, clk, reset;
	input [1:0] correct;
	reg [1:0] ctime;
	reg ShowScore;
	//reg [7:0] score, finalScore;
	
	always @ (posedge clk or posedge reset) begin  
		if (reset)
		begin
			ctime <= 0;	
			ShowScore <= 0;
		end		
	    else if (start && !ShowScore)
			ctime <= ctime + 1;
		else if (!start)
			ctime <= 0;
	    
	end
	
	always @ (start or ctime) begin
		case(ctime) 
		2'b00: begin
			A = 4'b0000;
            B = 4'b0000;
            C = 4'b0000;
            D = 4'b0000;
            blank = 4'b0000;
		end		
		2'b01: begin
			A = 4'b0; 
			B = 4'b1010;
			C = 4'b0100;
			D = 4'b1100;
			blank = 4'b1000;
		end
		2'b10: begin
			A = 4'b0;
			B = 4'b0;
			C = 4'b1011;
			D = 4'b1110;
			blank = 4'b1100;
		end
		2'b11: begin
			
			A = 4'b0;
			B = 4'b0;
			C = 4'b0;
			D = 4'b0;
			blank = 4'b0000;
			ShowScore = 1;
		end
		default: begin
			A = 4'b0;
			B = 4'b0;
			C = 4'b0;
			D = 4'b0;
			blank = 4'b0000;
		end
	endcase
	end
	
	always @ (correct or ShowScore) begin
		if (ShowScore)
		begin
			case(correct) 	
				2'b01: begin //right
					if (D >= 9)
					begin
						if (C >= 9)
						begin
							if (B >= 9)
							begin
								if (A >= 9)
								begin
									A = 0;
									B = 0;
									C = 0;
									D = 0;
								end
								else
								begin
									A = A + 1;
									B = 0;
									C = 0;
									D = 0;
								end
							end
							else
							begin
								B = B+1;
								C = 0;
								D = 0;
							end
						end
						else 
						begin
							C = C + 1;
							D = 0;
						end
					end
					else
					begin
						D = D + 1;
					end
					
				end
				2'b10: begin //wrong
					//score = 0;
					ShowScore = 0;
				end
				2'b11: begin //time out
					//finalScore = score;
					//score = 0;
					ShowScore = 0;
					
				end
			endcase
			
		end
		
	end
	
	
endmodule