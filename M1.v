// Author: Ha How Ung
// Written on: 9 May 2022 (Mon)
// Title: module M1 (Book 1 pg. 103)

module M1 (
	output reg [0:6] out, // must have reg, or will give error 10137
	input rst, clk,
	input [1:0] sel,
	input [2:0] in1, in2
);

	reg [3:0] a;
	
	// conbinational part
	always @ (in1, in2)
	begin
		case(sel)
			0: a = {1'b0, in2};
			1: a = in1 + in2;
			2: a = {1'b0, in1};
			default: a = 4'bxxxx;
		endcase
	end
	
	// sequential part
	always @ (posedge rst, posedge clk)
	begin
		if (rst == 1)
			out <= 0;
		else
			out <= out + {3'b000, a};
	end
	
endmodule