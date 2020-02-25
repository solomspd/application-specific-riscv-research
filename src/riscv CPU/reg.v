module reg #(parameter N = 32) (input clk, input rst, input in, output reg out);

	always @(posedge rst) begin
		out = 0;
	end

	always @(posedge clk) begin
		out <= in;
	end

endmodule