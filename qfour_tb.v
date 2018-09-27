
`timescale 1ns / 1ps

// THE FILE NAME BELOW MATCHES THE MODULE
`include "question4.v"

module qfour_tb;

// Inputs to the DUT
reg clk;
//reg reset;
reg DAT;
// Output from the DUT
wire [3:0] counter;
reg reset;

// Init the DUT by connecting the ports
qfour qfour (
  .clk(clk),
  .reset(reset),
  .DAT(DAT),
  .counter(counter)
);

initial begin
  // Print the counter activity to the console




  // Default starting value for all input signals
  clk = 1'b0;
reset =1'b1;
  
  

  // Exercise the inputs to test the module
  //always @(posedge clk)
//  begin
  
 #100;
reset = 1'b0;
  #100;
  DAT= 1'b0;
  #100;
  DAT= 1'b1;
  #100;
  DAT = 1'b0;
  #100;
  DAT = 1'b1;
  #100;
  DAT = 1'b0;
  #100;
  DAT = 1'b1;
  #100;
  DAT= 1'b0;
  #100;
  DAT=1'b0;
  #100;
  DAT=1'b1;
  #100;
  DAT=1'b1;
  #100;
  DAT=1'b0;
  #100;
  DAT=1'b1;
  #200;
  $finish;

end

// Generate a 50% duty cycle clock with a period of 8ns.
// This is a 125MHz clock
always 
begin
  #50 clk <= ~clk;
end

endmodule
