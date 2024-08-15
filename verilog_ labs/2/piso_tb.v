module piso_tb();
reg shift_load,clk;
reg  p,q,r,s;
wire  Q0,Q1,Q2,Q3;
piso dut(shift_load,clk,p,q,r,s,Q0,Q1,Q2,Q3);

always
begin
clk=0;
#5;
clk=1;
#5;
end

initial
begin
shift_load=0;
p=0;
q=1;
r=0;
s=1;
#10;
shift_load=1;
#40;
shift_load=0;
p=1;
q=1;
r=0;
s=0;
#10;
shift_load=1;
#40;
end
endmodule
