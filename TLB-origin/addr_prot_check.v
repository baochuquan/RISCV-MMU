module addr_prot_check(
input io_ptw_resp_valid,
input [19:0] io_req_bits_vpn,
input [19:0] io_ptw_resp_bits_pte_ppn,

output [19:0] passthrough_ppn,
output prot_r,
output prot_w,
output prot_x,
output cacheable_buf//cacheable
);

wire [31:0] T_226;
wire [2:0] T_234;
wire  T_239;
wire [2:0] T_242;
wire  T_247;
wire [2:0] T_250;
wire  T_255;
wire [2:0] T_258;
wire [2:0] T_266;
wire [2:0] T_274;
wire [19:0] mpu_ppn;
wire [19:0] refill_ppn;

assign passthrough_ppn = io_req_bits_vpn[19:0];
assign refill_ppn = io_ptw_resp_bits_pte_ppn[19:0];
assign mpu_ppn = io_ptw_resp_valid ? refill_ppn : passthrough_ppn;

assign T_226 = ({{12'd0}, mpu_ppn}) << 12;

assign T_234 = (T_226 < 32'h1000) ? 3'h7 : 3'h0;

assign T_239 = (32'h1000 <= T_226) & (T_226 < 32'h2000);
assign T_242 = T_239 ? 3'h5 : 3'h0;
  
assign T_247 = (32'h2000000 <= T_226) & (T_226 < 32'h2010000);
assign T_250 = T_247 ? 3'h3 : 3'h0;

assign T_255 = (32'hc000000 <= T_226) & (T_226 < 32'h10000000);
assign T_258 = T_255 ? 3'h3 : 3'h0;

assign cacheable_buf = (32'h80000000 <= T_226) & (T_226 < 32'h90000000);
assign T_266 = cacheable_buf ? 3'h7 : 3'h0;

assign T_274 = T_234 | T_242 | T_250 | T_258 | T_266;
assign prot_x = T_274[2];
assign prot_w = T_274[1];
assign prot_r = T_274[0];

endmodule