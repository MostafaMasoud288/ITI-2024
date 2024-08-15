module PC_tb();
  reg clk,reset_n;
  reg [31:0] PCNext ;
  wire[31:0]PC;
PC dut(clk,reset_n,PCNext,PC);
always
begin
clk=0;
#100;
clk=1;
#100;
end

initial
begin
PCNext=336;
reset_n=0;
#100;
reset_n=1;
#100;
reset_n=0;
#100;

end
endmodule
