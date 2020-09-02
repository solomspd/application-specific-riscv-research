module pc (input clk, input rst, input [31:0] in, output [31:0] pc_out)
always @(posedge rst) begin

out = 0;
end
always @(posedge clk) begin

out <= ~rst ? in : 0
end

 endmodule