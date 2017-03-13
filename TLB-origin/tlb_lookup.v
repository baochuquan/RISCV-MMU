module tlb_lookup(
input [6:0] io_ptw_ptbr_asid,
input [26:0] io_req_bits_vpn,
input [33:0] tags_0,
input [33:0] tags_1,
input [33:0] tags_2,
input [33:0] tags_3,
input [33:0] tags_4,
input [33:0] tags_5,
input [33:0] tags_6,
input [33:0] tags_7,
input [7:0] valid,
input [8:0] dirty_hit_check,
input vm_enabled,
input bad_va,

output [33:0] lookup_tag,
output [8:0] hitsVec,
output [8:0] hits,
output tlb_miss
);
wire [8:0] tlb_hits;
wire tlb_hit;

assign lookup_tag = {io_ptw_ptbr_asid,io_req_bits_vpn[26:0]};

assign hitsVec[0] = (valid[0] & vm_enabled) & (tags_0 == lookup_tag);
assign hitsVec[1] = (valid[1] & vm_enabled) & (tags_1 == lookup_tag);
assign hitsVec[2] = (valid[2] & vm_enabled) & (tags_2 == lookup_tag);
assign hitsVec[3] = (valid[3] & vm_enabled) & (tags_3 == lookup_tag);
assign hitsVec[4] = (valid[4] & vm_enabled) & (tags_4 == lookup_tag);
assign hitsVec[5] = (valid[5] & vm_enabled) & (tags_5 == lookup_tag);
assign hitsVec[6] = (valid[6] & vm_enabled) & (tags_6 == lookup_tag);
assign hitsVec[7] = (valid[7] & vm_enabled) & (tags_7 == lookup_tag);
assign hitsVec[8] = vm_enabled == 1'h0;
assign hits = {hitsVec[8], hitsVec[7], hitsVec[6], hitsVec[5], hitsVec[4], hitsVec[3], hitsVec[2], hitsVec[1], hitsVec[0]};

assign tlb_hits = ({1'd0, hits[7:0]}) & dirty_hit_check;//dirty_hit_check is for dirty limits judge
assign tlb_hit = tlb_hits != 9'h0;
assign tlb_miss = (vm_enabled & (bad_va == 1'h0)) & (tlb_hit == 1'h0);

endmodule
