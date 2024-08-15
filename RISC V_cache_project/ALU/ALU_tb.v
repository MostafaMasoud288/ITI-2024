module ALU_tb(); 

reg [31:0] SrcA;
reg [31:0] SrcB;
reg [2:0] ALUControl;
wire [31:0] ALUResult;
wire Zero;

ALU dut(SrcA, SrcB , ALUControl , ALUResult , Zero);

initial 
begin
SrcA=10;
SrcB=20;
ALUControl=0;
#10;
ALUControl=1;
#10;
ALUControl=2;
#10;
ALUControl=3;
#10;
ALUControl=4;
#10;
ALUControl=5;
#10;
ALUControl=1;
SrcA=10;
SrcB=10;
#10;
end

endmodule
 

