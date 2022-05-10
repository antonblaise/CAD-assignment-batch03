// Author: Ha How Ung
// Written on: 9 May 2022 (Mon)
// Title: module shiftLregN, N-bit left shift register, where N = 8 (Book 1 pg. 94)

module shiftLregN #(parameter N = 8) (
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
			else q <= { q[N-2:0], SI}; // Shift left 1 bit
		else q <= q;
	end
	
	assign SO = q[N-1]; // store q's MSB as SO

endmodule