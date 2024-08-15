module sequence_detector_tb();
 reg x,clk,rst;
 wire flag;
sequence_detector dut(x,clk,rst,flag);
always
begin
clk=0;
#5;
clk=1;
#5;
end

initial
begin
rst=1;
#20;
rst=0;
x=1;
#10;
x=0;
#10;
x=1;
#10;
x=1;
#10;
x=0;
#10;
x=1;
#10;
x=0;
#10;
x=1;
#10;
end
endmodule