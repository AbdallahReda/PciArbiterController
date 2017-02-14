module MY_NOT (IN,OUT);
  input IN;
  output reg OUT;
  always @ ( * ) begin
    OUT=~IN;
  end
endmodule // MY_NOT
