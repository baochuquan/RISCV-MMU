`timescale 1ns / 1ps
`define timeslice 200
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:29 02/11/2017
// Design Name:   PTW
// Module Name:   C:/Users/baochuquan/Desktop/RISCV-Verilog/PTW-test01/testbench01.v
// Project Name:  PTW-test01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PTW
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench01;

	// Inputs
	reg clock;
	reg reset;
	reg io_requestor_0_req_valid;
	reg [1:0] io_requestor_0_req_bits_prv;
	reg io_requestor_0_req_bits_pum;
	reg io_requestor_0_req_bits_mxr;
	reg [26:0] io_requestor_0_req_bits_addr;
	reg io_requestor_0_req_bits_store;
	reg io_requestor_0_req_bits_fetch;
	reg io_requestor_1_req_valid;
	reg [1:0] io_requestor_1_req_bits_prv;
	reg io_requestor_1_req_bits_pum;
	reg io_requestor_1_req_bits_mxr;
	reg [26:0] io_requestor_1_req_bits_addr;
	reg io_requestor_1_req_bits_store;
	reg io_requestor_1_req_bits_fetch;
	reg io_mem_req_ready;
	reg io_mem_s2_nack;
	reg io_mem_resp_valid;
	reg [63:0] io_mem_resp_bits_data;
	reg io_mem_xcpt_pf_ld;
	reg io_mem_xcpt_pf_st;
	reg [6:0] io_dpath_ptbr_asid;
	reg [37:0] io_dpath_ptbr_ppn;
	reg io_dpath_invalidate;
	reg io_dpath_status_debug;
	reg [31:0] io_dpath_status_isa;
	reg [1:0] io_dpath_status_prv;
	reg io_dpath_status_sd;
	reg [30:0] io_dpath_status_zero3;
	reg io_dpath_status_sd_rv32;
	reg [1:0] io_dpath_status_zero2;
	reg [4:0] io_dpath_status_vm;
	reg [3:0] io_dpath_status_zero1;
	reg io_dpath_status_mxr;
	reg io_dpath_status_pum;
	reg io_dpath_status_mprv;
	reg [1:0] io_dpath_status_xs;
	reg [1:0] io_dpath_status_fs;
	reg [1:0] io_dpath_status_mpp;
	reg [1:0] io_dpath_status_hpp;
	reg io_dpath_status_spp;
	reg io_dpath_status_mpie;
	reg io_dpath_status_hpie;
	reg io_dpath_status_spie;
	reg io_dpath_status_upie;
	reg io_dpath_status_mie;
	reg io_dpath_status_hie;
	reg io_dpath_status_sie;
	reg io_dpath_status_uie;

	// Outputs
	wire io_requestor_0_req_ready_STD;
	wire io_requestor_0_resp_valid_STD;
	wire [15:0] io_requestor_0_resp_bits_pte_reserved_for_hardware_STD;
	wire [37:0] io_requestor_0_resp_bits_pte_ppn_STD;
	wire [1:0] io_requestor_0_resp_bits_pte_reserved_for_software_STD;
	wire io_requestor_0_resp_bits_pte_d_STD;
	wire io_requestor_0_resp_bits_pte_a_STD;
	wire io_requestor_0_resp_bits_pte_g_STD;
	wire io_requestor_0_resp_bits_pte_u_STD;
	wire io_requestor_0_resp_bits_pte_x_STD;
	wire io_requestor_0_resp_bits_pte_w_STD;
	wire io_requestor_0_resp_bits_pte_r_STD;
	wire io_requestor_0_resp_bits_pte_v_STD;
	wire [6:0] io_requestor_0_ptbr_asid_STD;
	wire [37:0] io_requestor_0_ptbr_ppn_STD;
	wire io_requestor_0_invalidate_STD;
	wire io_requestor_0_status_debug_STD;
	wire [31:0] io_requestor_0_status_isa_STD;
	wire [1:0] io_requestor_0_status_prv_STD;
	wire io_requestor_0_status_sd_STD;
	wire [30:0] io_requestor_0_status_zero3_STD;
	wire io_requestor_0_status_sd_rv32_STD;
	wire [1:0] io_requestor_0_status_zero2_STD;
	wire [4:0] io_requestor_0_status_vm_STD;
	wire [3:0] io_requestor_0_status_zero1_STD;
	wire io_requestor_0_status_mxr_STD;
	wire io_requestor_0_status_pum_STD;
	wire io_requestor_0_status_mprv_STD;
	wire [1:0] io_requestor_0_status_xs_STD;
	wire [1:0] io_requestor_0_status_fs_STD;
	wire [1:0] io_requestor_0_status_mpp_STD;
	wire [1:0] io_requestor_0_status_hpp_STD;
	wire io_requestor_0_status_spp_STD;
	wire io_requestor_0_status_mpie_STD;
	wire io_requestor_0_status_hpie_STD;
	wire io_requestor_0_status_spie_STD;
	wire io_requestor_0_status_upie_STD;
	wire io_requestor_0_status_mie_STD;
	wire io_requestor_0_status_hie_STD;
	wire io_requestor_0_status_sie_STD;
	wire io_requestor_0_status_uie_STD;
	wire io_requestor_1_req_ready_STD;
	wire io_requestor_1_resp_valid_STD;
	wire [15:0] io_requestor_1_resp_bits_pte_reserved_for_hardware_STD;
	wire [37:0] io_requestor_1_resp_bits_pte_ppn_STD;
	wire [1:0] io_requestor_1_resp_bits_pte_reserved_for_software_STD;
	wire io_requestor_1_resp_bits_pte_d_STD;
	wire io_requestor_1_resp_bits_pte_a_STD;
	wire io_requestor_1_resp_bits_pte_g_STD;
	wire io_requestor_1_resp_bits_pte_u_STD;
	wire io_requestor_1_resp_bits_pte_x_STD;
	wire io_requestor_1_resp_bits_pte_w_STD;
	wire io_requestor_1_resp_bits_pte_r_STD;
	wire io_requestor_1_resp_bits_pte_v_STD;
	wire [6:0] io_requestor_1_ptbr_asid_STD;
	wire [37:0] io_requestor_1_ptbr_ppn_STD;
	wire io_requestor_1_invalidate_STD;
	wire io_requestor_1_status_debug_STD;
	wire [31:0] io_requestor_1_status_isa_STD;
	wire [1:0] io_requestor_1_status_prv_STD;
	wire io_requestor_1_status_sd_STD;
	wire [30:0] io_requestor_1_status_zero3_STD;
	wire io_requestor_1_status_sd_rv32_STD;
	wire [1:0] io_requestor_1_status_zero2_STD;
	wire [4:0] io_requestor_1_status_vm_STD;
	wire [3:0] io_requestor_1_status_zero1_STD;
	wire io_requestor_1_status_mxr_STD;
	wire io_requestor_1_status_pum_STD;
	wire io_requestor_1_status_mprv_STD;
	wire [1:0] io_requestor_1_status_xs_STD;
	wire [1:0] io_requestor_1_status_fs_STD;
	wire [1:0] io_requestor_1_status_mpp_STD;
	wire [1:0] io_requestor_1_status_hpp_STD;
	wire io_requestor_1_status_spp_STD;
	wire io_requestor_1_status_mpie_STD;
	wire io_requestor_1_status_hpie_STD;
	wire io_requestor_1_status_spie_STD;
	wire io_requestor_1_status_upie_STD;
	wire io_requestor_1_status_mie_STD;
	wire io_requestor_1_status_hie_STD;
	wire io_requestor_1_status_sie_STD;
	wire io_requestor_1_status_uie_STD;
	wire io_mem_req_valid_STD;
	wire [39:0] io_mem_req_bits_addr_STD;
	wire [6:0] io_mem_req_bits_tag_STD;
	wire [4:0] io_mem_req_bits_cmd_STD;
	wire [2:0] io_mem_req_bits_typ_STD;
	wire io_mem_req_bits_phys_STD;
	wire [63:0] io_mem_req_bits_data_STD;
	wire io_mem_s1_kill_STD;
	wire [63:0] io_mem_s1_data_STD;
	wire io_mem_invalidate_lr_STD;

	wire io_requestor_0_req_ready_DUT;
	wire io_requestor_0_resp_valid_DUT;
	wire [15:0] io_requestor_0_resp_bits_pte_reserved_for_hardware_DUT;
	wire [37:0] io_requestor_0_resp_bits_pte_ppn_DUT;
	wire [1:0] io_requestor_0_resp_bits_pte_reserved_for_software_DUT;
	wire io_requestor_0_resp_bits_pte_d_DUT;
	wire io_requestor_0_resp_bits_pte_a_DUT;
	wire io_requestor_0_resp_bits_pte_g_DUT;
	wire io_requestor_0_resp_bits_pte_u_DUT;
	wire io_requestor_0_resp_bits_pte_x_DUT;
	wire io_requestor_0_resp_bits_pte_w_DUT;
	wire io_requestor_0_resp_bits_pte_r_DUT;
	wire io_requestor_0_resp_bits_pte_v_DUT;
	wire [6:0] io_requestor_0_ptbr_asid_DUT;
	wire [37:0] io_requestor_0_ptbr_ppn_DUT;
	wire io_requestor_0_invalidate_DUT;
	wire io_requestor_0_status_debug_DUT;
	wire [31:0] io_requestor_0_status_isa_DUT;
	wire [1:0] io_requestor_0_status_prv_DUT;
	wire io_requestor_0_status_sd_DUT;
	wire [30:0] io_requestor_0_status_zero3_DUT;
	wire io_requestor_0_status_sd_rv32_DUT;
	wire [1:0] io_requestor_0_status_zero2_DUT;
	wire [4:0] io_requestor_0_status_vm_DUT;
	wire [3:0] io_requestor_0_status_zero1_DUT;
	wire io_requestor_0_status_mxr_DUT;
	wire io_requestor_0_status_pum_DUT;
	wire io_requestor_0_status_mprv_DUT;
	wire [1:0] io_requestor_0_status_xs_DUT;
	wire [1:0] io_requestor_0_status_fs_DUT;
	wire [1:0] io_requestor_0_status_mpp_DUT;
	wire [1:0] io_requestor_0_status_hpp_DUT;
	wire io_requestor_0_status_spp_DUT;
	wire io_requestor_0_status_mpie_DUT;
	wire io_requestor_0_status_hpie_DUT;
	wire io_requestor_0_status_spie_DUT;
	wire io_requestor_0_status_upie_DUT;
	wire io_requestor_0_status_mie_DUT;
	wire io_requestor_0_status_hie_DUT;
	wire io_requestor_0_status_sie_DUT;
	wire io_requestor_0_status_uie_DUT;
	wire io_requestor_1_req_ready_DUT;
	wire io_requestor_1_resp_valid_DUT;
	wire [15:0] io_requestor_1_resp_bits_pte_reserved_for_hardware_DUT;
	wire [37:0] io_requestor_1_resp_bits_pte_ppn_DUT;
	wire [1:0] io_requestor_1_resp_bits_pte_reserved_for_software_DUT;
	wire io_requestor_1_resp_bits_pte_d_DUT;
	wire io_requestor_1_resp_bits_pte_a_DUT;
	wire io_requestor_1_resp_bits_pte_g_DUT;
	wire io_requestor_1_resp_bits_pte_u_DUT;
	wire io_requestor_1_resp_bits_pte_x_DUT;
	wire io_requestor_1_resp_bits_pte_w_DUT;
	wire io_requestor_1_resp_bits_pte_r_DUT;
	wire io_requestor_1_resp_bits_pte_v_DUT;
	wire [6:0] io_requestor_1_ptbr_asid_DUT;
	wire [37:0] io_requestor_1_ptbr_ppn_DUT;
	wire io_requestor_1_invalidate_DUT;
	wire io_requestor_1_status_debug_DUT;
	wire [31:0] io_requestor_1_status_isa_DUT;
	wire [1:0] io_requestor_1_status_prv_DUT;
	wire io_requestor_1_status_sd_DUT;
	wire [30:0] io_requestor_1_status_zero3_DUT;
	wire io_requestor_1_status_sd_rv32_DUT;
	wire [1:0] io_requestor_1_status_zero2_DUT;
	wire [4:0] io_requestor_1_status_vm_DUT;
	wire [3:0] io_requestor_1_status_zero1_DUT;
	wire io_requestor_1_status_mxr_DUT;
	wire io_requestor_1_status_pum_DUT;
	wire io_requestor_1_status_mprv_DUT;
	wire [1:0] io_requestor_1_status_xs_DUT;
	wire [1:0] io_requestor_1_status_fs_DUT;
	wire [1:0] io_requestor_1_status_mpp_DUT;
	wire [1:0] io_requestor_1_status_hpp_DUT;
	wire io_requestor_1_status_spp_DUT;
	wire io_requestor_1_status_mpie_DUT;
	wire io_requestor_1_status_hpie_DUT;
	wire io_requestor_1_status_spie_DUT;
	wire io_requestor_1_status_upie_DUT;
	wire io_requestor_1_status_mie_DUT;
	wire io_requestor_1_status_hie_DUT;
	wire io_requestor_1_status_sie_DUT;
	wire io_requestor_1_status_uie_DUT;
	wire io_mem_req_valid_DUT;
	wire [39:0] io_mem_req_bits_addr_DUT;
	wire [6:0] io_mem_req_bits_tag_DUT;
	wire [4:0] io_mem_req_bits_cmd_DUT;
	wire [2:0] io_mem_req_bits_typ_DUT;
	wire io_mem_req_bits_phys_DUT;
	wire [63:0] io_mem_req_bits_data_DUT;
	wire io_mem_s1_kill_DUT;
	wire [63:0] io_mem_s1_data_DUT;
	wire io_mem_invalidate_lr_DUT;

	integer i;
	parameter test_number01 = 1;
	parameter test_number02 = 12;

	reg [37:0] ptbr_ppn_mem[11:0];
	reg [63:0] pte_level_01_mem[11:0];
	reg [63:0] pte_level_02_mem[11:0];
	reg [63:0] pte_level_03_mem[11:0];

	// initial mem
	initial begin
		$readmemh("./pte_addr01.dat", ptbr_ppn_mem);
		$readmemh("./pte_data_level01.dat", pte_level_01_mem);
		$readmemh("./pte_data_level02.dat", pte_level_02_mem);
		$readmemh("./pte_data_level03.dat", pte_level_03_mem);
	end
	//-------clock-------
	always #(`timeslice/2) begin
		clock = ~clock;
	end

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		initialization;
		// Wait 200 ns for global reset to finish
		#200;
		$display("=====Test Begin=====");
		reset = 0;        

		// testbench02
		for(i = 0; i < test_number02; i = i + 1) begin
			
		end

		/*
		// testbench01
		for(i = 0; i < test_number01; i = i + 1) begin
			testbench_lookup_random;
			compare_results;
		end
		*/

		$display("======Test End======");
	end
    
	task initialization;
		begin
			io_requestor_0_req_valid 		= 0;
			io_requestor_0_req_bits_prv 	= 0;
			io_requestor_0_req_bits_pum 	= 0;
			io_requestor_0_req_bits_mxr 	= 0;
			io_requestor_0_req_bits_addr 	= 0;
			io_requestor_0_req_bits_store 	= 0;
			io_requestor_0_req_bits_fetch 	= 0;

			io_requestor_1_req_valid 		= 0;
			io_requestor_1_req_bits_prv 	= 0;
			io_requestor_1_req_bits_pum 	= 0;
			io_requestor_1_req_bits_mxr 	= 0;
			io_requestor_1_req_bits_addr 	= 0;
			io_requestor_1_req_bits_store 	= 0;
			io_requestor_1_req_bits_fetch 	= 0;

			io_mem_req_ready 		= 0;
			io_mem_s2_nack 			= 0;
			io_mem_resp_valid 		= 0;
			io_mem_resp_bits_data 	= 0;
			io_mem_xcpt_pf_ld		= 0;
			io_mem_xcpt_pf_st 		= 0;

			io_dpath_ptbr_asid 	= 0;
			io_dpath_ptbr_ppn 	= 0;
			io_dpath_invalidate = 0;

			io_dpath_status_debug 	= 0;
			io_dpath_status_isa 	= 0;
			io_dpath_status_prv 	= 0;
			io_dpath_status_sd 		= 0;
			io_dpath_status_zero3 	= 0;
			io_dpath_status_sd_rv32 = 0;
			io_dpath_status_zero2 	= 0;
			io_dpath_status_vm 		= 0;
			io_dpath_status_zero1 	= 0;
			io_dpath_status_mxr 	= 0;
			io_dpath_status_pum 	= 0;
			io_dpath_status_mprv 	= 0;
			io_dpath_status_xs 		= 0;
			io_dpath_status_fs 		= 0;
			io_dpath_status_mpp 	= 0;
			io_dpath_status_hpp 	= 0;
			io_dpath_status_spp 	= 0;
			io_dpath_status_mpie 	= 0;
			io_dpath_status_hpie 	= 0;
			io_dpath_status_spie 	= 0;
			io_dpath_status_upie 	= 0;
			io_dpath_status_mie 	= 0;
			io_dpath_status_hie 	= 0;
			io_dpath_status_sie 	= 0;
			io_dpath_status_uie 	= 0;
		end
	endtask

	/********************testbench02 ********************/
	// test PTW with all the input ports set specific values
	/****************************************************/	
	task testbench_lookup_regular;
		input [] vpn_item;
		begin
			subtask_io_dpath_ptbr();
			io_dpath_invalidate = 0;
			subtask_io_dpath_status;

			// state => ready
			subtask_io_requestor_0(0, );
			subtask_io_requestor_1(0, );

			// Level1
			#400;
			// state => req
			subtask_io_requestor_0(1, );
			subtask_io_requestor_1(1, );

			#1000;
			// state => wait1
			subtask_io_mem(1,x,0, );

			#200;
			// state => wait2
			subtask_io_mem(1,x,1, );

			// Level2
			// state => req
			#200;
			// state => wait1
			subtask_io_mem(1,x,0;)

			#200;
			// state => wait2
			subtask_io_mem(1,x,1);

			// Level3
			// state => req
			#200;
			// state => wait1
			subtask_io_mem(1,x,0);

			#200;
			// state => wait2
			subtask_io_mem(1,x,1);

			// modify pte
			#200;
			// state => set_dirty

			#200;
			// state => wait1_dirty
			subtask_io_mem(1,x,0);

			#200;
			// state => wait2_dirty
			subtask_io_mem(1,x,1);

			// get modified pte
			#200;
			// state => req

			#200;
			// state => wait1
			subtask_io_mem(1,x,0);

			#200;
			// state => wait2
			subtask_io_mem(1,x,1);

			#200;
			// state => done

			#200;
			// state => ready
			subtask_io_mem(0, x, 0);
			subtask_io_requestor_0(0, );
			subtask_io_requestor_1(0, );
		end
	endtask

	task subtask_io_requestor_0;
		input req_valid;
		input [26:0] req_addr;
		begin
			io_requestor_0_req_valid 		= req_valid;
			io_requestor_0_req_bits_prv 	= 2'h1; // 0: U, 1: S, 2: H, 3: M
			io_requestor_0_req_bits_pum 	= 1'h0; // priv=S, PUM=0; priv=S, PUM=1 & U=0; priv!=S, U=1
			io_requestor_0_req_bits_mxr 	= 1'h0; // MXR=0, R=1; MXR=1, X=1; MXR=1, R=1,X=1;
			io_requestor_0_req_bits_addr 	= req_addr; // vpn
			io_requestor_0_req_bits_store 	= 1'h0;
			io_requestor_0_req_bits_fetch 	= 1'h1; // instruction			
		end
	endtask

	task subtask_io_requestor_1;
		input req_valid;
		input [26:0] req_addr;
		begin
			io_requestor_1_req_valid 		= req_valid;
			io_requestor_1_req_bits_prv 	= 2'h1;
			io_requestor_1_req_bits_pum 	= 1'h0;
			io_requestor_1_req_bits_mxr 	= 1'h0;
			io_requestor_1_req_bits_addr 	= req_addr;
			io_requestor_1_req_bits_store 	= 1'h1; // data
			io_requestor_1_req_bits_fetch 	= 1'h0;
		end
	endtask

	task subtask_io_mem;
		input req_ready;
		input s2_nack; // usually 0
		input resp_valid;
		input [63:0] resp_data;
		input xcpt_pf_ld;
		input xcpt_pf_st;
		begin
			io_mem_req_ready 		= req_ready;
			io_mem_s2_nack 			= s2_nack;  
			io_mem_resp_valid 		= resp_valid;
			io_mem_resp_bits_data 	= resp_data; // [63:0] 
			io_mem_xcpt_pf_ld 		= xcpt_pf_ld;
			io_mem_xcpt_pf_st 		= xcpt_pf_st;
		end
	endtask

	task subtask_io_dpath_ptbr;
		input [37:0] ptbr_ppn;
		begin
			io_dpath_ptbr_asid 	= $random; // [unuse]
			io_dpath_ptbr_ppn 	= ptbr_ppn; // root page table base address
		end
	endtask

	task subtask_io_dpath_status;
		begin
			io_dpath_status_debug 	= $random; // [unuse] 0: no debug
			io_dpath_status_isa 	= $random; // [unuse] 31:0
			io_dpath_status_prv 	= $random; // [unuse] 1:0

			io_dpath_status_sd 		= $random; // [unuse]
			io_dpath_status_zero3 	= $random; // [unuse] 30:0
			io_dpath_status_sd_rv32 = $random; // [unuse]
			io_dpath_status_zero2 	= $random; // [unuse] 1:0
			io_dpath_status_vm 		= $random; // [unuse] 4:0
			io_dpath_status_zero1 	= $random; // [unuse] 3:0
			io_dpath_status_mxr 	= $random; // [unuse] 
			io_dpath_status_pum 	= $random; // [unuse] 
			io_dpath_status_mprv 	= $random; // [unuse] 0: instruction/data translate/protect normal; 1: only data translate/protect normal
			io_dpath_status_xs 		= $random; // [unuse] 1:0
			io_dpath_status_fs 		= $random; // [unuse] 1:0
			io_dpath_status_mpp 	= $random; // [unuse] 1:0
			io_dpath_status_hpp 	= $random; // [unuse] 1:0
			io_dpath_status_spp 	= $random; // [unuse]
			io_dpath_status_mpie 	= $random; // [unuse]
			io_dpath_status_hpie 	= $random; // [unuse]
			io_dpath_status_spie 	= $random; // [unuse]
			io_dpath_status_upie 	= $random; // [unuse]
			io_dpath_status_mie 	= $random; // [unuse]
			io_dpath_status_hie 	= $random; // [unuse]
			io_dpath_status_sie 	= $random; // [unuse]
			io_dpath_status_uie 	= $random; // [unuse]
		end
	endtask

	/********************testbench01 ********************/
	// test PTW with all the input ports set random values
	/****************************************************/
	task testbench_lookup_random;
		begin
			io_requestor_0_req_valid 		= $random;
			io_requestor_0_req_bits_prv 	= $random;
			io_requestor_0_req_bits_pum 	= $random;
			io_requestor_0_req_bits_mxr 	= $random;
			io_requestor_0_req_bits_addr 	= $random;
			io_requestor_0_req_bits_store 	= $random;
			io_requestor_0_req_bits_fetch 	= $random;

			io_requestor_1_req_valid 		= $random;
			io_requestor_1_req_bits_prv 	= $random;
			io_requestor_1_req_bits_pum 	= $random;
			io_requestor_1_req_bits_mxr 	= $random;
			io_requestor_1_req_bits_addr 	= $random;
			io_requestor_1_req_bits_store 	= $random;
			io_requestor_1_req_bits_fetch 	= $random;

			io_mem_req_ready 		= $random;
			io_mem_s2_nack 			= $random;
			io_mem_resp_valid 		= $random;
			io_mem_resp_bits_data 	= $random;
			io_mem_xcpt_pf_ld 		= $random;
			io_mem_xcpt_pf_st 		= $random;

			io_dpath_ptbr_asid 	= $random;
			io_dpath_ptbr_ppn 	= $random;
			io_dpath_invalidate = $random;

			io_dpath_status_debug 	= $random;
			io_dpath_status_isa 	= $random;//31:0
			io_dpath_status_prv 	= $random;//1:0
			io_dpath_status_sd 		= $random;
			io_dpath_status_zero3 	= $random;//30:0
			io_dpath_status_sd_rv32 = $random;
			io_dpath_status_zero2 	= $random;//1:0
			io_dpath_status_vm 		= $random;//4:0
			io_dpath_status_zero1 	= $random;//3:0
			io_dpath_status_mxr 	= $random;
			io_dpath_status_pum 	= $random;
			io_dpath_status_mprv 	= $random;
			io_dpath_status_xs 		= $random;//1:0
			io_dpath_status_fs 		= $random;//1:0
			io_dpath_status_mpp 	= $random;//1:0
			io_dpath_status_hpp 	= $random;//1:0
			io_dpath_status_spp 	= $random;
			io_dpath_status_mpie 	= $random;
			io_dpath_status_hpie 	= $random;
			io_dpath_status_spie 	= $random;
			io_dpath_status_upie 	= $random;
			io_dpath_status_mie 	= $random;
			io_dpath_status_hie 	= $random;
			io_dpath_status_sie 	= $random;
			io_dpath_status_uie 	= $random;
		end
	endtask

    /******************analysis result ******************/
	// compare the results of PTW and standard-PTW
	/****************************************************/
	task compare_results;
		begin
			$display("==============compare_results=============");
			$display("---------------requestor-0----------------");
			if( io_requestor_0_req_ready_DUT == io_requestor_0_req_ready_STD ) begin
				$display("io_requestor_0_req_ready  **RIGHT**");
			end else begin
				$display("io_requestor_0_req_ready  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_0_resp_valid_DUT == io_requestor_0_resp_valid_STD ) begin
				$display("io_requestor_0_resp_valid  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_valid  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_reserved_for_hardware_DUT == io_requestor_0_resp_bits_pte_reserved_for_hardware_STD ) begin
				$display("io_requestor_0_resp_bits_pte_reserved_for_hardware  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_reserved_for_hardware  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_ppn_DUT == io_requestor_0_resp_bits_pte_ppn_STD ) begin
				$display("io_requestor_0_resp_bits_pte_ppn  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_ppn  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_reserved_for_software_DUT == io_requestor_0_resp_bits_pte_reserved_for_software_STD ) begin
				$display("io_requestor_0_resp_bits_pte_reserved_for_software  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_reserved_for_software  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_d_DUT == io_requestor_0_resp_bits_pte_d_STD ) begin
				$display("io_requestor_0_resp_bits_pte_d  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_d  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_a_DUT == io_requestor_0_resp_bits_pte_a_STD ) begin
				$display("io_requestor_0_resp_bits_pte_a  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_a  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_g_DUT == io_requestor_0_resp_bits_pte_g_STD ) begin
				$display("io_requestor_0_resp_bits_pte_g  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_g  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_u_DUT == io_requestor_0_resp_bits_pte_u_STD ) begin
				$display("io_requestor_0_resp_bits_pte_u  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_u  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_x_DUT == io_requestor_0_resp_bits_pte_x_STD ) begin
				$display("io_requestor_0_resp_bits_pte_x  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_x  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_w_DUT == io_requestor_0_resp_bits_pte_w_STD ) begin
				$display("io_requestor_0_resp_bits_pte_w  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_w  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_r_DUT == io_requestor_0_resp_bits_pte_r_STD ) begin
				$display("io_requestor_0_resp_bits_pte_r  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_r  ##ERROR##");
			end
			if( io_requestor_0_resp_bits_pte_v_DUT == io_requestor_0_resp_bits_pte_v_STD ) begin
				$display("io_requestor_0_resp_bits_pte_v  **RIGHT**");
			end else begin
				$display("io_requestor_0_resp_bits_pte_v  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_0_ptbr_asid_DUT == io_requestor_0_ptbr_asid_STD ) begin
				$display("io_requestor_0_ptbr_asid  **RIGHT**");
			end else begin
				$display("io_requestor_0_ptbr_asid  ##ERROR##");
			end
			if( io_requestor_0_ptbr_ppn_DUT == io_requestor_0_ptbr_ppn_STD ) begin
				$display("io_requestor_0_ptbr_ppn  **RIGHT**");
			end else begin
				$display("io_requestor_0_ptbr_ppn  ##ERROR##");
			end
			if( io_requestor_0_invalidate_DUT == io_requestor_0_invalidate_STD ) begin
				$display("io_requestor_0_invalidate  **RIGHT**");
			end else begin
				$display("io_requestor_0_invalidate  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_0_status_debug_DUT == io_requestor_0_status_debug_STD ) begin
				$display("io_requestor_0_status_debug  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_debug  ##ERROR##");
			end
			if( io_requestor_0_status_isa_DUT == io_requestor_0_status_isa_STD ) begin
				$display("io_requestor_0_status_isa  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_isa  ##ERROR##");
			end
			if( io_requestor_0_status_prv_DUT == io_requestor_0_status_prv_STD ) begin
				$display("io_requestor_0_status_prv  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_prv  ##ERROR##");
			end
			if( io_requestor_0_status_sd_DUT == io_requestor_0_status_sd_STD ) begin
				$display("io_requestor_0_status_sd  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_sd  ##ERROR##");
			end
			if( io_requestor_0_status_zero3_DUT == io_requestor_0_status_zero3_STD ) begin
				$display("io_requestor_0_status_zero3  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_zero3  ##ERROR##");
			end
			if( io_requestor_0_status_sd_rv32_DUT == io_requestor_0_status_sd_rv32_STD ) begin
				$display("io_requestor_0_status_sd_rv32  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_sd_rv32  ##ERROR##");
			end
			if( io_requestor_0_status_zero2_DUT == io_requestor_0_status_zero2_STD ) begin
				$display("io_requestor_0_status_zero2  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_zero2  ##ERROR##");
			end
			if( io_requestor_0_status_vm_DUT == io_requestor_0_status_vm_STD ) begin
				$display("io_requestor_0_status_vm  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_vm  ##ERROR##");
			end
			if( io_requestor_0_status_zero1_DUT == io_requestor_0_status_zero1_STD ) begin
				$display("io_requestor_0_status_zero1  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_zero1  ##ERROR##");
			end
			if( io_requestor_0_status_mxr_DUT == io_requestor_0_status_mxr_STD ) begin
				$display("io_requestor_0_status_mxr  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_mxr  ##ERROR##");
			end
			if( io_requestor_0_status_pum_DUT == io_requestor_0_status_pum_STD ) begin
				$display("io_requestor_0_status_pum  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_pum  ##ERROR##");
			end
			if( io_requestor_0_status_mprv_DUT == io_requestor_0_status_mprv_STD ) begin
				$display("io_requestor_0_status_mprv  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_mprv  ##ERROR##");
			end
			if( io_requestor_0_status_xs_DUT == io_requestor_0_status_xs_STD ) begin
				$display("io_requestor_0_status_xs  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_xs  ##ERROR##");
			end
			if( io_requestor_0_status_fs_DUT == io_requestor_0_status_fs_STD ) begin
				$display("io_requestor_0_status_fs  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_fs  ##ERROR##");
			end
			if( io_requestor_0_status_mpp_DUT == io_requestor_0_status_mpp_STD ) begin
				$display("io_requestor_0_status_mpp  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_mpp  ##ERROR##");
			end
			if( io_requestor_0_status_hpp_DUT == io_requestor_0_status_hpp_STD ) begin
				$display("io_requestor_0_status_hpp  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_hpp  ##ERROR##");
			end
			if( io_requestor_0_status_spp_DUT == io_requestor_0_status_spp_STD ) begin
				$display("io_requestor_0_status_spp  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_spp  ##ERROR##");
			end
			if( io_requestor_0_status_mpie_DUT == io_requestor_0_status_mpie_STD ) begin
				$display("io_requestor_0_status_mpie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_mpie  ##ERROR##");
			end
			if( io_requestor_0_status_hpie_DUT == io_requestor_0_status_hpie_STD ) begin
				$display("io_requestor_0_status_hpie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_hpie  ##ERROR##");
			end
			if( io_requestor_0_status_spie_DUT == io_requestor_0_status_spie_STD ) begin
				$display("io_requestor_0_status_spie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_spie  ##ERROR##");
			end
			if( io_requestor_0_status_upie_DUT == io_requestor_0_status_upie_STD ) begin
				$display("io_requestor_0_status_upie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_upie  ##ERROR##");
			end
			if( io_requestor_0_status_mie_DUT == io_requestor_0_status_mie_STD ) begin
				$display("io_requestor_0_status_mie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_mie  ##ERROR##");
			end
			if( io_requestor_0_status_hie_DUT == io_requestor_0_status_hie_STD ) begin
				$display("io_requestor_0_status_hie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_hie  ##ERROR##");
			end
			if( io_requestor_0_status_sie_DUT == io_requestor_0_status_sie_STD ) begin
				$display("io_requestor_0_status_sie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_sie  ##ERROR##");
			end
			if( io_requestor_0_status_uie_DUT == io_requestor_0_status_uie_STD ) begin
				$display("io_requestor_0_status_uie  **RIGHT**");
			end else begin
				$display("io_requestor_0_status_uie  ##ERROR##");
			end

			$display("---------------requestor-1----------------");
			if( io_requestor_1_req_ready_DUT == io_requestor_1_req_ready_STD ) begin
				$display("io_requestor_1_req_ready  **RIGHT**");
			end else begin
				$display("io_requestor_1_req_ready  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_1_resp_valid_DUT == io_requestor_1_resp_valid_STD ) begin
				$display("io_requestor_1_resp_valid  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_valid  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_reserved_for_hardware_DUT == io_requestor_1_resp_bits_pte_reserved_for_hardware_STD ) begin
				$display("io_requestor_1_resp_bits_pte_reserved_for_hardware  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_reserved_for_hardware  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_ppn_DUT == io_requestor_1_resp_bits_pte_ppn_STD ) begin
				$display("io_requestor_1_resp_bits_pte_ppn  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_ppn  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_reserved_for_software_DUT == io_requestor_1_resp_bits_pte_reserved_for_software_STD ) begin
				$display("io_requestor_1_resp_bits_pte_reserved_for_software  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_reserved_for_software  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_d_DUT == io_requestor_1_resp_bits_pte_d_STD ) begin
				$display("io_requestor_1_resp_bits_pte_d  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_d  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_a_DUT == io_requestor_1_resp_bits_pte_a_STD ) begin
				$display("io_requestor_1_resp_bits_pte_a  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_a  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_g_DUT == io_requestor_1_resp_bits_pte_g_STD ) begin
				$display("io_requestor_1_resp_bits_pte_g  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_g  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_u_DUT == io_requestor_1_resp_bits_pte_u_STD ) begin
				$display("io_requestor_1_resp_bits_pte_u  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_u  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_x_DUT == io_requestor_1_resp_bits_pte_x_STD ) begin
				$display("io_requestor_1_resp_bits_pte_x  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_x  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_w_DUT == io_requestor_1_resp_bits_pte_w_STD ) begin
				$display("io_requestor_1_resp_bits_pte_w  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_w  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_r_DUT == io_requestor_1_resp_bits_pte_r_STD ) begin
				$display("io_requestor_1_resp_bits_pte_r  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_r  ##ERROR##");
			end
			if( io_requestor_1_resp_bits_pte_v_DUT == io_requestor_1_resp_bits_pte_v_STD ) begin
				$display("io_requestor_1_resp_bits_pte_v  **RIGHT**");
			end else begin
				$display("io_requestor_1_resp_bits_pte_v  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_1_ptbr_asid_DUT == io_requestor_1_ptbr_asid_STD ) begin
				$display("io_requestor_1_ptbr_asid  **RIGHT**");
			end else begin
				$display("io_requestor_1_ptbr_asid  ##ERROR##");
			end
			if( io_requestor_1_ptbr_ppn_DUT == io_requestor_1_ptbr_ppn_STD ) begin
				$display("io_requestor_1_ptbr_ppn  **RIGHT**");
			end else begin
				$display("io_requestor_1_ptbr_ppn  ##ERROR##");
			end
			if( io_requestor_1_invalidate_DUT == io_requestor_1_invalidate_STD ) begin
				$display("io_requestor_1_invalidate  **RIGHT**");
			end else begin
				$display("io_requestor_1_invalidate  ##ERROR##");
			end

			$display(" ");
			if( io_requestor_1_status_debug_DUT == io_requestor_1_status_debug_STD ) begin
				$display("io_requestor_1_status_debug  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_debug  ##ERROR##");
			end
			if( io_requestor_1_status_isa_DUT == io_requestor_1_status_isa_STD ) begin
				$display("io_requestor_1_status_isa  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_isa  ##ERROR##");
			end
			if( io_requestor_1_status_prv_DUT == io_requestor_1_status_prv_STD ) begin
				$display("io_requestor_1_status_prv  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_prv  ##ERROR##");
			end
			if( io_requestor_1_status_sd_DUT == io_requestor_1_status_sd_STD ) begin
				$display("io_requestor_1_status_sd  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_sd  ##ERROR##");
			end
			if( io_requestor_1_status_zero3_DUT == io_requestor_1_status_zero3_STD ) begin
				$display("io_requestor_1_status_zero3  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_zero3  ##ERROR##");
			end
			if( io_requestor_1_status_sd_rv32_DUT == io_requestor_1_status_sd_rv32_STD ) begin
				$display("io_requestor_1_status_sd_rv32  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_sd_rv32  ##ERROR##");
			end
			if( io_requestor_1_status_zero2_DUT == io_requestor_1_status_zero2_STD ) begin
				$display("io_requestor_1_status_zero2  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_zero2  ##ERROR##");
			end
			if( io_requestor_1_status_vm_DUT == io_requestor_1_status_vm_STD ) begin
				$display("io_requestor_1_status_vm  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_vm  ##ERROR##");
			end
			if( io_requestor_1_status_zero1_DUT == io_requestor_1_status_zero1_STD ) begin
				$display("io_requestor_1_status_zero1  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_zero1  ##ERROR##");
			end
			if( io_requestor_1_status_mxr_DUT == io_requestor_1_status_mxr_STD ) begin
				$display("io_requestor_1_status_mxr  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_mxr  ##ERROR##");
			end
			if( io_requestor_1_status_pum_DUT == io_requestor_1_status_pum_STD ) begin
				$display("io_requestor_1_status_pum  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_pum  ##ERROR##");
			end
			if( io_requestor_1_status_mprv_DUT == io_requestor_1_status_mprv_STD ) begin
				$display("io_requestor_1_status_mprv  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_mprv  ##ERROR##");
			end
			if( io_requestor_1_status_xs_DUT == io_requestor_1_status_xs_STD ) begin
				$display("io_requestor_1_status_xs  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_xs  ##ERROR##");
			end
			if( io_requestor_1_status_fs_DUT == io_requestor_1_status_fs_STD ) begin
				$display("io_requestor_1_status_fs  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_fs  ##ERROR##");
			end
			if( io_requestor_1_status_mpp_DUT == io_requestor_1_status_mpp_STD ) begin
				$display("io_requestor_1_status_mpp  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_mpp  ##ERROR##");
			end
			if( io_requestor_1_status_hpp_DUT == io_requestor_1_status_hpp_STD ) begin
				$display("io_requestor_1_status_hpp  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_hpp  ##ERROR##");
			end
			if( io_requestor_1_status_spp_DUT == io_requestor_1_status_spp_STD ) begin
				$display("io_requestor_1_status_spp  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_spp  ##ERROR##");
			end
			if( io_requestor_1_status_mpie_DUT == io_requestor_1_status_mpie_STD ) begin
				$display("io_requestor_1_status_mpie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_mpie  ##ERROR##");
			end
			if( io_requestor_1_status_hpie_DUT == io_requestor_1_status_hpie_STD ) begin
				$display("io_requestor_1_status_hpie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_hpie  ##ERROR##");
			end
			if( io_requestor_1_status_spie_DUT == io_requestor_1_status_spie_STD ) begin
				$display("io_requestor_1_status_spie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_spie  ##ERROR##");
			end
			if( io_requestor_1_status_upie_DUT == io_requestor_1_status_upie_STD ) begin
				$display("io_requestor_1_status_upie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_upie  ##ERROR##");
			end
			if( io_requestor_1_status_mie_DUT == io_requestor_1_status_mie_STD ) begin
				$display("io_requestor_1_status_mie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_mie  ##ERROR##");
			end
			if( io_requestor_1_status_hie_DUT == io_requestor_1_status_hie_STD ) begin
				$display("io_requestor_1_status_hie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_hie  ##ERROR##");
			end
			if( io_requestor_1_status_sie_DUT == io_requestor_1_status_sie_STD ) begin
				$display("io_requestor_1_status_sie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_sie  ##ERROR##");
			end
			if( io_requestor_1_status_uie_DUT == io_requestor_1_status_uie_STD ) begin
				$display("io_requestor_1_status_uie  **RIGHT**");
			end else begin
				$display("io_requestor_1_status_uie  ##ERROR##");
			end

			$display("---------------requestor-1----------------");
			$display("-------------------mem--------------------");
			if( io_mem_req_valid_DUT == io_mem_req_valid_STD ) begin
				$display("io_mem_req_valid  **RIGHT**");
			end else begin
				$display("io_mem_req_valid  ##ERROR##");
			end
			if( io_mem_req_bits_addr_DUT == io_mem_req_bits_addr_STD ) begin
				$display("io_mem_req_bits_addr  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_addr  ##ERROR##");
			end
			if( io_mem_req_bits_tag_DUT == io_mem_req_bits_tag_STD ) begin
				$display("io_mem_req_bits_tag  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_tag  ##ERROR##");
			end
			if( io_mem_req_bits_cmd_DUT == io_mem_req_bits_cmd_STD ) begin
				$display("io_mem_req_bits_cmd  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_cmd  ##ERROR##");
			end
			if( io_mem_req_bits_typ_DUT == io_mem_req_bits_typ_STD ) begin
				$display("io_mem_req_bits_typ  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_typ  ##ERROR##");
			end
			if( io_mem_req_bits_phys_DUT == io_mem_req_bits_phys_STD ) begin
				$display("io_mem_req_bits_phys  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_phys  ##ERROR##");
			end
			if( io_mem_req_bits_data_DUT == io_mem_req_bits_data_STD ) begin
				$display("io_mem_req_bits_data  **RIGHT**");
			end else begin
				$display("io_mem_req_bits_data  ##ERROR##");
			end
			if( io_mem_s1_kill_DUT == io_mem_s1_kill_STD ) begin
				$display("io_mem_s1_kill  **RIGHT**");
			end else begin
				$display("io_mem_s1_kill  ##ERROR##");
			end
			if( io_mem_s1_data_DUT == io_mem_s1_data_STD ) begin
				$display("io_mem_s1_data  **RIGHT**");
			end else begin
				$display("io_mem_s1_data  ##ERROR##");
			end
			if( io_mem_invalidate_lr_DUT == io_mem_invalidate_lr_STD ) begin
				$display("io_mem_invalidate_lr  **RIGHT**");
			end else begin
				$display("io_mem_invalidate_lr  ##ERROR##");
			end
			$display("==========================================");
		end
	endtask

    	// Instantiate the Unit Under Test (UUT)
	PTW uutDUT (
		.clock(clock), 
		.reset(reset), 
		.io_requestor_0_req_ready(io_requestor_0_req_ready_DUT), 
		.io_requestor_0_req_valid(io_requestor_0_req_valid), 
		.io_requestor_0_req_bits_prv(io_requestor_0_req_bits_prv), 
		.io_requestor_0_req_bits_pum(io_requestor_0_req_bits_pum), 
		.io_requestor_0_req_bits_mxr(io_requestor_0_req_bits_mxr), 
		.io_requestor_0_req_bits_addr(io_requestor_0_req_bits_addr), 
		.io_requestor_0_req_bits_store(io_requestor_0_req_bits_store), 
		.io_requestor_0_req_bits_fetch(io_requestor_0_req_bits_fetch), 
		.io_requestor_0_resp_valid(io_requestor_0_resp_valid_DUT), 
		.io_requestor_0_resp_bits_pte_reserved_for_hardware(io_requestor_0_resp_bits_pte_reserved_for_hardware_DUT), 
		.io_requestor_0_resp_bits_pte_ppn(io_requestor_0_resp_bits_pte_ppn_DUT), 
		.io_requestor_0_resp_bits_pte_reserved_for_software(io_requestor_0_resp_bits_pte_reserved_for_software_DUT), 
		.io_requestor_0_resp_bits_pte_d(io_requestor_0_resp_bits_pte_d_DUT), 
		.io_requestor_0_resp_bits_pte_a(io_requestor_0_resp_bits_pte_a_DUT), 
		.io_requestor_0_resp_bits_pte_g(io_requestor_0_resp_bits_pte_g_DUT), 
		.io_requestor_0_resp_bits_pte_u(io_requestor_0_resp_bits_pte_u_DUT), 
		.io_requestor_0_resp_bits_pte_x(io_requestor_0_resp_bits_pte_x_DUT), 
		.io_requestor_0_resp_bits_pte_w(io_requestor_0_resp_bits_pte_w_DUT), 
		.io_requestor_0_resp_bits_pte_r(io_requestor_0_resp_bits_pte_r_DUT), 
		.io_requestor_0_resp_bits_pte_v(io_requestor_0_resp_bits_pte_v_DUT), 
		.io_requestor_0_ptbr_asid(io_requestor_0_ptbr_asid_DUT), 
		.io_requestor_0_ptbr_ppn(io_requestor_0_ptbr_ppn_DUT), 
		.io_requestor_0_invalidate(io_requestor_0_invalidate_DUT), 
		.io_requestor_0_status_debug(io_requestor_0_status_debug_DUT), 
		.io_requestor_0_status_isa(io_requestor_0_status_isa_DUT), 
		.io_requestor_0_status_prv(io_requestor_0_status_prv_DUT), 
		.io_requestor_0_status_sd(io_requestor_0_status_sd_DUT), 
		.io_requestor_0_status_zero3(io_requestor_0_status_zero3_DUT), 
		.io_requestor_0_status_sd_rv32(io_requestor_0_status_sd_rv32_DUT), 
		.io_requestor_0_status_zero2(io_requestor_0_status_zero2_DUT), 
		.io_requestor_0_status_vm(io_requestor_0_status_vm_DUT), 
		.io_requestor_0_status_zero1(io_requestor_0_status_zero1_DUT), 
		.io_requestor_0_status_mxr(io_requestor_0_status_mxr_DUT), 
		.io_requestor_0_status_pum(io_requestor_0_status_pum_DUT), 
		.io_requestor_0_status_mprv(io_requestor_0_status_mprv_DUT), 
		.io_requestor_0_status_xs(io_requestor_0_status_xs_DUT), 
		.io_requestor_0_status_fs(io_requestor_0_status_fs_DUT), 
		.io_requestor_0_status_mpp(io_requestor_0_status_mpp_DUT), 
		.io_requestor_0_status_hpp(io_requestor_0_status_hpp_DUT), 
		.io_requestor_0_status_spp(io_requestor_0_status_spp_DUT), 
		.io_requestor_0_status_mpie(io_requestor_0_status_mpie_DUT), 
		.io_requestor_0_status_hpie(io_requestor_0_status_hpie_DUT), 
		.io_requestor_0_status_spie(io_requestor_0_status_spie_DUT), 
		.io_requestor_0_status_upie(io_requestor_0_status_upie_DUT), 
		.io_requestor_0_status_mie(io_requestor_0_status_mie_DUT), 
		.io_requestor_0_status_hie(io_requestor_0_status_hie_DUT), 
		.io_requestor_0_status_sie(io_requestor_0_status_sie_DUT), 
		.io_requestor_0_status_uie(io_requestor_0_status_uie_DUT), 
		.io_requestor_1_req_ready(io_requestor_1_req_ready_DUT), 
		.io_requestor_1_req_valid(io_requestor_1_req_valid), 
		.io_requestor_1_req_bits_prv(io_requestor_1_req_bits_prv), 
		.io_requestor_1_req_bits_pum(io_requestor_1_req_bits_pum), 
		.io_requestor_1_req_bits_mxr(io_requestor_1_req_bits_mxr), 
		.io_requestor_1_req_bits_addr(io_requestor_1_req_bits_addr), 
		.io_requestor_1_req_bits_store(io_requestor_1_req_bits_store), 
		.io_requestor_1_req_bits_fetch(io_requestor_1_req_bits_fetch), 
		.io_requestor_1_resp_valid(io_requestor_1_resp_valid_DUT), 
		.io_requestor_1_resp_bits_pte_reserved_for_hardware(io_requestor_1_resp_bits_pte_reserved_for_hardware_DUT), 
		.io_requestor_1_resp_bits_pte_ppn(io_requestor_1_resp_bits_pte_ppn_DUT), 
		.io_requestor_1_resp_bits_pte_reserved_for_software(io_requestor_1_resp_bits_pte_reserved_for_software_DUT), 
		.io_requestor_1_resp_bits_pte_d(io_requestor_1_resp_bits_pte_d_DUT), 
		.io_requestor_1_resp_bits_pte_a(io_requestor_1_resp_bits_pte_a_DUT), 
		.io_requestor_1_resp_bits_pte_g(io_requestor_1_resp_bits_pte_g_DUT), 
		.io_requestor_1_resp_bits_pte_u(io_requestor_1_resp_bits_pte_u_DUT), 
		.io_requestor_1_resp_bits_pte_x(io_requestor_1_resp_bits_pte_x_DUT), 
		.io_requestor_1_resp_bits_pte_w(io_requestor_1_resp_bits_pte_w_DUT), 
		.io_requestor_1_resp_bits_pte_r(io_requestor_1_resp_bits_pte_r_DUT), 
		.io_requestor_1_resp_bits_pte_v(io_requestor_1_resp_bits_pte_v_DUT), 
		.io_requestor_1_ptbr_asid(io_requestor_1_ptbr_asid_DUT), 
		.io_requestor_1_ptbr_ppn(io_requestor_1_ptbr_ppn_DUT), 
		.io_requestor_1_invalidate(io_requestor_1_invalidate_DUT), 
		.io_requestor_1_status_debug(io_requestor_1_status_debug_DUT), 
		.io_requestor_1_status_isa(io_requestor_1_status_isa_DUT), 
		.io_requestor_1_status_prv(io_requestor_1_status_prv_DUT), 
		.io_requestor_1_status_sd(io_requestor_1_status_sd_DUT), 
		.io_requestor_1_status_zero3(io_requestor_1_status_zero3_DUT), 
		.io_requestor_1_status_sd_rv32(io_requestor_1_status_sd_rv32_DUT), 
		.io_requestor_1_status_zero2(io_requestor_1_status_zero2_DUT), 
		.io_requestor_1_status_vm(io_requestor_1_status_vm_DUT), 
		.io_requestor_1_status_zero1(io_requestor_1_status_zero1_DUT), 
		.io_requestor_1_status_mxr(io_requestor_1_status_mxr_DUT), 
		.io_requestor_1_status_pum(io_requestor_1_status_pum_DUT), 
		.io_requestor_1_status_mprv(io_requestor_1_status_mprv_DUT), 
		.io_requestor_1_status_xs(io_requestor_1_status_xs_DUT), 
		.io_requestor_1_status_fs(io_requestor_1_status_fs_DUT), 
		.io_requestor_1_status_mpp(io_requestor_1_status_mpp_DUT), 
		.io_requestor_1_status_hpp(io_requestor_1_status_hpp_DUT), 
		.io_requestor_1_status_spp(io_requestor_1_status_spp_DUT), 
		.io_requestor_1_status_mpie(io_requestor_1_status_mpie_DUT), 
		.io_requestor_1_status_hpie(io_requestor_1_status_hpie_DUT), 
		.io_requestor_1_status_spie(io_requestor_1_status_spie_DUT), 
		.io_requestor_1_status_upie(io_requestor_1_status_upie_DUT), 
		.io_requestor_1_status_mie(io_requestor_1_status_mie_DUT), 
		.io_requestor_1_status_hie(io_requestor_1_status_hie_DUT), 
		.io_requestor_1_status_sie(io_requestor_1_status_sie_DUT), 
		.io_requestor_1_status_uie(io_requestor_1_status_uie_DUT), 
		.io_mem_req_ready(io_mem_req_ready), 
		.io_mem_req_valid(io_mem_req_valid_DUT), 
		.io_mem_req_bits_addr(io_mem_req_bits_addr_DUT), 
		.io_mem_req_bits_tag(io_mem_req_bits_tag_DUT), 
		.io_mem_req_bits_cmd(io_mem_req_bits_cmd_DUT), 
		.io_mem_req_bits_typ(io_mem_req_bits_typ_DUT), 
		.io_mem_req_bits_phys(io_mem_req_bits_phys_DUT), 
		.io_mem_req_bits_data(io_mem_req_bits_data_DUT), 
		.io_mem_s1_kill(io_mem_s1_kill_DUT), 
		.io_mem_s1_data(io_mem_s1_data_DUT), 
		.io_mem_s2_nack(io_mem_s2_nack), 
		.io_mem_resp_valid(io_mem_resp_valid), 
		.io_mem_resp_bits_data(io_mem_resp_bits_data), 
		.io_mem_xcpt_pf_ld(io_mem_xcpt_pf_ld), 
		.io_mem_xcpt_pf_st(io_mem_xcpt_pf_st), 
		.io_mem_invalidate_lr(io_mem_invalidate_lr_DUT), 
		.io_dpath_ptbr_asid(io_dpath_ptbr_asid), 
		.io_dpath_ptbr_ppn(io_dpath_ptbr_ppn), 
		.io_dpath_invalidate(io_dpath_invalidate), 
		.io_dpath_status_debug(io_dpath_status_debug), 
		.io_dpath_status_isa(io_dpath_status_isa), 
		.io_dpath_status_prv(io_dpath_status_prv), 
		.io_dpath_status_sd(io_dpath_status_sd), 
		.io_dpath_status_zero3(io_dpath_status_zero3), 
		.io_dpath_status_sd_rv32(io_dpath_status_sd_rv32), 
		.io_dpath_status_zero2(io_dpath_status_zero2), 
		.io_dpath_status_vm(io_dpath_status_vm), 
		.io_dpath_status_zero1(io_dpath_status_zero1), 
		.io_dpath_status_mxr(io_dpath_status_mxr), 
		.io_dpath_status_pum(io_dpath_status_pum), 
		.io_dpath_status_mprv(io_dpath_status_mprv), 
		.io_dpath_status_xs(io_dpath_status_xs), 
		.io_dpath_status_fs(io_dpath_status_fs), 
		.io_dpath_status_mpp(io_dpath_status_mpp), 
		.io_dpath_status_hpp(io_dpath_status_hpp), 
		.io_dpath_status_spp(io_dpath_status_spp), 
		.io_dpath_status_mpie(io_dpath_status_mpie), 
		.io_dpath_status_hpie(io_dpath_status_hpie), 
		.io_dpath_status_spie(io_dpath_status_spie), 
		.io_dpath_status_upie(io_dpath_status_upie), 
		.io_dpath_status_mie(io_dpath_status_mie), 
		.io_dpath_status_hie(io_dpath_status_hie), 
		.io_dpath_status_sie(io_dpath_status_sie), 
		.io_dpath_status_uie(io_dpath_status_uie)
	);
	standard_PTW uutSTD (
		.clock(clock), 
		.reset(reset), 
		.io_requestor_0_req_ready(io_requestor_0_req_ready_STD), 
		.io_requestor_0_req_valid(io_requestor_0_req_valid), 
		.io_requestor_0_req_bits_prv(io_requestor_0_req_bits_prv), 
		.io_requestor_0_req_bits_pum(io_requestor_0_req_bits_pum), 
		.io_requestor_0_req_bits_mxr(io_requestor_0_req_bits_mxr), 
		.io_requestor_0_req_bits_addr(io_requestor_0_req_bits_addr), 
		.io_requestor_0_req_bits_store(io_requestor_0_req_bits_store), 
		.io_requestor_0_req_bits_fetch(io_requestor_0_req_bits_fetch), 
		.io_requestor_0_resp_valid(io_requestor_0_resp_valid_STD), 
		.io_requestor_0_resp_bits_pte_reserved_for_hardware(io_requestor_0_resp_bits_pte_reserved_for_hardware_STD), 
		.io_requestor_0_resp_bits_pte_ppn(io_requestor_0_resp_bits_pte_ppn_STD), 
		.io_requestor_0_resp_bits_pte_reserved_for_software(io_requestor_0_resp_bits_pte_reserved_for_software_STD), 
		.io_requestor_0_resp_bits_pte_d(io_requestor_0_resp_bits_pte_d_STD), 
		.io_requestor_0_resp_bits_pte_a(io_requestor_0_resp_bits_pte_a_STD), 
		.io_requestor_0_resp_bits_pte_g(io_requestor_0_resp_bits_pte_g_STD), 
		.io_requestor_0_resp_bits_pte_u(io_requestor_0_resp_bits_pte_u_STD), 
		.io_requestor_0_resp_bits_pte_x(io_requestor_0_resp_bits_pte_x_STD), 
		.io_requestor_0_resp_bits_pte_w(io_requestor_0_resp_bits_pte_w_STD), 
		.io_requestor_0_resp_bits_pte_r(io_requestor_0_resp_bits_pte_r_STD), 
		.io_requestor_0_resp_bits_pte_v(io_requestor_0_resp_bits_pte_v_STD), 
		.io_requestor_0_ptbr_asid(io_requestor_0_ptbr_asid_STD), 
		.io_requestor_0_ptbr_ppn(io_requestor_0_ptbr_ppn_STD), 
		.io_requestor_0_invalidate(io_requestor_0_invalidate_STD), 
		.io_requestor_0_status_debug(io_requestor_0_status_debug_STD), 
		.io_requestor_0_status_isa(io_requestor_0_status_isa_STD), 
		.io_requestor_0_status_prv(io_requestor_0_status_prv_STD), 
		.io_requestor_0_status_sd(io_requestor_0_status_sd_STD), 
		.io_requestor_0_status_zero3(io_requestor_0_status_zero3_STD), 
		.io_requestor_0_status_sd_rv32(io_requestor_0_status_sd_rv32_STD), 
		.io_requestor_0_status_zero2(io_requestor_0_status_zero2_STD), 
		.io_requestor_0_status_vm(io_requestor_0_status_vm_STD), 
		.io_requestor_0_status_zero1(io_requestor_0_status_zero1_STD), 
		.io_requestor_0_status_mxr(io_requestor_0_status_mxr_STD), 
		.io_requestor_0_status_pum(io_requestor_0_status_pum_STD), 
		.io_requestor_0_status_mprv(io_requestor_0_status_mprv_STD), 
		.io_requestor_0_status_xs(io_requestor_0_status_xs_STD), 
		.io_requestor_0_status_fs(io_requestor_0_status_fs_STD), 
		.io_requestor_0_status_mpp(io_requestor_0_status_mpp_STD), 
		.io_requestor_0_status_hpp(io_requestor_0_status_hpp_STD), 
		.io_requestor_0_status_spp(io_requestor_0_status_spp_STD), 
		.io_requestor_0_status_mpie(io_requestor_0_status_mpie_STD), 
		.io_requestor_0_status_hpie(io_requestor_0_status_hpie_STD), 
		.io_requestor_0_status_spie(io_requestor_0_status_spie_STD), 
		.io_requestor_0_status_upie(io_requestor_0_status_upie_STD), 
		.io_requestor_0_status_mie(io_requestor_0_status_mie_STD), 
		.io_requestor_0_status_hie(io_requestor_0_status_hie_STD), 
		.io_requestor_0_status_sie(io_requestor_0_status_sie_STD), 
		.io_requestor_0_status_uie(io_requestor_0_status_uie_STD), 
		.io_requestor_1_req_ready(io_requestor_1_req_ready_STD), 
		.io_requestor_1_req_valid(io_requestor_1_req_valid), 
		.io_requestor_1_req_bits_prv(io_requestor_1_req_bits_prv), 
		.io_requestor_1_req_bits_pum(io_requestor_1_req_bits_pum), 
		.io_requestor_1_req_bits_mxr(io_requestor_1_req_bits_mxr), 
		.io_requestor_1_req_bits_addr(io_requestor_1_req_bits_addr), 
		.io_requestor_1_req_bits_store(io_requestor_1_req_bits_store), 
		.io_requestor_1_req_bits_fetch(io_requestor_1_req_bits_fetch), 
		.io_requestor_1_resp_valid(io_requestor_1_resp_valid_STD), 
		.io_requestor_1_resp_bits_pte_reserved_for_hardware(io_requestor_1_resp_bits_pte_reserved_for_hardware_STD), 
		.io_requestor_1_resp_bits_pte_ppn(io_requestor_1_resp_bits_pte_ppn_STD), 
		.io_requestor_1_resp_bits_pte_reserved_for_software(io_requestor_1_resp_bits_pte_reserved_for_software_STD), 
		.io_requestor_1_resp_bits_pte_d(io_requestor_1_resp_bits_pte_d_STD), 
		.io_requestor_1_resp_bits_pte_a(io_requestor_1_resp_bits_pte_a_STD), 
		.io_requestor_1_resp_bits_pte_g(io_requestor_1_resp_bits_pte_g_STD), 
		.io_requestor_1_resp_bits_pte_u(io_requestor_1_resp_bits_pte_u_STD), 
		.io_requestor_1_resp_bits_pte_x(io_requestor_1_resp_bits_pte_x_STD), 
		.io_requestor_1_resp_bits_pte_w(io_requestor_1_resp_bits_pte_w_STD), 
		.io_requestor_1_resp_bits_pte_r(io_requestor_1_resp_bits_pte_r_STD), 
		.io_requestor_1_resp_bits_pte_v(io_requestor_1_resp_bits_pte_v_STD), 
		.io_requestor_1_ptbr_asid(io_requestor_1_ptbr_asid_STD), 
		.io_requestor_1_ptbr_ppn(io_requestor_1_ptbr_ppn_STD), 
		.io_requestor_1_invalidate(io_requestor_1_invalidate_STD), 
		.io_requestor_1_status_debug(io_requestor_1_status_debug_STD), 
		.io_requestor_1_status_isa(io_requestor_1_status_isa_STD), 
		.io_requestor_1_status_prv(io_requestor_1_status_prv_STD), 
		.io_requestor_1_status_sd(io_requestor_1_status_sd_STD), 
		.io_requestor_1_status_zero3(io_requestor_1_status_zero3_STD), 
		.io_requestor_1_status_sd_rv32(io_requestor_1_status_sd_rv32_STD), 
		.io_requestor_1_status_zero2(io_requestor_1_status_zero2_STD), 
		.io_requestor_1_status_vm(io_requestor_1_status_vm_STD), 
		.io_requestor_1_status_zero1(io_requestor_1_status_zero1_STD), 
		.io_requestor_1_status_mxr(io_requestor_1_status_mxr_STD), 
		.io_requestor_1_status_pum(io_requestor_1_status_pum_STD), 
		.io_requestor_1_status_mprv(io_requestor_1_status_mprv_STD), 
		.io_requestor_1_status_xs(io_requestor_1_status_xs_STD), 
		.io_requestor_1_status_fs(io_requestor_1_status_fs_STD), 
		.io_requestor_1_status_mpp(io_requestor_1_status_mpp_STD), 
		.io_requestor_1_status_hpp(io_requestor_1_status_hpp_STD), 
		.io_requestor_1_status_spp(io_requestor_1_status_spp_STD), 
		.io_requestor_1_status_mpie(io_requestor_1_status_mpie_STD), 
		.io_requestor_1_status_hpie(io_requestor_1_status_hpie_STD), 
		.io_requestor_1_status_spie(io_requestor_1_status_spie_STD), 
		.io_requestor_1_status_upie(io_requestor_1_status_upie_STD), 
		.io_requestor_1_status_mie(io_requestor_1_status_mie_STD), 
		.io_requestor_1_status_hie(io_requestor_1_status_hie_STD), 
		.io_requestor_1_status_sie(io_requestor_1_status_sie_STD), 
		.io_requestor_1_status_uie(io_requestor_1_status_uie_STD), 
		.io_mem_req_ready(io_mem_req_ready), 
		.io_mem_req_valid(io_mem_req_valid_STD), 
		.io_mem_req_bits_addr(io_mem_req_bits_addr_STD), 
		.io_mem_req_bits_tag(io_mem_req_bits_tag_STD), 
		.io_mem_req_bits_cmd(io_mem_req_bits_cmd_STD), 
		.io_mem_req_bits_typ(io_mem_req_bits_typ_STD), 
		.io_mem_req_bits_phys(io_mem_req_bits_phys_STD), 
		.io_mem_req_bits_data(io_mem_req_bits_data_STD), 
		.io_mem_s1_kill(io_mem_s1_kill_STD), 
		.io_mem_s1_data(io_mem_s1_data_STD), 
		.io_mem_s2_nack(io_mem_s2_nack), 
		.io_mem_resp_valid(io_mem_resp_valid), 
		.io_mem_resp_bits_data(io_mem_resp_bits_data), 
		.io_mem_xcpt_pf_ld(io_mem_xcpt_pf_ld), 
		.io_mem_xcpt_pf_st(io_mem_xcpt_pf_st), 
		.io_mem_invalidate_lr(io_mem_invalidate_lr_STD), 
		.io_dpath_ptbr_asid(io_dpath_ptbr_asid), 
		.io_dpath_ptbr_ppn(io_dpath_ptbr_ppn), 
		.io_dpath_invalidate(io_dpath_invalidate), 
		.io_dpath_status_debug(io_dpath_status_debug), 
		.io_dpath_status_isa(io_dpath_status_isa), 
		.io_dpath_status_prv(io_dpath_status_prv), 
		.io_dpath_status_sd(io_dpath_status_sd), 
		.io_dpath_status_zero3(io_dpath_status_zero3), 
		.io_dpath_status_sd_rv32(io_dpath_status_sd_rv32), 
		.io_dpath_status_zero2(io_dpath_status_zero2), 
		.io_dpath_status_vm(io_dpath_status_vm), 
		.io_dpath_status_zero1(io_dpath_status_zero1), 
		.io_dpath_status_mxr(io_dpath_status_mxr), 
		.io_dpath_status_pum(io_dpath_status_pum), 
		.io_dpath_status_mprv(io_dpath_status_mprv), 
		.io_dpath_status_xs(io_dpath_status_xs), 
		.io_dpath_status_fs(io_dpath_status_fs), 
		.io_dpath_status_mpp(io_dpath_status_mpp), 
		.io_dpath_status_hpp(io_dpath_status_hpp), 
		.io_dpath_status_spp(io_dpath_status_spp), 
		.io_dpath_status_mpie(io_dpath_status_mpie), 
		.io_dpath_status_hpie(io_dpath_status_hpie), 
		.io_dpath_status_spie(io_dpath_status_spie), 
		.io_dpath_status_upie(io_dpath_status_upie), 
		.io_dpath_status_mie(io_dpath_status_mie), 
		.io_dpath_status_hie(io_dpath_status_hie), 
		.io_dpath_status_sie(io_dpath_status_sie), 
		.io_dpath_status_uie(io_dpath_status_uie)
	);
endmodule

