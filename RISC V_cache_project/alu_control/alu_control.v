module alu_control(
input [1:0] ALUOp ,
input op5,
input funct7,
input [2:0] funct3,
output reg [2:0] ALUControl
);
always@*
begin

case(ALUOp)
2'b00:ALUControl=3'b000;///lw,sw
2'b01:ALUControl=3'b001;///beq
2'b10:
begin

case(funct3)
//begin
3'b000:
   begin
    if({op5,funct7}==2'b11)
       ALUControl=3'b001;//sub
    else 
       ALUControl=3'b000;//add
   end
3'b010:ALUControl=3'b101;//slt
3'b110:ALUControl=3'b011;//or
3'b111:ALUControl=3'b010;//and
default:ALUControl=3'b000;

endcase

end

default:ALUControl=3'b000;
endcase

end
endmodule