module imm_gen (input [31:0] inst, output [31:0] imm_out)
always @(*) begin
case (inst[`IR_opcode]) 
`OPCODE_Arith_I: imm_out = {{21{inst[31]}}, inst[30:25], inst[24:21], inst[20]};
endcase

end

 endmodule