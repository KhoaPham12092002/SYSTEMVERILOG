module Bu_2(
	input 	logic [31:0] a,
	output 	logic [31:0] b
	);
	FA_32bits bu_2 (	.a(32'b0),
							.b(a[31:0]),
							.sum_dif(b[31:0]),
							.carry_in(1'b1),
							.add_sub(1'b1));
endmodule