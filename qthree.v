`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas A&M
// Engineer: Eden Habtegebrial
// 
// Create Date: 09/21/2018 02:17:11 PM
// Module Name: qthree
// Project Name:Homework 1 
// Description: This is an ALU that excecutes various operations.  
//////////////////////////////////////////////////////////////////////////////////


module qthree(input [3:0]a,[1:0] b,[2:0] select, output reg [4:0] out);

//reg [2:0] state;
//declare all states as constants 
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;
parameter S5=3'b101;
parameter S6=3'b110; 
parameter S7=3'b111; 


always @ (a or b or select)
        begin
    case(select)
//First case checks if DAT's input was 1 then goes to S2 if it is and returns to S1 if not.
S0: if(select==3'b000)
    begin 
    out=a|b; 
    end 

S1: if(select==3'b001)
    begin 
    out=a+b; 
    end 

S2: if(select==3'b010)
    begin 
    out=a-b; 
    end 

S3: if(select==3'b011)
    begin
    out=a/b;
    end 

S4: if(select==3'b100) 
    begin 
    out=a % b; 
    end 

S5: if(select==3'b101) 
    begin 
    out= a<<1;
    end 

S6:if(select==3'b110) 
    begin 
    out=(a>=b); 
    end
 
S7:if(select==3'b111) 
    begin 
    out=(a&b); 
    end 


endcase
end
endmodule 



