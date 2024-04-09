`define N(n)        [(n)-1:0]
`define XLEN                   64




















///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MODULE N bit 
module XLEN_bit_FA_S (
  input  logic `N(`XLEN) in1, 
  input  logic	`N(`XLEN) in2, 
  input  logic ci,add_sub,
  output logic `N(`XLEN) sum, 
  output logic	co, V // V : over
); //FullAdder
	wire `N(`XLEN) Ci ;
	wire `N(`XLEN) Co ;
	assign Ci[0] = ci;
	assign Ci[`XLEN-1:1] = Co[`XLEN-2:0];
FA_S_1b FA_S_1b_block [`XLEN-1:0](
			.in1(in1[`XLEN-1:0]),
			.in2(in2[`XLEN-1:0]),
			.ci(Ci[`XLEN-1:0]),
			.add_sub,
			.sum(sum[`XLEN-1:0]),
			.co(Co [`XLEN-1:0])
);
assign co= Co[`XLEN-1];
assign V=co;
endmodule : XLEN_bit_FA_S
