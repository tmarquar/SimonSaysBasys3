module rdysetgo (A, B, C, D, blank, ctime, start, IncCounter, clk, reset);
	output reg [3:0] A, B, C, D, blank;
	input start, clk, reset, IncCounter;
	output reg [1:0] ctime;
	
	reg [1:0] ntime;
	always @ (posedge IncCounter or posedge reset) begin  
	       if (reset)
	           ctime <= 0;	      
	       else if (start)
		       ctime <= ctime + 1;
	       else ctime <= 2'b00;
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
		default: begin
			A = 4'b0;
			B = 4'b0;
			C = 4'b0;
			D = 4'b0;
			blank = 4'b0000;
		end
	endcase
	end
	
endmodule