module reg_file (input clk, input rst, input [4:0]src1, input [4:0]src2, input [4:0]dest, input reg_write, input [31:0]write_data, output [31:0]rs1, output [31:0]rs2);

	reg [31:0]mem[31:0];

	always @(posedge clk) begin
		if (reg_write) begin
			mem[dest] = dest ? write_data : 0;
		end
	end

	assign rs1 = src1 ? mem[src1] : 0;
	assign rs2 = src2 ? mem[src2] : 0;

	initial begin
	   mem[0]=0;
	end

endmodule