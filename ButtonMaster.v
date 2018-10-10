module ButtonMaster(Up, Down, Left, Right, Center, CodeOut)
	output reg [2:0] CodeOut;
	input Up, Down, Left, Right, Center;
	
	// find next state: Blocking (=)
	always @ (Up or Down or Left or Right or Center) begin 
		if (Up)
			CodeOut = 3'b000;
		if (Down)
			Codeout = 3'b001;
		if (Left) 
			CodeOut = 3'b010;
		if (Right) 
			CodeOut = 3'b011;
		if (Center)
			CodeOut = 3'b100;
	end
	
	
endmodule