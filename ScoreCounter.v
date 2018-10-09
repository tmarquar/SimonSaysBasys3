module ScoreCounter();
	output reg ;
	input ;
	
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