module top_layer
(
 input clk,rst_n
);

///internal wires
wire [31:0] mostafa;
wire [31:0] PC,Instr,WriteData,ReadData,ALUResult,PCNext,PCTarget,PCPlus4,ImmExt,Result,SrcB,RD2;
wire Zero,MemWrite,MemRead,RegWrite,ALUSrc,PCSrc,Branch,Jump,stall;
wire [2:0] ALUControl;
wire [1:0] ImmSrc,ResultSrc,ALUOp;
////rom////
instruction_memory rom
(
.A(PC[9:2]),
.RD(Instr)
);
////ram////
 /*data_memory ram
(
 .clk(clk),
 .WE(MemWrite),
 .A(ALUResult[7:0]),
 .WD(WriteData),
 .RD(ReadData)
);*/

 top_cache_system cash
(
 .clk(clk),.rst(rst_n),
 .MemWrite(MemWrite),
 .MemRead(MemRead),
 .datain(WriteData),
 .address(ALUResult[9:0]),
 .dataout(ReadData),
 .stall(stall)
);
/////datapath/////
data_path dp
(
 .clk(clk),
 .reset_n(rst_n),
 .stall(stall),
 .Instr(Instr),
 .ReadData(ReadData),
 .ImmSrc(ImmSrc),
 .RegWrite(RegWrite),
 .ALUSrc(ALUSrc),
 .ALUControl(ALUControl),
 .ResultSrc(ResultSrc),
 .PCSrc(PCSrc),
 .Zero(Zero),
 .PC(PC),
 .WriteData(WriteData),
 .DataAdr(ALUResult[9:0])
);

////control////
control_unit cntrl
(
 .Opcode(Instr[6:0]),
 .funct3(Instr[14:12]),
 .funct7(Instr[30]),
 .Zero(Zero),
 .ALUControl(ALUControl),
 .RegWrite(RegWrite),
 .ImmSrc(ImmSrc),
 .ALUSrc(ALUSrc),
 .MemWrite(MemWrite),
.MemRead(MemRead),
 .ResultSrc(ResultSrc),
 .PCSrc(PCSrc)
);
endmodule



