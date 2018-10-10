`timescale 1ns/100ps   
module rdysetgo_tb();
    wire [3:0] tan;
	wire [0:6] tseg;
	reg  tGo;
    reg  tclk, treset;

    // Instantiate module to test
    rdysetgoTest  uut(tGo, tan, tseg, tclk, treset );

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
		
        #10_000 
        $finish;
    end
	
	initial
	fork
		#1 treset = 1;
		#10 treset = 0;
		#15 tGo = 1;
		
		
		
	join
	
	
endmodule