`timescale 1ns/100ps   
module ColorTest_tb();
	
    reg  tclk, treset, tDisplayColors;
	wire  [1:0] tColorOut;

    // Instantiate module to test
    ColorTest  uut(tDisplayColors, tclk, treset, tColorOut);

	always
		#5 tclk = !tclk;
	
    // Specify the testing stimulus
    initial
    begin
		$dumpfile("ColorTest_tb.vcd");  // File for data output
        $dumpvars(0,ColorTest_tb);  
		treset = 0;
		tDisplayColors = 0;
        tclk = 0;
		
        #200
        $finish;
    end
	
	initial
	fork
		#1 treset = 1;
		#10 treset = 0;
		#10 tDisplayColors = 1;
		
		
		
	join
	
	
endmodule