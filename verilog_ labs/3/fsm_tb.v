module fsm_tb();
reg clk,reset,taken;
wire predict;
fsm dut(clk,reset,taken,predict);
always
begin
clk=0;
#5;
clk=1;
#5;
end
initial
begin
taken=0;
reset=1;
#10;
taken=0;
reset=0;
#20;
taken=1;
#20;
end
endmodule


