module data_mem (input clk, input [31:0]addr, input [31:0]write_data, input mem_write, input mem_read, output [31:0]data_out);

	reg [7:0]mem[1024];

	always @(posedge clk) begin
		mem[addr] <= write_data[7:0];
		mem[addr+1] <= write_data[15:8];
		mem[addr+2] <= write_data[23:16];
		mem[addr+3] <= write_data[31:24];
	end

	assign data_out = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};

	initial begin
		
	end

endmodule