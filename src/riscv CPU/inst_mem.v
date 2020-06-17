module inst_mem (input [31:0]addr, output [31:0]inst_out);

	reg [7:0] mem [1023:0];
	//assign inst_out = rst? 32'b0: {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};

	assign inst_out = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};

	initial begin
    mem[0] = 8'h00; //000000000001_00000_000_00110_0010011 
    mem[1] = 8'h10; 
    mem[2] = 8'h03; 
    mem[3] = 8'h13; 
    mem[4] = 8'h00; 
    mem[5] = 8'h63; 
    mem[6] = 8'h03; 
    mem[7] = 8'h33; 
    mem[8] = 8'h3f; 
    mem[9] = 8'he3; 
    mem[10] = 8'h03; 
    mem[11] = 8'h13; 
    mem[12] = 8'he0; 
    mem[13] = 8'h03; 
    mem[14] = 8'h03; 
    mem[15] = 8'h93; 
    mem[16] = 8'h40; 
    mem[17] = 8'h73; 
    mem[18] = 8'h0e; 
    mem[19] = 8'h33; 
    mem[20] = 8'h00; 
    mem[21] = 8'h0e; 
    mem[22] = 8'h7e; 
    mem[23] = 8'h33; 
    mem[24] = 8'h00; 
    mem[25] = 8'h73; 
    mem[26] = 8'h6e; 
    mem[27] = 8'h33; 


		
	end

endmodule