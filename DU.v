// Author: Ha How Ung
// Written on: 9 May 2022 (Mon)
// Title: Datapath Unit (Book 1 pg. 113)

module DU (
	input [3:0] dataA, dataB,
	input clk, reset, ctrlA, ctrlB, ldA, ldB, Psel, ldP,
	output b0, z,
	output wire [7:0] P
);

	wire [7:0] A, dataP;
	wire [3:0] B;

	shiftLregN u0 (.d({4'h0, dataA}), .SI(1'b0), .rst(reset), .ldsh(ctrlA), .en(ldA), .clk(clk), .SO(), .q(A));
	shiftRregN u1 (.d(dataB), .SI(1'b0), .rst(reset), .ldsh(ctrlB), .en(ldB), .clk(clk), .SO(b0), .q(B));	
	regn u2 (.d( Psel ? (A+P) : (8'h00) ), .rst(reset), .pst(0), .en(ldP), .clk(clk), .q(P));
	
	assign z = ^B;
	
endmodule