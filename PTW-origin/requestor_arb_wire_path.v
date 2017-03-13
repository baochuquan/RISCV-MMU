module requestor_arb_wire_path(
	input clock,
	input reset,
	input r_req_dest,
	input [2:0] state,
	input [15:0] r_pte_reserved_for_hardware,
	input [37:0] resp_ppn,
	input [1:0] r_pte_reserved_for_software,
	input r_pte_d,
	input r_pte_a,
	input r_pte_g,
	input r_pte_u,
	input r_pte_x,
	input r_pte_w,
	input r_pte_r,
	input r_pte_v,
	input arb_io_in_0_ready,
	input io_requestor_0_req_valid,
	input [1:0] io_requestor_0_req_bits_prv,
	input io_requestor_0_req_bits_pum,
	input io_requestor_0_req_bits_mxr,
	input [26:0] io_requestor_0_req_bits_addr,
	input io_requestor_0_req_bits_store,
	input io_requestor_0_req_bits_fetch,
	input arb_io_in_1_ready,
	input io_requestor_1_req_valid,
	input [1:0] io_requestor_1_req_bits_prv,
	input io_requestor_1_req_bits_pum,
	input io_requestor_1_req_bits_mxr,
	input [26:0] io_requestor_1_req_bits_addr,
	input io_requestor_1_req_bits_store,
	input io_requestor_1_req_bits_fetch,

	output arb_clock,
	output arb_reset,
	output io_requestor_0_resp_valid,
	output [15:0] io_requestor_0_resp_bits_pte_reserved_for_hardware,
	output [37:0] io_requestor_0_resp_bits_pte_ppn,
	output [1:0] io_requestor_0_resp_bits_pte_reserved_for_software,
	output io_requestor_0_resp_bits_pte_d,
	output io_requestor_0_resp_bits_pte_a,
	output io_requestor_0_resp_bits_pte_g,
	output io_requestor_0_resp_bits_pte_u,
	output io_requestor_0_resp_bits_pte_x,
	output io_requestor_0_resp_bits_pte_w,
	output io_requestor_0_resp_bits_pte_r,
	output io_requestor_0_resp_bits_pte_v,
	output io_requestor_1_resp_valid,
	output [15:0] io_requestor_1_resp_bits_pte_reserved_for_hardware,
	output [37:0] io_requestor_1_resp_bits_pte_ppn,
	output [1:0] io_requestor_1_resp_bits_pte_reserved_for_software,
	output io_requestor_1_resp_bits_pte_d,
	output io_requestor_1_resp_bits_pte_a,
	output io_requestor_1_resp_bits_pte_g,
	output io_requestor_1_resp_bits_pte_u,
	output io_requestor_1_resp_bits_pte_x,
	output io_requestor_1_resp_bits_pte_w,
	output io_requestor_1_resp_bits_pte_r,
	output io_requestor_1_resp_bits_pte_v,
	output io_requestor_0_req_ready,
	output arb_io_in_0_valid,
	output [1:0] arb_io_in_0_bits_prv,
	output arb_io_in_0_bits_pum,
	output arb_io_in_0_bits_mxr,
	output [26:0] arb_io_in_0_bits_addr,
	output arb_io_in_0_bits_store,
	output arb_io_in_0_bits_fetch,
	output io_requestor_1_req_ready,
	output arb_io_in_1_valid,
	output [1:0] arb_io_in_1_bits_prv,
	output arb_io_in_1_bits_pum,
	output arb_io_in_1_bits_mxr,
	output [26:0] arb_io_in_1_bits_addr,
	output arb_io_in_1_bits_store,
	output arb_io_in_1_bits_fetch
	);

	assign arb_clock = clock;
	assign arb_reset = reset;

	assign io_requestor_0_resp_valid 							= (state == 3'h7) && (r_req_dest == 1'h0);
	assign io_requestor_0_resp_bits_pte_reserved_for_hardware 	= r_pte_reserved_for_hardware;
	assign io_requestor_0_resp_bits_pte_ppn 					= resp_ppn;
	assign io_requestor_0_resp_bits_pte_reserved_for_software 	= r_pte_reserved_for_software;
	assign io_requestor_0_resp_bits_pte_d 						= r_pte_d;
	assign io_requestor_0_resp_bits_pte_a 						= r_pte_a;
	assign io_requestor_0_resp_bits_pte_g 						= r_pte_g;
	assign io_requestor_0_resp_bits_pte_u 						= r_pte_u;
	assign io_requestor_0_resp_bits_pte_x 						= r_pte_x;
	assign io_requestor_0_resp_bits_pte_w 						= r_pte_w;
	assign io_requestor_0_resp_bits_pte_r 						= r_pte_r;
	assign io_requestor_0_resp_bits_pte_v 						= r_pte_v;

	assign io_requestor_1_resp_valid 							= (state == 3'h7) && (r_req_dest == 1'h1);
	assign io_requestor_1_resp_bits_pte_reserved_for_hardware 	= r_pte_reserved_for_hardware;
	assign io_requestor_1_resp_bits_pte_ppn 					= resp_ppn;
	assign io_requestor_1_resp_bits_pte_reserved_for_software 	= r_pte_reserved_for_software;
	assign io_requestor_1_resp_bits_pte_d 						= r_pte_d;
	assign io_requestor_1_resp_bits_pte_a 						= r_pte_a;
	assign io_requestor_1_resp_bits_pte_g 						= r_pte_g;
	assign io_requestor_1_resp_bits_pte_u 						= r_pte_u;
	assign io_requestor_1_resp_bits_pte_x 						= r_pte_x;
	assign io_requestor_1_resp_bits_pte_w 						= r_pte_w;
	assign io_requestor_1_resp_bits_pte_r 						= r_pte_r;
	assign io_requestor_1_resp_bits_pte_v 						= r_pte_v;

	assign io_requestor_0_req_ready = arb_io_in_0_ready;
	assign arb_io_in_0_valid 		= io_requestor_0_req_valid;
	assign arb_io_in_0_bits_prv 	= io_requestor_0_req_bits_prv;
	assign arb_io_in_0_bits_pum 	= io_requestor_0_req_bits_pum;
	assign arb_io_in_0_bits_mxr 	= io_requestor_0_req_bits_mxr;
	assign arb_io_in_0_bits_addr 	= io_requestor_0_req_bits_addr;
	assign arb_io_in_0_bits_store 	= io_requestor_0_req_bits_store;
	assign arb_io_in_0_bits_fetch 	= io_requestor_0_req_bits_fetch;

	assign io_requestor_1_req_ready = arb_io_in_1_ready;
	assign arb_io_in_1_valid 		= io_requestor_1_req_valid;
	assign arb_io_in_1_bits_prv 	= io_requestor_1_req_bits_prv;
	assign arb_io_in_1_bits_pum 	= io_requestor_1_req_bits_pum;
	assign arb_io_in_1_bits_mxr 	= io_requestor_1_req_bits_mxr;
	assign arb_io_in_1_bits_addr 	= io_requestor_1_req_bits_addr;
	assign arb_io_in_1_bits_store 	= io_requestor_1_req_bits_store;
	assign arb_io_in_1_bits_fetch 	= io_requestor_1_req_bits_fetch;
endmodule