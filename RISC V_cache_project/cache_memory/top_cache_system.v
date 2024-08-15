module top_cache_system
(
 input clk,rst,
 input MemWrite,MemRead,
 input [31:0] datain,
 input [9:0] address,
 output [31:0] dataout,
 output stall
);
////wires
//wire [31:0] datain_cache;
wire [3:0] tag_valid;
wire update_cache,hit,ready,memwrite,memread;
wire [31:0] dataout_cache,dataout_memory;


///////////////
mux_2x1 muxi
(
.in0(dataout_memory),
.in1(dataout_cache),
.sel(hit),
.out(dataout)
);
//////////////
 cache_control cnt
(
 .ready(ready),
.tag_valid(tag_valid),
 .we(MemWrite),
 .re(MemRead),
 .clk(clk) ,
 .rst(rst),
.address(address),
.update_cache(update_cache),
.stall(stall),
.MemWrite(memwrite),
.MemRead(memread),
.hit(hit)
); 

///////////////
cache_memory memcache
(
 .clk(clk),
.rst(rst),
.update_cache(update_cache),
.hit(hit),
.datain(datain),
 .address(address),
.tag_valid(tag_valid),
.dataout(dataout_cache)
);
////////////////////
data_memory datamem (
 .clk(clk),
 .WE(MemWrite),
 .RE(MemRead), 
 .A(address),
 .WD(datain),
 .RD(dataout_memory),
.ready(ready)
);
endmodule
