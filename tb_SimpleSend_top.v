// tb_SimpleSend_top.v
// test bench for WS2812B LED strip driver
// VERY basic design, sends same color to all modules

`timescale 1ns/1ns
module tb_SimpleSend_top;
	wire	dataOut, Ready2Go;
	reg   [15:4] sw;
	reg   [3:1]  NumLEDs;
	reg 	Go, clk, reset;

	SimpleSend  ssend(dataOut,sw,NumLEDs,Go,clk,reset,Ready2Go);
  
  always // Note:  1/100M = 10E-9
    #5 clk = !clk;

  initial begin
    $dumpfile("tb_SimpleSend_top.vcd");
    $dumpvars(0,tb_SimpleSend_top);
    clk=0; reset=1; Go=0; 
    //NumLEDs=3'b001;  // number of LED modules
    NumLEDs=3'b010;  // number of LED modules
    sw=12'h4A9;  // arbitrary setting for bits set to all modules
    #20 reset=0; 
  // reset is 281,000 ns
  // bits are 1,280 ns each, or 30,720 ns per module for 24 bits
  // that's 311,720 ns for just one module
  //#315000 $finish;  // for one module
  #720000 $finish;    // for two modules, two sw settings
   end  
  
  initial begin
    #40  Go=1;   // press Go button
    #80  Go=0;   // release Go button
    while(!Ready2Go) begin #10; end // Wait for Ready2Go indication
    #2000 sw=12'h864;  // arbitrary new setting for bits set to all modules
    #40  Go=1;   // press Go button
    #80  Go=0;   // release Go button     
  end  
endmodule
