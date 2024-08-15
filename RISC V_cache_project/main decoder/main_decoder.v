module main_decoder(
input [6:0] Opcode,
output reg RegWrite,
output reg[1:0] ImmSrc,
output reg ALUSrc,
output reg MemWrite,MemRead,
output reg [1:0] ResultSrc,
output reg Branch,
output reg [1:0] ALUOp,
output reg Jump
);
always@*
begin
case(Opcode)
7'b0000011:
 begin//lw
 RegWrite=1;
 ImmSrc=2'b00;
 ALUSrc=1;
 MemWrite=0;
 ResultSrc=2'b01;
 Branch=0;
 ALUOp=2'b00;
 Jump=0;
 MemRead=1;
 end
7'b0100011://sw
 begin
 RegWrite=0;
 ImmSrc=2'b01;
 ALUSrc=1;
 MemWrite=1;
 ResultSrc=2'bxx;
 Branch=0;
 ALUOp=2'b00;
 Jump=0;
 MemRead=0;
  end
7'b0110011://R-type
 begin
 RegWrite=1;
 ImmSrc=2'bxx;
 ALUSrc=0;
 MemWrite=0;
 ResultSrc=2'b00;
 Branch=0;
 ALUOp=2'b10;
 Jump=0;
 MemRead=0;
 end
7'b1100011://beq
 begin
 RegWrite=0;
 ImmSrc=2'b10;
 ALUSrc=0;
 MemWrite=0;
 ResultSrc=2'bxx;
 Branch=1;
 ALUOp=2'b01;
 Jump=0;
 MemRead=0;
 end
7'b0010011://i-type
 begin
 RegWrite=1;
 ImmSrc=2'b00;
 ALUSrc=1;
 MemWrite=0;
 ResultSrc=2'b00;
 Branch=0;
 ALUOp=2'b10;
 Jump=0;
 MemRead=0;
 end
7'b1101111://jal
 begin
 RegWrite=1;
 ImmSrc=2'b11;
 ALUSrc=1'bx;
 MemWrite=0;
 ResultSrc=2'b10;
 Branch=0;
 ALUOp=2'bxx;
 Jump=1;
 MemRead=0;
  end
default:
begin
 RegWrite=1;
 ImmSrc=2'b00;
 ALUSrc=1;
 MemWrite=0;
 ResultSrc=2'bxx;
 Branch=0;
 ALUOp=2'b00;
 Jump=0;
 MemRead=0;
 end
endcase
end
endmodule