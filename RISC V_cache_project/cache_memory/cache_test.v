module Top_tb();
reg clk=0,mem_read,mem_write,reset;
reg [9:0]WordAddress;
reg [31:0]DataIn;
wire stall;
wire [31:0]DataOut;

top_cache_system Memory_last (.clk(clk),.rst(reset),.MemRead(mem_read),.MemWrite(mem_write),.datain(DataIn),
.address(WordAddress),.stall(stall),.dataout(DataOut));


always #5 clk=~clk;

initial begin
reset=1'b0;
mem_read=1'b0; 
mem_write=1'b0;
WordAddress=10'b000_00000_00;
DataIn=32'h0;
#1;
reset=1'b1;

#14;
WordAddress=10'b000_00000_00;
DataIn=32'h30;
mem_read=1'b0; 
mem_write=1'b1;
#50;
DataIn=32'h5;
WordAddress=10'b000_00000_01;
#50;
DataIn=32'h3;
WordAddress=10'b000_00000_10;
#50;
DataIn=32'h6;
WordAddress=10'b000_00000_11;
#50;
mem_read=1'b1;
mem_write=1'b0;
WordAddress=10'b000_00000_10;
#50;
WordAddress=10'b000_00001_00;
DataIn=32'h4;
mem_read=1'b0; 
mem_write=1'b1;
#50;
WordAddress=10'b000_00001_01;
DataIn=32'h5;
#50;
WordAddress=10'b000_00001_11;
DataIn=32'h6;
mem_read=1'b0; 
mem_write=1'b1;
#50;
mem_read=1'b1;
mem_write=1'b0;
WordAddress=10'b000_00001_00;
#50;
end
endmodule

