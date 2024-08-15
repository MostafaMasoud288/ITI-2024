module sign_extend_tb();

reg [31:7] Instr;
reg [1:0] ImmSrc;
wire [31:0] ImmExt ;

sign_extend dut (Instr,ImmSrc,ImmExt);

initial
begin
Instr=25'h00f000;
ImmSrc=0;
#10;
ImmSrc=1;
#10;
ImmSrc=2;
#10;
ImmSrc=3;
#10;
Instr=25'h410fff;
ImmSrc=0;
#10;
ImmSrc=1;
#10;
ImmSrc=2;
#10;
ImmSrc=3;
#10;
end
endmodule

