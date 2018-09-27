`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas A&M
// Engineer: Eden Habtegebrial
// 
// Create Date: 09/21/2018 02:17:11 PM
// Module Name: qfour
// Project Name:Homework 1 
// Description: A five state Mealy fsm that increments a counter value every time it finds "101" in a bit stream. 
//////////////////////////////////////////////////////////////////////////////////


module qfour(input clk, reset,DAT,output reg [3:0] counter);

//here is a register that is 3 bits and will be used to save the shifted bits

reg [2:0] shift;


//This was an always block for reseting the counter as well as reseting the start of the shift register 
//to 000. This means that everytime we shift and or the DAT value is stored in the register and when the register
//sees a 101, it increments the counter. 
always @(posedge clk)
begin 

shift <= (shift << 1) | DAT;
if(shift == 3'b101)
begin 
counter <=counter+1;
end 

 if(reset==1'b1) //reset starts at high then goes low so we need everything to be reset when it's at high
 begin 
 shift <= 3'b000;
 counter <= 4'b0000;
end 
end



endmodule
