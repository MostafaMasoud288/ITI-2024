module main_decoder_tb();
reg [6:0] Opcode;
wire RegWrite;
wire[1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire [1:0] ResultSrc;
wire Branch;
wire [1:0] ALUOp;
wire Jump;

main_decoder dut( .Opcode(Opcode),.RegWrite(RegWrite),.ImmSrc(ImmSrc),
 .ALUSrc(ALUSrc),.MemWrite(MemWrite),.ResultSrc(ResultSrc),.Branch(Branch),
 .ALUOp(ALUOp),.Jump(Jump));

initial
begin
Opcode=7'b0000011;
#10;
Opcode=7'b0100011;
#10;
Opcode=7'b0110011;
#10;
Opcode=7'b1100011;
#10;
Opcode=7'b0010011;
#10;
Opcode=7'b1101111;
#10;
Opcode=7'b0000000;
#10;
end
endmodule
