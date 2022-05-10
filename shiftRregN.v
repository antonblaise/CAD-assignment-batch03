// Author: Ha How Ung
// Written on: 9 May 2022 (Mon)
// Title: module shiftRregN, N-bit right shift register, where N = 4 (Book 1 pg. 94)

module shiftRregN #(parameter N = 4) (
	input [N-1:0] d,
	input clk, rst, en, ldsh, SI, // SI = Shift In
	output SO,							// SO = Shift Out
	output reg [N-1:0] q
);

	always @ (negedge rst, posedge clk)
	begin
		if (rst == 0)
			q <= 0;
		else if (en)
			if (ldsh) q <= d;
			else q <= { SI, q[N-1:1]}; // Shift right 1 bit
		else q <= q;
	end
	
	assign SO = q[0]; // store q's LSB as SO

endmodule