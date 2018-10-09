// Takes in the assigned colors from the Color Master and converts to a predesignated color 


module ColorConverter(

input [1:0] reg CurrentColor;
output [11:0] reg ColorOut;

);

case(CurrentColor)
begin
	2'b00: ColorOut = 3'hF00;
	2'b01: ColorOut = 3'h0F0;
	2'b10: ColorOut = 3'h00F;
	2'b11: ColorOut = 3'hFF0;
end

end module