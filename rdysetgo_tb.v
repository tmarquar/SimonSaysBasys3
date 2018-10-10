`timescale 1ns/100ps   
module rdysetgo_tb();
    wire [3:0] tan;
	wire [0:6] tseg;
	reg  tGo;
    reg  tclk, treset;
	reg  [1:0] tcorrect;

    // Instantiate module to test
    rdysetgoTest  uut(tGo, tan, tseg, tclk, treset,tcorrect );

	always
		#5 tclk = !tclk;
	
    // Specify the testing stimulus
    initial
    begin
		$dumpfile("rdysetgo_tb.vcd");  // File for data output
        $dumpvars(0,rdysetgo_tb);  
        //$display("BCD\t | D");
        //$display("----------------------------");
        //$monitor("%b\t | %b",tBCD,tD);
		treset = 0;
		tGo = 0;
        tclk = 0;
		tcorrect = 0;
		
        #200
        $finish;
    end
	
	initial
	fork
		#1 treset = 1;
		#10 treset = 0;
		#15 tGo = 1;
		#40 tGo = 0;
		#40 tcorrect = 2'b01;
		#45 tcorrect = 2'b00;
		#50 tcorrect = 2'b01;
		#55 tcorrect = 2'b00;
		#60 tcorrect = 2'b01;
		#65 tcorrect = 2'b00;
		#70 tcorrect = 2'b01;
		#75 tcorrect = 2'b00;
		#80 tcorrect = 2'b01;
		#85 tcorrect = 2'b00;
		#90 tcorrect = 2'b01;
		#95 tcorrect = 2'b00;
		#100 tcorrect = 2'b10;
		#115 tGo = 1;
		
		
		
	join
	
	
endmodule