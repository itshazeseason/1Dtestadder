/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testctrl_10 (
    input clk,
    input rst,
    input trig,
    input result,
    output reg [1:0] runstatus,
    output reg [2:0] testseq
  );
  
  
  
  reg tick;
  
  localparam MODE_RDY = 2'h0;
  
  localparam MODE_PASS = 2'h1;
  
  localparam MODE_FAIL = 2'h2;
  
  localparam MODE_RUN = 2'h3;
  
  reg [1:0] M_status_d, M_status_q = 2'h0;
  
  reg [2:0] M_vctr_d, M_vctr_q = 1'h0;
  
  reg M_run_d, M_run_q = 1'h0;
  
  wire [1-1:0] M_tickctr_value;
  reg [1-1:0] M_tickctr_rst;
  counter_14 tickctr (
    .clk(clk),
    .rst(M_tickctr_rst),
    .value(M_tickctr_value)
  );
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_3 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  
  
  localparam IDLE_state = 1'd0;
  localparam RUN_state = 1'd1;
  
  reg M_state_d, M_state_q = IDLE_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_run_d = M_run_q;
    M_vctr_d = M_vctr_q;
    M_status_d = M_status_q;
    
    runstatus = M_status_q;
    testseq = M_vctr_q;
    M_edge_detector_in = M_tickctr_value;
    tick = M_edge_detector_out;
    M_run_d = M_run_q;
    M_status_d = M_status_q;
    M_vctr_d = M_vctr_q;
    M_tickctr_rst = ~M_run_q;
    
    case (M_state_q)
      IDLE_state: begin
        if (trig == 1'h1) begin
          M_run_d = 1'h1;
          M_status_d = 2'h3;
          M_vctr_d = 3'h0;
          M_state_d = RUN_state;
        end
      end
      RUN_state: begin
        if (tick == 1'h1) begin
          if (result == 1'h1) begin
            if (M_vctr_q == 3'h7) begin
              M_run_d = 1'h0;
              M_status_d = 2'h1;
              M_vctr_d = 3'h0;
              M_state_d = IDLE_state;
            end else begin
              M_vctr_d = M_vctr_q + 1'h1;
            end
          end else begin
            M_run_d = 1'h0;
            M_status_d = 2'h2;
            M_vctr_d = 3'h0;
            M_state_d = IDLE_state;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_status_q <= 2'h0;
    end else begin
      M_status_q <= M_status_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_vctr_q <= 1'h0;
    end else begin
      M_vctr_q <= M_vctr_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_run_q <= 1'h0;
    end else begin
      M_run_q <= M_run_d;
    end
  end
  
endmodule
