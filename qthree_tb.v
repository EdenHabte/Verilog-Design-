`timescale 1ns / 1ps


module qthree_tb;

//the four ports are a,b,select and output declared accordingly below

reg [3:0]a,b; 
reg [2:0] select;
wire[4:0] out;
 
//initiate the ports here and connect them to the testbench's ports
qthree qthree(
.a(a),
.b(b),
.select(select),
.out(out)
);

integer i;
integer j;
integer k;



initial begin 

a=4'b0001;
b=4'b0001;
select=3'b000;

$monitor("time=%d, select=%b, a=%d, b=%d, output=%b", $time, select, a, b, out);


//By created a nested for loop we can have all 8 select cases go through all 9 of the a and b combinations
for (i=0; i < 8; i=i+1)
    begin 
    select=i;
    
    for(j=1; j<4; j=j+1)
        begin 
        a=j;
        
        for(k=1; k<4; k=k+1) 
          begin 
        b=k;
          
#20;
end 
#20;
end
#20;
end

if(select==3'b110)
begin
$finish;
end 

end
endmodule
