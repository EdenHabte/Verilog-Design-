`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas A&M
// Engineer: Eden Habtegebrial
// 
// Create Date: 09/20/2018 02:17:11 PM
// Design Name: Question 5
// Module Name: qfive_tb
// Project Name: Homework 2
// Target Devices: 
// Tool Versions: 
// Description: A four state finite state machine's testbench. 
//////////////////////////////////////////////////////////////////////////////////


module qfive_tb;

// Inputs to the DUT
reg clk; 
reg a; 
// Output of the DUT
wire z; 
reg rst;


//Connecting the ports accordingly
qfive qfive( 
.clk(clk),
.a(a),
.rst(rst),
.z(z)
);

initial begin 
$monitor("time=%d, clk=%d, a=%d, z=%b", $time, clk, a, z);

clk=1'b0;//Initializing the clock to start at low.

//The delays here add some time in between each bit of "a" being 
//simulated therefore allows us to see it more clearly on the waveform.
//The "a=" statements exercise the input to test the module.


rst=0;

#50
rst=1;

#30; 
a=1'b1;
#30;
a=1'b1;
#30;
a=1'b0;
#30;
a=1'b0;
#30;
a=1'b1;
#30;
a=1'b0;
#30;
a=1'b1;
#30;
a=1'b1;
#500; 
$finish; //prints out to the waveform

end 


//Generate a cycle clock with 1Mbps=1000ns
//Therefore,we need a half cycle delay of 500
always 
begin
  #500  clk <= ~clk;
end
endmodule
