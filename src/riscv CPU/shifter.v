<<<<<<< HEAD
module shifter(input [31:0] a,input [4:0]  shamt,input [1:0]alufn,output reg  [31:0] r);
=======
module shifter(input [31:0] a,input [4:0]  shamt,input [1:0]type, output reg  [31:0] r);
>>>>>>> Haitham
   always @ (*) begin
        case (type)
            2'b00: r <= (a>>shamt);
            2'b01: r <= (a<<shamt);
<<<<<<< HEAD
            2'b10: r<= ($signed(a)>>>shamt);
=======
            2'b10: r <= ($signed(a)>>>shamt);
>>>>>>> Haitham
        endcase
    end
endmodule