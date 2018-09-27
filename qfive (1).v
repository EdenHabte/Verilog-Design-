`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas A&M
// Engineer: Eden Habtegebrial
// 
// Create Date: 09/20/2018 02:17:11 PM
// Design Name: Question 5
// Module Name: qfive
// Project Name: Homework 2
// Target Devices: 
// Tool Versions: 
// Description: A four state finite state machine. 
//////////////////////////////////////////////////////////////////////////////////

//First declare the module with input and output ports.
module qfive(input clk, a, output reg z);


//The Next State needs to be a register.
reg [2:0] NS;
reg rst;
//These are the four states declares as constants.
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;

//output reg z = 1'b0;

always @(posedge clk)
begin 
if (rst == 0) 
begin NS= 3'b001;
z=0;
end 
end 

//This always block will be triggered by the change in a or the 
//posetive edge of our clock.
always @ (a or posedge clk) 
begin 
case (NS) 
//first case is as State 1 listed in the table given.
S1: if(a == 1'b0) 
        begin 
        NS=S3;
        z=1'b0;
        end 
        else 
        begin
        NS=S2;
        z=1'b1;
        end 
//Second case as State 2 listed in the table given.
S2: if(a == 1'b0)
        begin 
        NS=S3;
        z=1'b1; 
        end 
        else 
        begin 
        NS=S4;
        z=1'b0;
        end 
//Third case as State 3 listed in the table given.
S3: if(a == 1'b0)
        begin 
        NS=S4;
        z=0;
        end 
        else
        begin 
        NS=S1;
        z=1;
        end 
//Fourth case as State 4 listed in the table given.
S4: if(a==1'b0)
        begin 
        NS=S4;
        z=0;
        end 
        else 
        begin 
        NS=S1;
        z=1;
        end 

// default case will be that we come back to the start. 
default  
NS=S1;
endcase 
end 
endmodule 








