module target_ppn_generate_unit(
	input [1:0] count,
	input [49:0] pte_addr,
	input [27:0] r_req_addr,

	output [37:0] resp_ppn
	);

	assign resp_ppn = count >= 2 ? pte_addr[49:12] : ((count & 2'h1) >= 2'h1 ? {pte_addr[49:21], r_req_addr[8:0]} : {pte_addr[49:30], r_req_addr[17:0]});
endmodule