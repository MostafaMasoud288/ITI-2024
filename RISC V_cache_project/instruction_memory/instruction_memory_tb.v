module instruction_memory_tb();
 reg [7:0] A;
 wire [31:0] RD;
instruction_memory dut(A,RD);
initial begin
A=5;
#100;
A=0;
#100;
A=3;
#100;
A=8;
#100;
A=28;
#100;
end
endmodule
