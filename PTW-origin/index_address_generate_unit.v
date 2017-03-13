module index_address_generate_unit(
	input [37:0] r_pte_ppn,
	input [1:0] count,
	input [26:0] r_req_addr,

	output [49:0] pte_addr
	);

	wire [8:0] vpn_idx;

	assign vpn_idx = count >= 2'h2 ? r_req_addr[8:0] : ((count & 2'h1) >= 2'h1 ? r_req_addr[17:9] : r_req_addr[26:18]);
	assign pte_addr = {r_pte_ppn, vpn_idx, 3'd0};

endmodule 