module tlb_attri_change(
input [2:0] r_refill_waddr,
input io_ptw_invalidate,
input io_ptw_resp_valid,
input io_ptw_resp_bits_pte_v,
input io_ptw_resp_bits_pte_u,
input io_ptw_resp_bits_pte_w,
input io_ptw_resp_bits_pte_x,
input io_ptw_resp_bits_pte_r,
input io_ptw_resp_bits_pte_d,
input [7:0] valid,
input [7:0] u_array,
input [7:0] sw_array,
input [7:0] sr_array,
input [7:0] sx_array,
input [7:0] xr_array,
input [7:0] cash_array,
input [7:0] dirty_array,
input prot_w,
input prot_x,
input prot_r,
input cacheable_buf,//cacheable

output [7:0] new_valid,
output [7:0] new_u_array,
output [7:0] new_sw_array,
output [7:0] new_sx_array,
output [7:0] new_sr_array,
output [7:0] new_xr_array,
output [7:0] new_cash_array,
output [7:0] new_dirty_array
);

wire  T_373;
wire  T_395;

wire [7:0] T_363;
wire [7:0] T_364;
wire [7:0] T_366;
wire T_374;
wire [7:0] T_375;
wire [7:0] T_377;
wire T_385;
wire [7:0] T_386;
wire [7:0] T_388;
wire T_396;
wire [7:0] T_397;
wire [7:0] T_399;
wire T_407;
wire [7:0] T_408;
wire [7:0] T_410;
wire [7:0] T_412;
wire [7:0] T_414;
wire [7:0] T_416;
wire [7:0] T_418;



assign T_363 = valid | (8'h1 << r_refill_waddr);
assign T_364 = u_array |(8'h1 << r_refill_waddr);
assign T_366 = u_array & (~ (8'h1 << r_refill_waddr));


assign T_373 = (io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & (io_ptw_resp_bits_pte_w == 1'h0)))) & io_ptw_resp_bits_pte_w;//pte.sw()
assign T_374 = T_373 & prot_w;

assign T_375 = sw_array | (8'h1 << r_refill_waddr);
assign T_377 = sw_array & (~(8'h1 << r_refill_waddr));

assign T_385 = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & (io_ptw_resp_bits_pte_w == 1'h0)))) & io_ptw_resp_bits_pte_x) & prot_x;
assign T_386 = sx_array | (8'h1 << r_refill_waddr);
assign T_388 = sx_array & (~(8'h1 << r_refill_waddr));

assign T_395 = (io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & (io_ptw_resp_bits_pte_w == 1'h0)))) & io_ptw_resp_bits_pte_r;
assign T_396 = T_395 & prot_r;
assign T_397 = sr_array | (8'h1 << r_refill_waddr);
assign T_399 = sr_array & (~(8'h1 << r_refill_waddr));

assign T_407 = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & (io_ptw_resp_bits_pte_w == 1'h0)))) & io_ptw_resp_bits_pte_x) & prot_r;
assign T_408 = xr_array | (8'h1 << r_refill_waddr);
assign T_410 = xr_array & (~(8'h1 << r_refill_waddr));

assign T_412 = cash_array | (8'h1 << r_refill_waddr);
assign T_414 = cash_array & (~(8'h1 << r_refill_waddr));

assign T_416 = dirty_array | (8'h1 << r_refill_waddr);
assign T_418 = dirty_array & (~(8'h1 << r_refill_waddr));

assign new_valid = io_ptw_invalidate ? 8'h0 : (io_ptw_resp_valid ? T_363 : valid);
assign new_u_array = io_ptw_resp_valid ? (io_ptw_resp_bits_pte_u ? T_364 : T_366) : u_array;
assign new_sw_array = io_ptw_resp_valid ? (T_374 ? T_375 : T_377) : sw_array;
assign new_sx_array = io_ptw_resp_valid ? (T_385 ? T_386 : T_388) : sx_array;
assign new_sr_array = io_ptw_resp_valid ? (T_396 ? T_397 : T_399) : sr_array;
assign new_xr_array = io_ptw_resp_valid ? (T_407 ? T_408 : T_410) : xr_array;
assign new_cash_array = io_ptw_resp_valid ? (cacheable_buf ? T_412 : T_414) : cash_array;
assign new_dirty_array = io_ptw_resp_valid ? (io_ptw_resp_bits_pte_d ? T_416 : T_418) : dirty_array;


endmodule