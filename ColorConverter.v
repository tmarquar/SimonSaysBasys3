// Takes in the assigned colors from the Color Master and converts to a predesignated color 

// this will need to flag to load the color. 

module ColorConverter(

input [1:0] CurrentColor,
output [11:0] ColorOut,
output LoadRegister,
output RotateRegisterLeft

);
	reg [11:0] ColorOut;
	reg LoadRegister;

	always @ (CurrentColor) begin 
		
		case(CurrentColor)
		begin
			2'b00: ColorOut = 3'hF00;
			2'b01: ColorOut = 3'h0F0;
			2'b10: ColorOut = 3'h00F;
			2'b11: ColorOut = 3'hFF0;
		end
	end
end module