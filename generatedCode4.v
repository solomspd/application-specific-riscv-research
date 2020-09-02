module alu (input [31:0] a, input [31:0] b, input [3:0] alufn, output [31:0] alu_out)
always @(*) begin

`ALU_ADD: alu_out = a + b;`ALU_ADD : alu_out = a + b;
`ALU_ADD: alu_out = a + b;`ALU_ADD : alu_out = a + b;
end

 endmodule