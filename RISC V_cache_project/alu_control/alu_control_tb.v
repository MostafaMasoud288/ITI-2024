module alu_control_tb();
/////signals
reg [1:0] ALUOp ;
reg op5;
reg funct7;
reg [2:0] funct3;
wire [2:0] ALUControl;
///instantiation 
alu_control dut(ALUOp,op5,funct7,funct3,ALUControl);
/// stimulas
initial 
begin 
ALUOp=2'b00;
#10;
ALUOp=2'b01;
#10;
ALUOp=2'b10;
funct3=3'b000;
{op5,funct7}=2'b11;
#10;
ALUOp=2'b10;
funct3=3'b000;
{op5,funct7}=2'b10;
#10;
funct3=3'b110;
#10;
funct3=3'b111;
#10;

end
endmodule
