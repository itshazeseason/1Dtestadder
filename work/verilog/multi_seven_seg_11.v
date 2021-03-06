/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 4
     DIV = 16
*/
module multi_seven_seg_11 (
    input clk,
    input rst,
    input [27:0] digits,
    output reg [6:0] seg,
    output reg [3:0] sel
  );
  
  localparam DIGITS = 3'h4;
  localparam DIV = 5'h10;
  
  
  localparam DIGIT_BITS = 2'h2;
  
  wire [2-1:0] M_ctr_value;
  counter_15 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  wire [4-1:0] M_digit_dec_out;
  reg [2-1:0] M_digit_dec_in;
  decoder_16 digit_dec (
    .in(M_digit_dec_in),
    .out(M_digit_dec_out)
  );
  
  always @* begin
    seg = digits[(M_ctr_value)*7+6-:7];
    M_digit_dec_in = M_ctr_value;
    sel = M_digit_dec_out;
  end
endmodule
