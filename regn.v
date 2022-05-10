// Author: Ha How Ung
// Written on: 9 May 2022 (Mon)
// Title: module reg8, parameterised n-bit register, where n = 8 (Book 1 pg. 92)

module regn #(parameter n = 8) (
	input clk, rst, pst, en,
	input [n-1:0] d,
	output reg [n-1:0] q
);

	always @ (negedge rst, posedge pst, negedge clk)
	begin
		if (rst == 0) q <= 0;
		else if (pst == 1) q <= { n{1'b1} }; // n ones
		else if (en == 1) q <= d;
		else q <= q;
	end

endmodule