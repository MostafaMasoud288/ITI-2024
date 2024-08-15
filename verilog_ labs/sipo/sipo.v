
module d_ff
(
input d,clk,rst,
output reg q
);
always@(posedge clk)
begin
if(rst)
q<=0;
else
q<=d;
end
endmodule
///////////////////////

module sipo(
input data,
input clk,rst,
output q1,q2,q3,q4
);
wire  d2,d3,d4;
d_ff k1(.clk(clk),.rst(rst),.d(data),.q(q1));
d_ff k2(.clk(clk),.rst(rst),.d(q1),.q(q2));
d_ff k3(.clk(clk),.rst(rst),.d(q2),.q(q3));
d_ff k4(.clk(clk),.rst(rst),.d(q3),.q(q4));

endmodule


