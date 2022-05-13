// Author: Ha How Ung
// Written on: 10 May 2022 (Tue)
// Title: testbench - module reg8, parameterised n-bit register, where n = 8 (Book 1 pg. 92)

module regn_testbench #(parameter n = 8) ();
  
  reg clk, rst, pst, en;
  reg [n-1:0] d;
  wire [n-1:0] q;
  
  regn #(.n(8)) DUT (.clk(clk), .rst(rst), .pst(pst), .en(en), .d(d), .q(q));
  
  initial
    begin
      $monitor($time, " rst=%b, pst=%b, en=%b, d=%d, q=%d", rst, pst, en, d, q);
    end
  
  integer i;
  
  initial
    begin
      $dumpfile("regn.vcd");
      $dumpvars(1, regn_testbench);
      
      #0 clk=1; rst=1; pst=0; en=1; d=10;
      
      for (i = 0; i < 20; i = i+1)
        begin
          #25 clk <= ~clk;
          #25 clk <= ~clk; rst <= (i%8==3)?0:1; pst <= (i%8==5)?1:0; en <= (i%8==7)?0:1; d <= d+1;
        end
    end
  
endmodule