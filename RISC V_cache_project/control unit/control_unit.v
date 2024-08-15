module control_unit
(
 input [6:0] Opcode,
 input [2:0] funct3,
 input  Zero,
 input funct7,
 output [2:0] ALUControl,
 output  RegWrite,
 output [1:0] ImmSrc,
 output  ALUSrc,
 output MemWrite,MemRead,
 output [1:0] ResultSrc,
 output PCSrc
);
wire Branch,Jump;
wire [1:0] ALUOp;
///////
assign PCSrc = (Zero&Branch )|Jump;
//////
alu_control aluu(.ALUOp(ALUOp),
.op5(Opcode[5]),
.funct7(funct7),
.funct3(funct3),
.ALUControl(ALUControl)
);
/////////////
 main_decoder control(
.Opcode(Opcode),
.RegWrite(RegWrite),
.ImmSrc(ImmSrc),
.ALUSrc(ALUSrc),
.MemWrite(MemWrite),
.ResultSrc(ResultSrc),
.Branch(Branch),
.ALUOp(ALUOp),
.Jump(Jump),
.MemRead(MemRead)
);
endmodule
