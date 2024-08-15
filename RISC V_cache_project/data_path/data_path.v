module data_path
(
 input clk,reset_n,
 input [31:0] Instr,ReadData,
 input RegWrite,ALUSrc,PCSrc,stall,
 input [2:0] ALUControl,
 input [1:0] ImmSrc,ResultSrc,
 output Zero,
 output [31:0] PC,WriteData,
 output [9:0] DataAdr
);
////internalwires////
wire [31:0] PCNext,PCPlus4,PCTarget,ALUResult,Result,programcounter;
wire [31:0] mostafa,SrcB,RD2,ImmExt;


/////muxes/////
mux_2x1 pc1(.in0(programcounter),.in1(PC),.sel(stall),.out(PCNext));
mux_2x1 pc2(.in0(PCPlus4),.in1(PCTarget),.sel(PCSrc),.out(programcounter));
mux_2x1 src(.in0(RD2),.in1(ImmExt),.sel(ALUSrc),.out(SrcB));
mux_3x1 dm(.ALUResult(ALUResult),.ReadData(ReadData),.PCPlus4(PCPlus4),.ResultSrc(ResultSrc),.Result(Result));
//mux_3x1 pc(.ALUResult(PCPlus4),.ReadData(PCTarget),.PCPlus4(PC),.ResultSrc({stall,PCSrc}),.Result(PCNext));

////ALU//////
ALU alu(.SrcA(mostafa),.SrcB(SrcB),.ALUControl(ALUControl),.ALUResult(ALUResult),.Zero(Zero));
///ADDERS///
adder addpc(.in0(PC),.in1('d4),.out(PCPlus4));
adder addext(.in0(PC),.in1(ImmExt),.out(PCTarget));
////sign extenstion////
 sign_extend sgnext( .Instr(Instr[31:7]), .ImmSrc(ImmSrc),.ImmExt(ImmExt));
///PC///
 PC_ progcount( .clk(clk),.reset_n(reset_n),.PCNext(PCNext) ,.PC(PC));
///registerfile///
register_file regfile(.clk(clk),.WE3(RegWrite),.A1(Instr[19:15]),.A2(Instr[24:20]),.A3(Instr[11:7]),.WD3(Result),.RD1(mostafa),.RD2(RD2));


assign WriteData=RD2;
assign DataAdr=ALUResult[9:0];


endmodule
