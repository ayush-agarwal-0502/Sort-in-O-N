// Code your design here
module hardware_sort_ON(
  input [7:0] numbers_in[4:0],
  input clk,
  input reset,
  output [7:0] numbers_out[4:0]
);
// module hardware_sort_On(numbers_in,clk,reset,numbers_out);
//   input [7:0] numbers_in[4:0];
//   input clk;
//   input reset;
//   output [7:0] numbers_out[4:0];
  
  reg [7:0] numbers_in_store[4:0];
  reg [7:0] numbers_out_store[4:0];
  wire [7:0] feedback[4:0] ;
  
  assign numbers_in_store = reset ? numbers_in : feedback ;
  assign numbers_out = numbers_out_store ;
  
  comparator_swapper_pos csp1(numbers_in_store[0],numbers_in_store[1],numbers_out_store[0],numbers_out_store[1],clk,reset);
    comparator_swapper_pos csp2(numbers_in_store[2],numbers_in_store[3],numbers_out_store[2],numbers_out_store[3],clk,reset);
  comparator_swapper_neg csn1(numbers_out_store[1],numbers_out_store[2],feedback[1],feedback[2],clk,reset);
  comparator_swapper_neg csn2(numbers_out_store[3],numbers_out_store[4],feedback[3],feedback[4],clk,reset);
  dff_pos d1(numbers_in_store[4],clk,reset,numbers_out_store[4]);
  dff_neg d2(numbers_out_store[0],clk,reset,feedback[0]);
  
 
//   initial begin
//     if(reset==1'b1) begin 
//       numbers_in_store = numbers_in ;
//       numbers_out_store = 32'b0 ;
//     end    
//   end
//   always @(posedge reset) begin
//     if(reset==1'b1) begin 
//       numbers_in_store = numbers_in ;
//       numbers_out_store = 32'b0 ;
//     end
//   end
  
  
endmodule 

////////////////////////////////////////////////////////////
    
module comparator_swapper_pos(A,B,A1,B1,clk,reset);
  input [7:0] A;
  input [7:0] B;
  input reset;
  input clk;
  output reg [7:0] A1;
  output reg [7:0] B1;
  
  always @(posedge clk) begin
    
    {A1,B1} = ((A>B)?({B,A}):({A,B}));
//     if(reset==1'b1) begin
//       //A1<=8'd0;
//       //B1<=8'd0;
//     end
//     else begin
//     //{A1,B1} = ((A>B)?({B,A}):({A,B}));
//     end
    
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
    
    {A1,B1} = ((A>B)?({B,A}):({A,B}));
    
//     if(reset==1'b1) begin
//       A1<=8'd0;
//       B1<=8'd0;
//     end
//     else begin
//     {A1,B1} = ((A>B)?({B,A}):({A,B}));
//     end
    
  end
endmodule 

module dff_pos(d,clk,reset,q);
  output reg [7:0] q;
  input [7:0] d;
  input clk,reset;
  
  always@(posedge clk, posedge reset)
    q=d;
//     begin
//       if(reset) begin
//           q=8'b0;
//         end
//       else begin
//           q=d;
//         end
//     end
endmodule
    
module dff_neg(d,clk,reset,q);
  output reg [7:0] q;
  input [7:0] d;
  input clk,reset;
  
  always@(negedge clk, posedge reset)
    q=d;
//     begin
//       if(reset) begin
//           q=8'b0;
//         end
//       else begin
//           q=d;
//         end
//     end
endmodule