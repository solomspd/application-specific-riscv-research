module control_unit (input [4:0] op, output reg_write, output [1:0] alu_op)
always @(*) begin
case (op) 
`OPCODE_Arith_R: begin
branch = 1'b0;
mem_read = 1'b0;
mem_to_reg = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b1;
alu_op = 2'b10;
end`OPCODE_Arith_I: begin
can_branch = 1'b0;
mem_read = 1'b0;
mem_to_reg = 1'b0;
mem_write = 1'b0;
alu_src = 1'b1;
reg_write = 1'b1;
alu_op = 2'b11;
should_jump = 1'b0;
end
`OPCODE_Arith_R: begin
branch = 1'b0;
mem_read = 1'b0;
mem_to_reg = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b1;
alu_op = 2'b10;
end`OPCODE_Arith_I: begin
can_branch = 1'b0;
mem_read = 1'b0;
mem_to_reg = 1'b0;
mem_write = 1'b0;
alu_src = 1'b1;
reg_write = 1'b1;
alu_op = 2'b11;
should_jump = 1'b0;
end
endcase

end

 endmodule