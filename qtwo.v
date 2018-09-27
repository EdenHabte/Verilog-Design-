`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas A&M
// Engineer: Eden Habtegebrial
// 
// Create Date: 09/21/2018 02:17:11 PM
// Module Name: qtwo
// Project Name:Homework 1 
// Description: A clock controls a clock out signal
//and an input signal controls an output signal. 
//////////////////////////////////////////////////////////////////////////////////

//declaring the module and its input/output ports
//in is a 4bit register that contains values and out
module qtwo(input clk,[3:0] in,input rst, output reg clk_out,output reg [3:0] out);

//first we create the clock output signal using an always block triggered by clk
//This creates a clk output signal that changes b/n 0 and 1
always @(posedge clk)
begin 
if(rst == 1'b1)
clk_out <=1'b0;
else 
clk_out <= ~clk_out;
end 
//This always block will create the output register's value but it is triggered 
//by the negative edge of the clock so it only outputs the in register values 
//that coincide with the negative edge of the clock signal and when clk out is high.
always @(negedge clk)
begin 
if(clk_out == 1'b0)
begin 
out <= in;
end 
end

endmodule
