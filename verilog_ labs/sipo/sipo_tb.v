module sipo_tb();
reg data;
reg clk,rst;
wire q1,q2,q3,q4;

sipo s1(data,clk,rst,q1,q2,q3,q4);
always 
begin
clk=0;
#5;
clk=1;
#5;
end

initial
begin
data=1;
rst=1;
#10;
rst=0;
#10;
data=0;
#10;
data=1;
#10;
data=1;
#10;
end
endmodule
