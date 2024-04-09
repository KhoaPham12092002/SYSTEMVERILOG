module FA_S_1b (
  input  logic in1, in2, ci,add_sub,
  output logic sum, co
); //FullAdder
	logic in2_calc;
	assign in2_calc = in2^add_sub;
	assign sum = (in1 ^ in2_calc) ^ ci ;
	assign co = (in1 & in2_calc) | ((in1 ^ in2_calc) & ci);
endmodule : FA_S_1b