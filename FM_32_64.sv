module FM_32_64(
	input [31:0]a,b,
	output[63:0]out,
	output  		flag
	);
	wire [63:0] A,B,A_,B_;
	wire [63:0] A_start [63:0];
 	wire [63:0] zero,one;
	wire [63:0] ans [62:0];
	wire go;
	assign go = a[31]&b[31];
	assign A_[63:0]={{32{a[31]}},a[31:0]};
	assign B_[63:0]={{32{b[31]}},b[31:0]};
		FA_64bits converta(.a({64'b0}),.b(A_),.sum_dif(A),.carry_in(go),.add_sub(go));
		FA_64bits convertb(.a({64'b0}),.b(B_),.sum_dif(B),.carry_in(go),.add_sub(go));
	assign zero[63:0] = 64'b0;
	generate
	genvar i,j;
	
	for(i=0;i<64;i++)
		begin : oi
		
		for(j=0;j<64;j++)
				begin : start_plus
					assign A_start[i][j]=A[j]&B[i];
			end
		end
	
	FA_64bits add(.a({A_start[0][63:0]}),.b({A_start[1][62:0],zero[0]}),.sum_dif(ans[0][63:0]),.carry_in(0),.add_sub(0));
	
	for(i=2;i<64;i++)
		begin : o
						
						FA_64bits adds(.a({ans[i-2][63:0]}),.b({A_start[i][63-i:0],zero[i-1:0]}),.sum_dif(ans[i-1][63:0]),.carry_in(0),.add_sub(0));
		end
		assign out = ans[62][63:0];
	endgenerate

endmodule 