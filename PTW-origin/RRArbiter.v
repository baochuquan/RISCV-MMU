module RRArbiter(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [1:0] io_in_0_bits_prv,
  input   io_in_0_bits_pum,
  input   io_in_0_bits_mxr,
  input  [26:0] io_in_0_bits_addr,
  input   io_in_0_bits_store,
  input   io_in_0_bits_fetch,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [1:0] io_in_1_bits_prv,
  input   io_in_1_bits_pum,
  input   io_in_1_bits_mxr,
  input  [26:0] io_in_1_bits_addr,
  input   io_in_1_bits_store,
  input   io_in_1_bits_fetch,
  input   io_out_ready,
  output  io_out_valid,
  output [1:0] io_out_bits_prv,
  output  io_out_bits_pum,
  output  io_out_bits_mxr,
  output [26:0] io_out_bits_addr,
  output  io_out_bits_store,
  output  io_out_bits_fetch,
  output  io_chosen
);
  wire  choice;
  wire  GEN_0_ready;
  wire  GEN_0_valid;
  wire [1:0] GEN_0_bits_prv;
  wire  GEN_0_bits_pum;
  wire  GEN_0_bits_mxr;
  wire [26:0] GEN_0_bits_addr;
  wire  GEN_0_bits_store;
  wire  GEN_0_bits_fetch;
  wire  GEN_7;
  wire  GEN_8;
  wire [1:0] GEN_9;
  wire  GEN_10;
  wire  GEN_11;
  wire [26:0] GEN_12;
  wire  GEN_13;
  wire  GEN_14;
  wire  GEN_1_ready;
  wire  GEN_1_valid;
  wire [1:0] GEN_1_bits_prv;
  wire  GEN_1_bits_pum;
  wire  GEN_1_bits_mxr;
  wire [26:0] GEN_1_bits_addr;
  wire  GEN_1_bits_store;
  wire  GEN_1_bits_fetch;
  wire  GEN_2_ready;
  wire  GEN_2_valid;
  wire [1:0] GEN_2_bits_prv;
  wire  GEN_2_bits_pum;
  wire  GEN_2_bits_mxr;
  wire [26:0] GEN_2_bits_addr;
  wire  GEN_2_bits_store;
  wire  GEN_2_bits_fetch;
  wire  GEN_3_ready;
  wire  GEN_3_valid;
  wire [1:0] GEN_3_bits_prv;
  wire  GEN_3_bits_pum;
  wire  GEN_3_bits_mxr;
  wire [26:0] GEN_3_bits_addr;
  wire  GEN_3_bits_store;
  wire  GEN_3_bits_fetch;
  wire  GEN_4_ready;
  wire  GEN_4_valid;
  wire [1:0] GEN_4_bits_prv;
  wire  GEN_4_bits_pum;
  wire  GEN_4_bits_mxr;
  wire [26:0] GEN_4_bits_addr;
  wire  GEN_4_bits_store;
  wire  GEN_4_bits_fetch;
  wire  GEN_5_ready;
  wire  GEN_5_valid;
  wire [1:0] GEN_5_bits_prv;
  wire  GEN_5_bits_pum;
  wire  GEN_5_bits_mxr;
  wire [26:0] GEN_5_bits_addr;
  wire  GEN_5_bits_store;
  wire  GEN_5_bits_fetch;
  wire  GEN_6_ready;
  wire  GEN_6_valid;
  wire [1:0] GEN_6_bits_prv;
  wire  GEN_6_bits_pum;
  wire  GEN_6_bits_mxr;
  wire [26:0] GEN_6_bits_addr;
  wire  GEN_6_bits_store;
  wire  GEN_6_bits_fetch;
  wire  T_220;
  reg  lastGrant;
  reg [31:0] GEN_0;
  wire  GEN_15;
  wire  grantMask_1;
  wire  validMask_1;
  wire  T_224;
  wire  T_228;
  wire  T_230;
  wire  T_234;
  wire  T_235;
  wire  T_236;
  wire  GEN_16;
  wire  GEN_17;
  assign io_in_0_ready = T_235;
  assign io_in_1_ready = T_236;
  assign io_out_valid = GEN_0_valid;
  assign io_out_bits_prv = GEN_1_bits_prv;
  assign io_out_bits_pum = GEN_2_bits_pum;
  assign io_out_bits_mxr = GEN_3_bits_mxr;
  assign io_out_bits_addr = GEN_4_bits_addr;
  assign io_out_bits_store = GEN_5_bits_store;
  assign io_out_bits_fetch = GEN_6_bits_fetch;
  assign io_chosen = choice;
  assign choice = GEN_17;
  assign GEN_0_ready = GEN_7;
  assign GEN_0_valid = GEN_8;
  assign GEN_0_bits_prv = GEN_9;
  assign GEN_0_bits_pum = GEN_10;
  assign GEN_0_bits_mxr = GEN_11;
  assign GEN_0_bits_addr = GEN_12;
  assign GEN_0_bits_store = GEN_13;
  assign GEN_0_bits_fetch = GEN_14;
  assign GEN_7 = io_chosen ? io_in_1_ready : io_in_0_ready;
  assign GEN_8 = io_chosen ? io_in_1_valid : io_in_0_valid;
  assign GEN_9 = io_chosen ? io_in_1_bits_prv : io_in_0_bits_prv;
  assign GEN_10 = io_chosen ? io_in_1_bits_pum : io_in_0_bits_pum;
  assign GEN_11 = io_chosen ? io_in_1_bits_mxr : io_in_0_bits_mxr;
  assign GEN_12 = io_chosen ? io_in_1_bits_addr : io_in_0_bits_addr;
  assign GEN_13 = io_chosen ? io_in_1_bits_store : io_in_0_bits_store;
  assign GEN_14 = io_chosen ? io_in_1_bits_fetch : io_in_0_bits_fetch;
  assign GEN_1_ready = GEN_7;
  assign GEN_1_valid = GEN_8;
  assign GEN_1_bits_prv = GEN_9;
  assign GEN_1_bits_pum = GEN_10;
  assign GEN_1_bits_mxr = GEN_11;
  assign GEN_1_bits_addr = GEN_12;
  assign GEN_1_bits_store = GEN_13;
  assign GEN_1_bits_fetch = GEN_14;
  assign GEN_2_ready = GEN_7;
  assign GEN_2_valid = GEN_8;
  assign GEN_2_bits_prv = GEN_9;
  assign GEN_2_bits_pum = GEN_10;
  assign GEN_2_bits_mxr = GEN_11;
  assign GEN_2_bits_addr = GEN_12;
  assign GEN_2_bits_store = GEN_13;
  assign GEN_2_bits_fetch = GEN_14;
  assign GEN_3_ready = GEN_7;
  assign GEN_3_valid = GEN_8;
  assign GEN_3_bits_prv = GEN_9;
  assign GEN_3_bits_pum = GEN_10;
  assign GEN_3_bits_mxr = GEN_11;
  assign GEN_3_bits_addr = GEN_12;
  assign GEN_3_bits_store = GEN_13;
  assign GEN_3_bits_fetch = GEN_14;
  assign GEN_4_ready = GEN_7;
  assign GEN_4_valid = GEN_8;
  assign GEN_4_bits_prv = GEN_9;
  assign GEN_4_bits_pum = GEN_10;
  assign GEN_4_bits_mxr = GEN_11;
  assign GEN_4_bits_addr = GEN_12;
  assign GEN_4_bits_store = GEN_13;
  assign GEN_4_bits_fetch = GEN_14;
  assign GEN_5_ready = GEN_7;
  assign GEN_5_valid = GEN_8;
  assign GEN_5_bits_prv = GEN_9;
  assign GEN_5_bits_pum = GEN_10;
  assign GEN_5_bits_mxr = GEN_11;
  assign GEN_5_bits_addr = GEN_12;
  assign GEN_5_bits_store = GEN_13;
  assign GEN_5_bits_fetch = GEN_14;
  assign GEN_6_ready = GEN_7;
  assign GEN_6_valid = GEN_8;
  assign GEN_6_bits_prv = GEN_9;
  assign GEN_6_bits_pum = GEN_10;
  assign GEN_6_bits_mxr = GEN_11;
  assign GEN_6_bits_addr = GEN_12;
  assign GEN_6_bits_store = GEN_13;
  assign GEN_6_bits_fetch = GEN_14;
  assign T_220 = io_out_ready & io_out_valid;
  assign GEN_15 = T_220 ? io_chosen : lastGrant;
  assign grantMask_1 = 1'h1 > lastGrant;
  assign validMask_1 = io_in_1_valid & grantMask_1;
  assign T_224 = validMask_1 | io_in_0_valid;
  assign T_228 = validMask_1 == 1'h0;
  assign T_230 = T_224 == 1'h0;
  assign T_234 = grantMask_1 | T_230;
  assign T_235 = T_228 & io_out_ready;
  assign T_236 = T_234 & io_out_ready;
  assign GEN_16 = io_in_0_valid ? 1'h0 : 1'h1;
  assign GEN_17 = validMask_1 ? 1'h1 : GEN_16;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_0 = {1{$random}};
  lastGrant = GEN_0[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(1'h0) begin
    end else begin
      if(T_220) begin
        lastGrant <= io_chosen;
      end
    end
  end
endmodule
