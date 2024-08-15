module fifo_tb();
///signals
reg clk ,reset,wr_e,r_e;
reg [31:0] data_in;
wire [31:0] data_out;
wire full,empty;
////instantiation
FIFO dut(clk ,reset,wr_e,r_e,data_in,data_out,full,empty);
///clk generation
always
begin
clk=0;
#5;
clk=1;
#5;
end
/////test cases
initial 
begin
reset=1;
#20;
reset=0;
#10;
wr_e=1;
data_in=10;
#10;
wr_e=1;
data_in=20;
#10;
wr_e=1;
data_in=30;
#10;
wr_e=1;
data_in=40;
#10;
wr_e=1;
data_in=50;
#10;
wr_e=1;
data_in=60;
#10;
wr_e=1;
data_in=70;
#10;
wr_e=1;
data_in=80;
#10;
wr_e=1;
data_in=230;
#10;
wr_e=0;
#10;
/////
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=1;
#10;
r_e=0;
#10;
end
endmodule

