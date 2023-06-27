// Code your testbench here
// or browse Examples

module hardware_sort_test;
  reg [7:0] numbers_in[4:0];
  reg clk;
  reg reset;
  wire [7:0] numbers_out[4:0];
  integer i;
  //wire [7:0] numbers_out_0;
  hardware_sort_ON hson(numbers_in,clk,reset,numbers_out);
  
  initial begin 
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    //numbers_in = {8'd5,8'd2,8'd4,8'd3,8'd1};
    numbers_in[0] <= 8'd5;
    numbers_in[1] <= 8'd2;
    numbers_in[2] <= 8'd4;
    numbers_in[3] <= 8'd3;
    numbers_in[4] <= 8'd1;
    reset=1'b1;
    clk=1'b0;
    #1;
    clk=1'b1;
    #1;
    
    #1;
    reset=1'b0;
    //numbers_out_0 <= numbers_out[0];
  end
  
  always begin
    #3;
    clk = ~clk;
    for(int i=0; i<5; i++) begin
      //$display(numbers_in[i]);
      $display(numbers_out[i]);
    end
    $display("step");
  end
  initial begin 
    #21;
    $finish;
  end
endmodule