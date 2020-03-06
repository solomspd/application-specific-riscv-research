`include "defines.v"

module load_store_ctrl (input [2:0]func3, output reg [2:0]store_out, output reg [1:0]load_out);

	always @(*) begin
		case (func3)
		
			`F3_LB: load_out = `LOAD_LB;
			`F3_LH: load_out = `LOAD_LH;
			`F3_LW: load_out = `LOAD_LW;
			`F3_LBU: load_out = `LOAD_LBU;
			`F3_LHU: load_out = `LOAD_LHU;

			`F3_SB: store_out = `STORE_SB;
			`F3_SH: store_out = `STORE_SH;
			`F3_SW: store_out = `STORE_SW;

		endcase		
	end

endmodule