// Code your testbench here
// or browse Examples
module test ;
  reg [7:0] A;
  reg [7:0] B;
  reg clk;
  reg reset;
  wire [7:0] A1;
  wire [7:0] B1;
  
  comparator_swapper_neg cswap1(A,B,A1,B1,clk,reset);
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    A<=8'd9;
    B<=8'd12;
    clk<=1'b0;
    reset<=1'b1;
    #1;
    reset<=1'b0;
    #1;
    clk<=1'b1;
    #1;
    clk<=1'b0;
    #1;
    clk<=1'b1;
    #1;
    A<=8'd15;
    clk<=1'b0;
    #1;
    clk<=1'b1;
    #1;
    
  end
endmodule