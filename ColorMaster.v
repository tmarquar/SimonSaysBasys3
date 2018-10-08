module ColorMaster(Colors, CurrentColor, Score, clk, reset);
	output reg [1:0] CurrentColor, Score;
	input [31:0] Colors;
	input clk, reset; 
	
	// clock and reset: non Blocking (<=)
	always @ (posedge clk or posedge reset) begin // async
		if (reset) ;
		else ;
	end
	// find next state: Blocking (=)
	always @ () begin 
		case ()
			
			default: nS=;
		endcase 
	end
	// set state: non Blocking (<=)
	always @ (posedge clk) begin
		case ()
			default:
    endcase
	end
	
endmodule