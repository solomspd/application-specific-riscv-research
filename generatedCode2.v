module reg_file (input clk, input rst, input [4:0] src1, input [4:0] src2, input reg_write, input [31:0] write_data, output [31:0] rs1, output [31:0] rs2)
always @(posedge clk) begin

reg [31:0]mem[31:0];
always @(posedge clk) begin
if (reg_write && dest != 5'b0) begin
mem[dest] = dest ? write_data : 0;
end
end
assign read1 = dest ? mem[src1] : 0;
assign read2 = dest ? mem[src2] : 0;reg [31:0]mem[31:0];
always @(posedge clk) begin
if (reg_write && dest != 5'b0) begin
mem[dest] = dest ? write_data : 0;
end
end
assign read1 = dest ? mem[src1] : 0;
reg [31:0]mem[31:0];
always @(posedge clk) begin
if (reg_write && dest != 5'b0) begin
mem[dest] = dest ? write_data : 0;
end
end
assign read1 = dest ? mem[src1] : 0;
assign read2 = dest ? mem[src2] : 0;reg [31:0]mem[31:0];
always @(posedge clk) begin
if (reg_write && dest != 5'b0) begin
mem[dest] = dest ? write_data : 0;
end
end
assign read1 = dest ? mem[src1] : 0;
end

 endmodule