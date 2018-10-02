module rdysetgo (A, B, C, D, start, IncCounter, clk, reset);
	output reg [3:0] A, B, C, D;
	input start, clk, reset, IncCounter;
	reg [1:0] time;
	// clock and reset: non Blocking (<=)
	always @ (posedge reset) begin // async
		if (reset) begin
			
		end
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