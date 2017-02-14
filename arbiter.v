 module arbiter (clk,REQ,GNT,FRAME,IRDY,TRDY);
  input wire clk,FRAME,IRDY,TRDY;
  input wire [7:0] REQ;
  output reg [7:0] GNT;

  reg [2:0] counter;
  reg [3:0] FIFO[7:0];
  reg RDY_GNT;
  reg NEED_GNT;
  reg [5:0] frames;
  reg [4:0] frame_counter;

  initial begin
    frames=0;
    counter=0;
    RDY_GNT=1;
    NEED_GNT=0;
    GNT=8'b11111111;
    FIFO[0]=9;
    FIFO[1]=9;
    FIFO[2]=9;
    FIFO[3]=9;
    FIFO[4]=9;
    FIFO[5]=9;
    FIFO[6]=9;
    FIFO[7]=9;
    frame_counter=0;
  end

  always @ (negedge FRAME) begin
        RDY_GNT=1;
        //$display("Ready");
        frames++;
        frame_counter=0;
        $display("frame neg no = %d",frames);
    end
    always @ ( posedge clk ) begin
      if (FIFO[0] !=9) begin
        // here we know that we have request needs to be granted
          //$display("NEED_GNT = 1");
          NEED_GNT=1;
      end
      if (FRAME&&IRDY) begin
        // here we know that we have request needs to be granted
          //$display("NEED_GNT = 1");
          frame_counter++;
          if (frame_counter==5) begin
              //RDY_GNT=1;
          end

      end
    end
    always @ (GNT) begin
      $display("===> GNT changed %b  %h counter = %d",GNT,GNT,counter);
      //$display("==>f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);

    end
    always @ (negedge clk) begin
      //$display("NEG NEED_GNT = %b RDY_GNT= %b ",NEED_GNT,RDY_GNT);

      if(NEED_GNT && (RDY_GNT))
      begin
       case (FIFO[0])
          0:GNT=8'b11111110;
          1:GNT=8'b11111101;
          2:GNT=8'b11111011;
          3:GNT=8'b11110111;
          4:GNT=8'b11101111;
          5:GNT=8'b11011111;
          6:GNT=8'b10111111;
          7:GNT=8'b01111111;
          default:GNT=8'b11111111;
        endcase
        NEED_GNT=0;
        RDY_GNT=0;
        FIFO[0]=FIFO[1];
        FIFO[1]=FIFO[2];
        FIFO[3]=FIFO[4];
        FIFO[4]=FIFO[5];
        FIFO[5]=FIFO[6];
        FIFO[6]=FIFO[7];
        FIFO[7]=9;
        counter--;
        //$display("==>f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
      end
    end

  always @ (negedge REQ[0]) begin
    FIFO[counter]=0;
    //$display("come %d counter = ",FIFO[counter],counter);
    counter++;
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[1]) begin
    FIFO[counter]=1;
    //$display("come %d counter = ",FIFO[counter],counter);
    counter++;

    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[2]) begin
    FIFO[counter]=2;
    counter++;
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[3]) begin
    FIFO[counter]=3;
    counter++;
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[4]) begin
    FIFO[counter]=4;
    counter++;
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[5]) begin
    FIFO[counter]=5;
    counter++;
    //$display("^_^ 5 ^_^");
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[6]) begin
    FIFO[counter]=6;
    counter++;
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end
  always @ (negedge REQ[7]) begin

    FIFO[counter]=7;
    //FIFO[1]<=7;
    counter++;
    //$display("^_^ 7 ^_^");
    $display("f0 = %d f1 = %d f2 = %d f3 = %d f4 = %d f5 = %d f6= %d f7 = %d counter = %d",FIFO[0],FIFO[1],FIFO[2],FIFO[3],FIFO[4],FIFO[5],FIFO[6],FIFO[7],counter);
  end

endmodule //
