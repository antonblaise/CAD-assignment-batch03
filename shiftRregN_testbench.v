// Author: Ha How Ung
// Written on: 10 May 2022 (Tue)
// Title: testbench - module shiftRregN, N-bit right shift register, where N = 4 (Book 1 pg. 94)

module shiftRregN_testbench #(parameter N = 4) ();
  reg [N-1:0] d;
  reg clk, rst, en, ldsh, SI; 	// SI = Shift In
  wire SO;						// SO = Shift Out
  wire [N-1:0] q;
  
  shiftRregN #(.N(4)) DUT (.d(d), .clk(clk), .rst(rst), .en(en), 
                                     .ldsh(ldsh), .SI(SI), .SO(SO), .q(q));
  
  initial
    begin
      $monitor ($time, "rst=%b, en=%b, ldsh=%b, SI=%b, d=%b, SO=%b, q=%b", 
                rst, en, ldsh, SI, d, SO, q);
    end
  
  integer i;
  
  initial
    begin
      $dumpfile("shiftRregN.vcd");
      $dumpvars(1, shiftRregN_testbench);
      
      #0 clk = 0; rst = 1; en = 1; ldsh = 0; SI = 0; d = 0;
      
      for (i = 0; i < 30; i = i + 1)
        begin
          #25 clk <= ~clk;
          #25 clk <= ~clk; rst <= (i%9==4)?0:1; en <= (i%9==7)?0:1; ldsh <= (i%6==5)?1:0; SI <= (i<15)?0:1; d <= d+1;
        end
      
    end
  
endmodule