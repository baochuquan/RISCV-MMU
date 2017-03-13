module except_detec(
input io_req_bits_store,
input io_ptw_status_pum,
input [7:0] u_array,
input [7:0] sw_array,
input [7:0] sx_array,
input [7:0] sr_array,
input [7:0] xr_array,
input [7:0] dirty_array,
input io_ptw_status_mxr,
input priv_s,
input prot_w,
input prot_r,
input prot_x,
input [8:0] hits,
input bad_va,

output io_resp_xcpt_st,
output io_resp_xcpt_if, 
output io_resp_xcpt_ld,
output [8:0] dirty_hit_check
);

wire [7:0] T_464;
wire [7:0] T_469;
wire [8:0] T_476;
wire  T_539;
wire  T_540;
wire  T_544;
wire  T_545;
wire  T_549;
wire  T_550;
wire [8:0] r_array;
wire [8:0] w_array;
wire [8:0] x_array;
wire [7:0] priv_ok;



assign T_464 = ~(io_ptw_status_pum ? u_array : 8'h0);
assign priv_ok = priv_s ? T_464 : u_array;

assign w_array = {prot_w, (priv_ok & sw_array)};
assign x_array = {prot_x, (priv_ok & sx_array)};
assign T_469 = sr_array | (io_ptw_status_mxr ? xr_array : 8'h0);
assign r_array = {prot_r, (priv_ok & T_469)};

assign T_476 = ~(io_req_bits_store ? w_array : 9'h0);
assign dirty_hit_check = ({{1'd0}, dirty_array}) | T_476;


assign T_539 = ((~r_array) & hits) != 9'h0;
assign T_540 = bad_va | T_539;
assign T_544 = ((~w_array) & hits) != 9'h0;
assign T_545 = bad_va | T_544;
assign T_549 = ((~x_array) & hits) != 9'h0;
assign T_550 = bad_va | T_549; 

assign io_resp_xcpt_ld = T_540;
assign io_resp_xcpt_st = T_545;
assign io_resp_xcpt_if = T_550;

endmodule