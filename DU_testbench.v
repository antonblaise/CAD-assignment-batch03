// Author: Ha How Ung
// Written on: 10 May 2022 (Tue)
// Title: testbench - Datapath Unit (Book 1 pg. 113)

module DU_testbench ();
  
  reg [3:0] dataA, dataB;
  reg clk, reset, ctrlA, ctrlB, ldA, ldB, Psel, ldP;
  wire b0, z;
  wire [7:0] P;
  
  DU DUT (.dataA(dataA), .dataB(dataB), .clk(clk), .reset(reset), 
          .ctrlA(ctrlA), .ctrlB(ctrlB), .ldA(ldA), .ldB(ldB), .Psel(Psel), .ldP(ldP),
          .b0(b0), .z(z), .P(P));
  
  initial
    begin
      $monitor ($time, " reset=%b, dataA=%d, dataB=%d, ctrlA=%b, ctrlB=%b, ldA=%b, ldB=%b, Psel=%b, ldP=%b, b0=%b, z=%b, P=%d", reset, dataA, dataB, ctrlA, ctrlB, ldA, ldB, Psel, ldP, b0, z, P);
    end
  
  integer i, stepSize = 1;
  
  initial
    begin
      $dumpfile("DU.vcd");
      $dumpvars(1, DU_testbench);
      
      #0 clk=0; dataA=0; dataB=8'hf; reset=1; ctrlA=0; ctrlB=0; ldA=0; ldB=0; Psel=0; ldP=0;
      
      for (i = 0; i < 64; i = i+stepSize)
        begin
          #25 clk <= ~clk; 
          #25 clk <= ~clk; dataA <= dataA + stepSize; dataB <= dataB - stepSize; reset = (i%6==5)?0:1; {ctrlA,ctrlB,ldA,ldB,Psel,ldP} <= i;
        end
      
    end
  
endmodule