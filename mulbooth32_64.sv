`define XLEN 32
module mulbooth32_64 ( 	input 	logic 	[31:0] rs1,rs2,
								output 	logic 	[63:0]	mul_out,
								output 	logic flag
		);
	logic	[63:0] 	mul_x; // biến tạm để tính và để dịch cho dễ [63:32] là acc còn [31:0] là Q số chia hoặc nhân.
	logic [63:0]	rs1_tinh [63:0];
	logic Q = 1'b0 ;
	logic [1:0] dk ;
	assign mul_x[63:31]=32'b0;
		Bu_2 Bu_2_0 (rs2[31:0], mul_x[31:0]); // bù 2 của 
		
	assign rs1_tinh[63:31] = rs1 [31:0] ;

generate
	genvar j;

	for (j=0 ;	j < `XLEN -1 ;	j++)
		begin : o
		assign dk[1]	=	mul_x[0];
		assign dk[0]	=	Q;
		case (dk[1:0])
		
		2'b01 : 	FA_64bits adds(.a(mul_x[63:0]),.b(rs1_tinh [63:0]),.sum_dif(mul_out[63:0]),.carry_in(0),.add_sub(0));//mul_x = mul_x + rs1_tinh ;

		
		2'b10 :	FA_64bits adds(.a(mul_x[63:0]),.b(rs1_tinh [63:0]),.sum_dif(mul_out[63:0]),.carry_in(0),.add_sub(1));//mul_x = mul_x - rs1_tinh ;
		endcase
			assign	Q = mul_x[0];
			assign	mul_x[63:0] = {mul_x[63],mul_x[63:1]};
		end
	endgenerate
		assign mul_out[63:0] = mul_x[63:0];
	
	endmodule : mulbooth32_64
	