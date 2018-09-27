`timescale 1ns / 1ps
module qtwo_tb;

// Inputs to the DUT
reg clk;
reg [3:0] in;
reg rst;
// Output from the DUT
wire clk_out;
wire [3:0] out;

//Initiate the DUT by connecting the ports 
qtwo qtwo(
.clk(clk),
.clk_out(clk_out),
.rst(rst),
.in(in),
.out(out)
);

//declare an integer we can use to iterate through the for loop later on in our code
integer j;

initial begin
//we want to start clock at 0 and reset at 1 as seen in the picture
clk=1'b1;
rst=1'b1;
in=4'b0000;
#30 
rst=1'b0;


for(j=1; j<32; j=j+1)
begin 
#50; //20MHz as specified in the specifications and 1/f=T=50ns
in <=in+4'b0001;

end 


//we need to reset reset after a small amount of time 


#1000 //end after 2000 cycles(since we weren't given a specification for this)
$finish; 
end 
always 
begin
  #50 clk <= ~clk;
end

endmodule
