module ColorCreator(
	input [7:0]reg colorIn;
	output [31:0] reg colorOut;
	);
	
assign colorOut = {colorIn[0:7], colorIn [7:0], colorIn[0:7], colorIn[7:0]} ;

endmodule