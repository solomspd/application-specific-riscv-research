module inst_mem (input [31:0]addr, output [31:0]inst_out);

	reg [7:0] mem [1023:0];

	assign inst_out = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};

	initial begin
		
	end

endmodule