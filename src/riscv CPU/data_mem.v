module data_mem (input clk, input [31:0]addr, input [31:0]write_data, input mem_write, input mem_read, input [2:0]func3, output reg [31:0]data_out);

	reg [7:0]mem[1023:0];

	always @(posedge clk) begin
		case (func3)
			`F3_SW: begin
				mem[addr] <= write_data[7:0];
				mem[addr+1] <= write_data[15:8];
				mem[addr+2] <= write_data[23:16];
				mem[addr+3] <= write_data[31:24];
			end
			`F3_SH: begin
				mem[addr] <= write_data[7:0];
				mem[addr] <= write_data[15:8];
			end
			`F3_SB: begin
				mem[addr] <= write_data[7:0];
			end
		endcase
	end

	always @(*) begin
		case (func3)
			`F3_LW: data_out = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};
			`F3_LH: data_out = {16{mem[addr+1][7]} ,mem[addr+1], mem[addr]};
			`F3_LB: data_out = {24{mem[addr][7]}, mem[addr]};
			`F3_LHU: data_out = {16'b0, mem[addr+1], mem[addr]};
			`F3_LBU: data_out = {24'b0, mem[addr]};
		endcase
	end

	initial begin
		mem[0] = 0;
	end

endmodule