module data_memory_tb();
 reg clk,WE;
 reg [31:0]A;
 reg [31:0]WD;
 wire[31:0] RD;

data_memory dut(clk,WE,A,WD,RD);
always
begin
clk=0;
#50;
clk=1;
#50;
end
initial 
begin
A=10;
WE=0;
#100;
WE=1;
A=205;
WD=32'h15151515;
#100;
WE=0;
#100;
end
endmodule 
