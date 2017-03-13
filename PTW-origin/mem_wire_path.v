module mem_wire_path(
	input [63:0] io_mem_resp_bits_data,
	input [49:0] pte_addr,
	input r_req_store,
	input [2:0] state,
	input s1_kill,

	output [15:0] pte_reserved_for_hardware,
	output [37:0] pte_ppn,
	output [1:0] pte_reserved_for_software,
	output pte_d,
	output pte_a,
	output pte_g,
	output pte_u,
	output pte_x,
	output pte_w,
	output pte_r,
	output pte_v,
	output [39:0] io_mem_req_bits_addr,
	output [6:0] io_mem_req_bits_tag,
	output [2:0] io_mem_req_bits_typ,
	output io_mem_req_bits_phys,
	output [63:0] io_mem_req_bits_data,
	output io_mem_s1_kill,
	output io_mem_invalidate_lr,
	output [4:0] io_mem_req_bits_cmd,
	output io_mem_req_valid,
	output [63:0] io_mem_s1_data
	);

	assign pte_reserved_for_hardware = io_mem_resp_bits_data[63:48];
	assign pte_ppn 					 = {18'h0, io_mem_resp_bits_data[29:10]};
	assign pte_reserved_for_software = io_mem_resp_bits_data[9:8];
	assign pte_d 					 = io_mem_resp_bits_data[7];
	assign pte_a 					 = io_mem_resp_bits_data[6];
	assign pte_g 					 = io_mem_resp_bits_data[5];
	assign pte_u 					 = io_mem_resp_bits_data[4];
	assign pte_x 					 = io_mem_resp_bits_data[3];
	assign pte_w 					 = io_mem_resp_bits_data[2];
	assign pte_r 					 = io_mem_resp_bits_data[1];
	assign pte_v 					 = (io_mem_resp_bits_data[47:30] != 18'h0) ? 1'h0 : io_mem_resp_bits_data[0];

	assign io_mem_req_bits_addr = {pte_addr[39:0]};
	assign io_mem_req_bits_tag 	= 7'h0;
	assign io_mem_req_bits_typ 	= 3'h1;
	assign io_mem_req_bits_phys = 1'h1;
	assign io_mem_req_bits_data = 64'h0;
	assign io_mem_s1_kill 		= s1_kill;
	assign io_mem_invalidate_lr = 1'h0;
	assign io_mem_req_bits_cmd 	= state == 3'h4 ? 5'ha : 5'h0;
	assign io_mem_req_valid 	= (state == 3'h4) | (state == 3'h1);
	assign io_mem_s1_data 		= {56'h0, r_req_store, 1'h1, 6'h0};

endmodule