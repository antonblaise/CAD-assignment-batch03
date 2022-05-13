// Author: Ha How Ung
// Written on: 10 May 2022 (Tue)
// Title: testbench - module M1 (Book 1 pg. 103)

module M1_testbench ();

  wire [0:6] out; // must have reg, or will give error 10137
  reg rst, clk;
  reg [1:0] sel;
  reg [2:0] in1, in2;
  
  M1 DUT(.out(out), .rst(rst), .clk(clk), .sel(sel), .in1(in1), .in2(in2));
  
  initial 
    begin
      $monitor ($time, " rst=%b, sel=%d, in1=%d, in2=%d, out=%d", rst,sel,in1,in2,out);
    end
  
  integer i;
  
  initial
    begin
      $dumpfile("M1.vcd");
      $dumpvars(1, M1_testbench);

      #0 rst=1; clk=0; in1=0; in2=7; sel=0;

      for (i = 1; i <= 14; i = i + 1)
        begin
          #25 clk <= ~clk;
          #25 rst <= (i%5==0) ? 1:0; clk <= ~clk; in1 <= in1 + 1; in2 <= in2 -1 ; sel <= sel + 1;
        end
    end
endmodule