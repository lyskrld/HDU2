module ALU(ALU_OP,A,B,F,ZF,OF);
	  input  [2:0] ALU_OP;
	  input  [31:0] A;
	  input  [31:0]B;
	  output [31:0] F;
	  output  ZF;
	  output  OF;
	  reg [31:0] F;
	  reg    C,ZF,OF;
	 always@(*)
	  begin
		C=0;
		OF=0;
		case(ALU_OP)
			3'b000:begin F=A&B; end
			3'b001:begin F=A|B; end
			3'b010:begin F=A^B; end
			3'b011:begin F=~(A|B); end 
			3'b100:begin {C,F}=A+B;OF = A[31]^B[31]^F[31]^C; end 
			3'b101:begin {C,F}=A-B;OF = A[31]^B[31]^F[31]^C; end 
			3'b110:begin F=A<B; end
			3'b111:begin F=B<<A; end
		endcase
		ZF = F==0;
		end
endmodule