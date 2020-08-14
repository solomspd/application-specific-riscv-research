`include "defines.v"
module data_mem (input clk, input [31:0]addr, input [31:0]write_data, input mem_write, input mem_read, input [2:0]func3, output reg [31:0]data_out);

	reg [7:0]mem[1024:0];

	always @(posedge clk) begin
		if (~mem_read & mem_write) begin
			case (func3)
				`F3_SW: begin
					mem[addr] <= write_data[7:0];
					mem[addr+1] <= write_data[15:8];
					mem[addr+2] <= write_data[23:16];
					mem[addr+3] <= write_data[31:24];
				end
				`F3_SH: begin
					mem[addr] <= write_data[7:0];
					mem[addr+1] <= write_data[15:8];
				end
				`F3_SB: begin
					mem[addr] <= write_data[7:0];
				end
			endcase
		end
	end

	always @(*) begin
		if (mem_read & ~ mem_write) begin
			case (func3)
				`F3_LW: data_out = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};
				`F3_LH: data_out = {mem[addr], mem[addr+1],{16{mem[addr+1][7]}}};
				`F3_LB: data_out = {mem[addr],{24{mem[addr][7]}}};
				`F3_LHU: data_out = { mem[addr], mem[addr+1],16'b0};
				`F3_LBU: data_out = {mem[addr], 24'b0};
				default: data_out = 0;
			endcase
		end else
		data_out = 0;
	end

	initial begin
		mem[0] = 8'h00;
		mem[1] = 8'hee;
		mem[2] = 8'hcc;
		mem[3] = 8'hf0;
		
	end

endmodule