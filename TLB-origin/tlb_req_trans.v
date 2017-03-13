module tlb_req_trans(
input [1:0] state,
input io_ptw_resp_valid,
input tlb_miss,
input [33:0] r_refill_tag,
input r_req_instruction,
input r_req_store,
input io_ptw_status_pum,
input io_ptw_status_mxr,
input [1:0] io_ptw_status_prv,

output io_req_ready,
output io_ptw_req_valid,
output io_resp_miss,
output [26:0] io_ptw_req_bits_addr,
output io_ptw_req_bits_fetch,
output io_ptw_req_bits_store,
output io_ptw_req_bits_pum,
output io_ptw_req_bits_mxr,
output [1:0] io_ptw_req_bits_prv
);

assign  io_req_ready = state == 2'h0;
assign io_ptw_req_valid = state == 2'h1;
assign  io_resp_miss = io_ptw_resp_valid | tlb_miss;
assign io_ptw_req_bits_addr = r_refill_tag[26:0];
assign io_ptw_req_bits_fetch = r_req_instruction;
assign io_ptw_req_bits_store = r_req_store;
assign io_ptw_req_bits_prv = io_ptw_status_prv;
assign io_ptw_req_bits_pum = io_ptw_status_pum;
assign io_ptw_req_bits_mxr = io_ptw_status_mxr;

endmodule
