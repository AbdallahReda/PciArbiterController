module MY_MUX (A,B,SEL,OUT);
  input A,B,SEL;
  output OUT;
  MY_AND g1(A,SEL,x1);
  MY_AND g2(B,NOT_SEL,x2);
  MY_NOT g3(SEL,NOT_SEL);
  MY_OR g4(x1,x2,OUT);
endmodule // MY_MUX
module TB;
   initial begin
     $dumpfile("testing.dump");
     $dumpvars;
   end
  reg A,B,SEL;
  wire OUT;
  MY_MUX a(A,B,SEL,OUT);
  initial begin
  $monitor ("When A= ",A," And B= ",B," And SEL= ",SEL," The output is ",OUT);
    A=0;B=1;SEL=0;
    #5;
    A=1;B=0;SEL=1;
    #5;
  end
endmodule //TB
