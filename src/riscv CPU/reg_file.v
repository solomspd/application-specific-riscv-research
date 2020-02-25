module reg_file (input clk, input rst, input [4:0]src1, input [4:0]src2, input [4:0]dest, input reg_write, input [31:0]write_data, output [31:0]read1, output [31:0]read2);

	reg [31:0]mem[31:0];

	always @(posedge clk) begin
		if (regwrite && dest != 5'b0) begin
			mem[dest] = write_data;
		end
	end

	assign read1 = mem[src1];
	assign read2 = mem[src2];

	initial begin
		mem = 0;
	end

endmodule