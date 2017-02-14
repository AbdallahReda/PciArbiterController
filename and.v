
module MY_AND (A,B,OUT);
  input A,B;
  output reg OUT;
  always @ ( * ) begin
    OUT=A&B;
  end
endmodule // MY_AND
