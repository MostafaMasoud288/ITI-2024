module piso(
input shift_load,clk,
input  p,q,r,s,
output reg  Q0,Q1,Q2,Q3
);

always@(posedge clk)
begin
Q0<=p;
Q1<=((Q0&shift_load)|(q&(~shift_load)));
Q2<=((Q1&shift_load)|(r&(~shift_load)));
Q3<=((Q2&shift_load)|(s&(~shift_load)));
end 
endmodule
