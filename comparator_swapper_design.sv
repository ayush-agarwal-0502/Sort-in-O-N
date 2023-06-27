// Code your design here

module comparator_swapper_pos(A,B,A1,B1,clk,reset);
  input [7:0] A;
  input [7:0] B;
  input reset;
  input clk;
  output reg [7:0] A1;
  output reg [7:0] B1;
  
  always @(posedge clk) begin
    
    if(reset==1'b1) begin
      A1<=8'd0;
      B1<=8'd0;
    end
    else begin
    {A1,B1} = ((A>B)?({B,A}):({A,B}));
    end
    
  end
endmodule 

module comparator_swapper_neg(A,B,A1,B1,clk,reset);
  input [7:0] A;
  input [7:0] B;
  input reset;
  input clk;
  output reg [7:0] A1;
  output reg [7:0] B1;
  
  always @(negedge clk , posedge reset) begin
    
    if(reset==1'b1) begin
      A1<=8'd0;
      B1<=8'd0;
    end
    else begin
    {A1,B1} = ((A>B)?({B,A}):({A,B}));
    end
    
  end
endmodule 