module alu_ctrl (input [1:0] alu_op, input [6:0] func7, input [2:0] func3, output [3:0] alufn)
always @(*) begin
case (alu_op) 
2'b00: alufn = `ALU_ADD;
endcase

end

 endmodule