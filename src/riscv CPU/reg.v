module register #(parameter N = 32) (input clk, input rst, input [N-1:0]in, output reg [N-1:0]out);

	always @(posedge rst) begin
		out = 0;
	end

	always @(posedge clk) begin
		if(~rst)
		out <= in;
	end

endmodule