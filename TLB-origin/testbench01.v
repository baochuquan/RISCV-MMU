`timescale 1ns / 1ps
`define timeslice 200
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:39 01/06/2017
// Design Name:   TLB
// Module Name:   C:/Users/baochuquan/Desktop/RISCV-Verilog/TLB02/TLB-test01/testbench01.v
// Project Name:  TLB-test01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TLB
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
	reg io_req_valid;
	reg [27:0] io_req_bits_vpn;
	reg io_req_bits_passthrough;
	reg io_req_bits_instruction;
	reg io_req_bits_store;
	reg io_ptw_req_ready;
	reg io_ptw_resp_valid;
	/*** 64bit PTE ***/
	reg [15:0] io_ptw_resp_bits_pte_reserved_for_hardware;
	reg [37:0] io_ptw_resp_bits_pte_ppn;
	reg [1:0] io_ptw_resp_bits_pte_reserved_for_software;
	reg io_ptw_resp_bits_pte_d;
	reg io_ptw_resp_bits_pte_a;
	reg io_ptw_resp_bits_pte_g;
	reg io_ptw_resp_bits_pte_u;
	reg io_ptw_resp_bits_pte_x;
	reg io_ptw_resp_bits_pte_w;
	reg io_ptw_resp_bits_pte_r;
	reg io_ptw_resp_bits_pte_v;

	reg [6:0] io_ptw_ptbr_asid;
	reg [37:0] io_ptw_ptbr_ppn;
	reg io_ptw_invalidate;
	reg io_ptw_status_debug;
	reg [31:0] io_ptw_status_isa;
	reg [1:0] io_ptw_status_prv;
	/*** 64bit MSTATUS ***/
	reg io_ptw_status_sd;
	reg [30:0] io_ptw_status_zero3;
	reg io_ptw_status_sd_rv32;
	reg [1:0] io_ptw_status_zero2;
	reg [4:0] io_ptw_status_vm;
	reg [3:0] io_ptw_status_zero1;
	reg io_ptw_status_mxr;
	reg io_ptw_status_pum;
	reg io_ptw_status_mprv;
	reg [1:0] io_ptw_status_xs;
	reg [1:0] io_ptw_status_fs;
	reg [1:0] io_ptw_status_mpp;
	reg [1:0] io_ptw_status_hpp;
	reg io_ptw_status_spp;
	reg io_ptw_status_mpie;
	reg io_ptw_status_hpie;
	reg io_ptw_status_spie;
	reg io_ptw_status_upie;
	reg io_ptw_status_mie;
	reg io_ptw_status_hie;
	reg io_ptw_status_sie; 
	reg io_ptw_status_uie;
	
	// ***********Outputs************ 
	// for DUT
	wire io_req_ready_DUT;
	wire io_resp_miss_DUT;
	wire [19:0] io_resp_ppn_DUT;
	wire io_resp_xcpt_ld_DUT;
	wire io_resp_xcpt_st_DUT;
	wire io_resp_xcpt_if_DUT;
	wire io_resp_cacheable_DUT;
	wire io_ptw_req_valid_DUT;
	wire [1:0] io_ptw_req_bits_prv_DUT;
	wire io_ptw_req_bits_pum_DUT;
	wire io_ptw_req_bits_mxr_DUT;
	wire [26:0] io_ptw_req_bits_addr_DUT;
	wire io_ptw_req_bits_store_DUT;
	wire io_ptw_req_bits_fetch_DUT;

	// for STD
	wire io_req_ready_STD;
	wire io_resp_miss_STD;
	wire [19:0] io_resp_ppn_STD;
	wire io_resp_xcpt_ld_STD;
	wire io_resp_xcpt_st_STD;
	wire io_resp_xcpt_if_STD;
	wire io_resp_cacheable_STD;
	wire io_ptw_req_valid_STD;
	wire [1:0] io_ptw_req_bits_prv_STD;
	wire io_ptw_req_bits_pum_STD;
	wire io_ptw_req_bits_mxr_STD;
	wire [26:0] io_ptw_req_bits_addr_STD;
	wire io_ptw_req_bits_store_STD;
	wire io_ptw_req_bits_fetch_STD;
	
	integer i;
	parameter test_number01 = 16;
	parameter test_number02 = 12;

	reg [27:0] vpn[11:0]; 

	reg [7:0] Mem[127:0]; // simulate Page Mem
	reg [63:0] PTEdata[11:0]; // translate Mem to PTEMem

	//-------clock-------
	always #(`timeslice/2)  begin
		clock = ~clock;
	end

	// initial mem
	initial begin
		$readmemh("./pte_data01.dat", Mem);
		$readmemh("./pte_addr01.dat", vpn);
	end

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		initialization;
		// Wait 100 ns for global reset to finish
		#200;      
		$display("=====Test Begin=====");
		reset = 0;

		// testbench02 : 
		// load PTE
		for(i = 0; i < test_number02 * 8; i = i + 1) begin
			PTEdata[i/8] = (PTEdata[i/8] << 8) | Mem[i];
		end
		for(i = 0; i < test_number02; i = i + 1) begin
			testbench_v_p_translate_regular(vpn[i]);
			compare_results;
		end

		/*
		// testbench01 : testbench_v_p_translate_random
		for(i = 0; i < test_number01; i = i + 1) begin
			testbench_v_p_translate_random;
			compare_results;
		end
		*/

		$display("=====Test End=====");
	end
    
    task initialization;
    	begin
			io_req_valid 			= 0;
			io_req_bits_vpn 		= 0;
			io_req_bits_passthrough = 0;
			io_req_bits_instruction = 0;
			io_req_bits_store 		= 0;
			io_ptw_req_ready 	= 0;
			io_ptw_ptbr_asid 	= 0;
			io_ptw_ptbr_ppn 	= 0;
			io_ptw_invalidate 	= 0;
			io_ptw_status_debug = 0;
			io_ptw_status_isa 	= 0;
			io_ptw_status_prv 	= 0;
			// set MSTATUS
			io_ptw_status_sd 		= 0;
			io_ptw_status_zero3 	= 0;//30:0
			io_ptw_status_sd_rv32 	= 0;
			io_ptw_status_zero2 	= 0;//1:0
			io_ptw_status_vm 		= 0;//4:0
			io_ptw_status_zero1 	= 0;//3:0
			io_ptw_status_mxr 		= 0;
			io_ptw_status_pum 		= 0;
			io_ptw_status_mprv 		= 0;
			io_ptw_status_xs 		= 0;//1:0
			io_ptw_status_fs 		= 0;//1:0
			io_ptw_status_mpp 		= 0;//1:0
			io_ptw_status_hpp 		= 0;//1:0
			io_ptw_status_spp 		= 0;
			io_ptw_status_mpie 		= 0;
			io_ptw_status_hpie 		= 0;
			io_ptw_status_spie 		= 0;
			io_ptw_status_upie 		= 0;
			io_ptw_status_mie 		= 0;
			io_ptw_status_hie 		= 0;
			io_ptw_status_sie 		= 0;
			io_ptw_status_uie 		= 0;

			// set PTE bits
			io_ptw_resp_bits_pte_reserved_for_hardware 	= 0;// 15:0
			io_ptw_resp_bits_pte_ppn 					= 0;//37:0
			io_ptw_resp_bits_pte_reserved_for_software 	= 0;//1:0
			io_ptw_resp_bits_pte_d 						= 0;
			io_ptw_resp_bits_pte_a 						= 0;
			io_ptw_resp_bits_pte_g 						= 0;
			io_ptw_resp_bits_pte_u 						= 0;
			io_ptw_resp_bits_pte_x 						= 0;
			io_ptw_resp_bits_pte_w 						= 0;
			io_ptw_resp_bits_pte_r 						= 0;
			io_ptw_resp_bits_pte_v 						= 0;		

			io_ptw_resp_valid 	= 0;
		end
	endtask

	/********************testbench02 ********************/
	// test TLB with all the input ports set specific values
	/****************************************************/	
	task testbench_v_p_translate_regular;
		input [27:0] vpn_item;
		begin
			subtask_io_req_bits(vpn_item, 0, 1, 0); // [27:0]vpn, passthrough, instruction, store
			subtask_io_ptbr_bits;
			io_ptw_invalidate = 0; 
			subtask_io_status_bits(0, 2'h1, 1, 1, 1, 1, 2'h1); // debug, [1:0]prv, vm_3, mxr, pum, mprv, [1:0]mpp

			// io_req_ready = 1;
			#400;
			// state => s_request
			io_req_valid = 1;

			#400;
			// state => s_wait
			io_ptw_req_ready = 1;

			#400;
			subtask_io_resp_bits(0, 1, 1, 1, 1, 1, 1, 1); // d=0, a=1, g=1, u=1, x=1, w=1, r=1, v=1

			#400;
			io_ptw_resp_valid = 1;

			#200;
			// reset
			io_req_valid = 0;
			io_ptw_req_ready = 0;
			io_ptw_resp_valid = 0;

		end
	endtask

	task subtask_io_req_bits;
		input [27:0] vpn;
		input passthrough;
		input instruction;
		input store;
		begin
			io_req_bits_vpn = vpn;
			io_req_bits_passthrough = passthrough;
			io_req_bits_instruction = instruction;
			io_req_bits_store = store;
		end
	endtask

	task subtask_io_ptbr_bits;
		begin
			io_ptw_ptbr_asid = 7'h75; // can be a random or specific num
			io_ptw_ptbr_ppn  = $random; // can be a random or specific num
		end
	endtask

	task subtask_io_status_bits;
		input debug;
		input [1:0] prv;
		input vm_3;
		input mxr;
		input pum;
		input mprv;
		input [1:0] mpp;
		begin
			io_ptw_status_debug = debug;
			io_ptw_status_isa 	= $random;
			io_ptw_status_prv 	= prv;
			// set MSTATUS
			io_ptw_status_sd 		= $random;
			io_ptw_status_zero3 	= $random;//30:0
			io_ptw_status_sd_rv32 	= $random;
			io_ptw_status_zero2 	= $random;//1:0
			io_ptw_status_vm 		= vm_3 == 0 ? ($random & 5'h17) : ($random | 5'h08);//4:0
			io_ptw_status_zero1 	= $random;//3:0
			io_ptw_status_mxr 		= mxr;
			io_ptw_status_pum 		= pum;
			io_ptw_status_mprv 		= mprv;
			io_ptw_status_xs 		= $random;//1:0
			io_ptw_status_fs 		= $random;//1:0
			io_ptw_status_mpp 		= mpp;//1:0
			io_ptw_status_hpp 		= $random;//1:0
			io_ptw_status_spp 		= $random;
			io_ptw_status_mpie 		= $random;
			io_ptw_status_hpie 		= $random;
			io_ptw_status_spie 		= $random;
			io_ptw_status_upie 		= $random;
			io_ptw_status_mie 		= $random;
			io_ptw_status_hie 		= $random;
			io_ptw_status_sie 		= $random;
			io_ptw_status_uie 		= $random;
		end
	endtask 

	task subtask_io_resp_bits;
		input d, a, g, u, x, w, r, v;
		begin
			io_ptw_resp_bits_pte_reserved_for_hardware 	= $random;// 15:0
			io_ptw_resp_bits_pte_ppn 					= $random;//37:0
			io_ptw_resp_bits_pte_reserved_for_software 	= $random;//1:0
			io_ptw_resp_bits_pte_d 						= d;
			io_ptw_resp_bits_pte_a 						= a;
			io_ptw_resp_bits_pte_g 						= g;
			io_ptw_resp_bits_pte_u 						= u;
			io_ptw_resp_bits_pte_x 						= x;
			io_ptw_resp_bits_pte_w 						= w;
			io_ptw_resp_bits_pte_r 						= r;
			io_ptw_resp_bits_pte_v 						= v;
		end
	endtask

	/********************testbench01 ********************/
	// test TLB with all the input ports set random values
	/****************************************************/
	task testbench_v_p_translate_random;
		begin
			io_req_valid 			= $random;
			io_req_bits_vpn 		= $random;
			io_req_bits_passthrough = $random;
			io_req_bits_instruction = $random;
			io_req_bits_store 		= $random;
			io_ptw_req_ready 	= $random;
			io_ptw_ptbr_asid 	= $random;
			io_ptw_ptbr_ppn 	= $random;
			io_ptw_invalidate 	= $random;
			io_ptw_status_debug = $random;
			io_ptw_status_isa 	= $random;
			io_ptw_status_prv 	= $random;
			// set MSTATUS
			io_ptw_status_sd 		= $random;
			io_ptw_status_zero3 	= $random;//30:0
			io_ptw_status_sd_rv32 	= $random;
			io_ptw_status_zero2 	= $random;//1:0
			io_ptw_status_vm 		= $random;//4:0
			io_ptw_status_zero1 	= $random;//3:0
			io_ptw_status_mxr 		= $random;
			io_ptw_status_pum 		= $random;
			io_ptw_status_mprv 		= $random;
			io_ptw_status_xs 		= $random;//1:0
			io_ptw_status_fs 		= $random;//1:0
			io_ptw_status_mpp 		= $random;//1:0
			io_ptw_status_hpp 		= $random;//1:0
			io_ptw_status_spp 		= $random;
			io_ptw_status_mpie 		= $random;
			io_ptw_status_hpie 		= $random;
			io_ptw_status_spie 		= $random;
			io_ptw_status_upie 		= $random;
			io_ptw_status_mie 		= $random;
			io_ptw_status_hie 		= $random;
			io_ptw_status_sie 		= $random;
			io_ptw_status_uie 		= $random;

			// set PTE bits
			io_ptw_resp_bits_pte_reserved_for_hardware 	= $random;// 15:0
			io_ptw_resp_bits_pte_ppn 					= $random;//37:0
			io_ptw_resp_bits_pte_reserved_for_software 	= $random;//1:0
			io_ptw_resp_bits_pte_d 						= $random;
			io_ptw_resp_bits_pte_a 						= $random;
			io_ptw_resp_bits_pte_g 						= $random;
			io_ptw_resp_bits_pte_u 						= $random;
			io_ptw_resp_bits_pte_x 						= $random;
			io_ptw_resp_bits_pte_w 						= $random;
			io_ptw_resp_bits_pte_r 						= $random;
			io_ptw_resp_bits_pte_v 						= $random;
			
			# 200;
			io_ptw_resp_valid 	= $random;
		end
	endtask

	/******************analysis result ******************/
	// compare the results of TLB and standard-TLB
	/****************************************************/
	task compare_results;
		begin
			$display("-------------compare_results--------------");
			if( io_req_ready_DUT == io_req_ready_STD ) begin
				$display("io_req_ready  **RIGHT**");
			end else begin
				$display("io_req_ready  ##ERROR##");
			end

			$display(" ");

			if( io_resp_miss_DUT == io_resp_miss_STD ) begin
				$display("io_resp_miss      **RIGHT**");
			end else begin
				$display("io_resp_miss      ##ERROR##");
			end
			if( io_resp_ppn_DUT == io_resp_ppn_STD) begin
				$display("io_resp_ppn       **RIGHT**");
			end else begin
				$display("io_resp_ppn       ##ERROR##");
			end

			if( io_resp_xcpt_ld_DUT == io_resp_xcpt_ld_STD) begin
				$display("io_resp_xcpt_ld   **RIGHT**");
			end else begin
				$display("io_resp_xcpt_ld   ##ERROR##");
			end 
			if( io_resp_xcpt_st_DUT == io_resp_xcpt_st_STD) begin
				$display("io_resp_xcpt_st   **RIGHT**");
			end else begin
				$display("io_resp_xcpt_st   ##ERROR##");
			end
			if( io_resp_xcpt_if_DUT == io_resp_xcpt_if_STD) begin
				$display("io_resp_xcpt_if   **RIGHT**");
			end else begin
				$display("io_resp_xcpt_if   ##ERROR##");
			end

			if( io_resp_cacheable_DUT == io_resp_cacheable_STD ) begin
				$display("io_resp_cacheable **RIGHT**");
			end else begin
				$display("io_resp_cacheable ##ERROR##");
			end

			$display(" ");

			if( io_ptw_req_valid_DUT == io_ptw_req_valid_STD ) begin
				$display("io_ptw_req_valid      **RIGHT**");
			end else begin
				$display("io_ptw_req_valid      ##ERROR##");
			end
			if( io_ptw_req_bits_prv_DUT == io_ptw_req_bits_prv_STD ) begin
				$display("io_ptw_req_bits_prv   **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_prv   ##ERROR##");
			end
			if( io_ptw_req_bits_pum_DUT == io_ptw_req_bits_pum_STD) begin
				$display("io_ptw_req_bits_pum   **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_pum   ##ERROR##");
			end
			if( io_ptw_req_bits_mxr_DUT == io_ptw_req_bits_mxr_STD) begin
				$display("io_ptw_req_bits_mxr   **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_mxr   ##ERROR##");
			end
			if( io_ptw_req_bits_addr_DUT == io_ptw_req_bits_addr_STD ) begin
				$display("io_ptw_req_bits_addr  **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_addr  ##ERROR##");
			end
			if( io_ptw_req_bits_store_DUT == io_ptw_req_bits_store_STD ) begin
				$display("io_ptw_req_bits_store **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_store ##ERROR##");
			end
			if( io_ptw_req_bits_fetch_DUT == io_ptw_req_bits_fetch_STD ) begin
				$display("io_ptw_req_bits_fetch **RIGHT**");
			end else begin
				$display("io_ptw_req_bits_fetch ##ERROR##");
			end
			$display("------------------------------------------");
		end
	endtask

	// Instantiate the Unit Under Test (UUT)
	TLB uutDUT (
		.clock(clock), 
		.reset(reset), 
		.io_req_ready(io_req_ready_DUT), 
		.io_req_valid(io_req_valid), 
		.io_req_bits_vpn(io_req_bits_vpn), 
		.io_req_bits_passthrough(io_req_bits_passthrough), 
		.io_req_bits_instruction(io_req_bits_instruction), 
		.io_req_bits_store(io_req_bits_store), 
		.io_resp_miss(io_resp_miss_DUT), 
		.io_resp_ppn(io_resp_ppn_DUT), 
		.io_resp_xcpt_ld(io_resp_xcpt_ld_DUT), 
		.io_resp_xcpt_st(io_resp_xcpt_st_DUT), 
		.io_resp_xcpt_if(io_resp_xcpt_if_DUT), 
		.io_resp_cacheable(io_resp_cacheable_DUT), 
		.io_ptw_req_ready(io_ptw_req_ready), 
		.io_ptw_req_valid(io_ptw_req_valid_DUT), 
		.io_ptw_req_bits_prv(io_ptw_req_bits_prv_DUT), 
		.io_ptw_req_bits_pum(io_ptw_req_bits_pum_DUT), 
		.io_ptw_req_bits_mxr(io_ptw_req_bits_mxr_DUT), 
		.io_ptw_req_bits_addr(io_ptw_req_bits_addr_DUT), 
		.io_ptw_req_bits_store(io_ptw_req_bits_store_DUT), 
		.io_ptw_req_bits_fetch(io_ptw_req_bits_fetch_DUT), 
		.io_ptw_resp_valid(io_ptw_resp_valid), 
		.io_ptw_resp_bits_pte_reserved_for_hardware(io_ptw_resp_bits_pte_reserved_for_hardware), 
		.io_ptw_resp_bits_pte_ppn(io_ptw_resp_bits_pte_ppn), 
		.io_ptw_resp_bits_pte_reserved_for_software(io_ptw_resp_bits_pte_reserved_for_software), 
		.io_ptw_resp_bits_pte_d(io_ptw_resp_bits_pte_d), 
		.io_ptw_resp_bits_pte_a(io_ptw_resp_bits_pte_a), 
		.io_ptw_resp_bits_pte_g(io_ptw_resp_bits_pte_g), 
		.io_ptw_resp_bits_pte_u(io_ptw_resp_bits_pte_u), 
		.io_ptw_resp_bits_pte_x(io_ptw_resp_bits_pte_x), 
		.io_ptw_resp_bits_pte_w(io_ptw_resp_bits_pte_w), 
		.io_ptw_resp_bits_pte_r(io_ptw_resp_bits_pte_r), 
		.io_ptw_resp_bits_pte_v(io_ptw_resp_bits_pte_v), 
		.io_ptw_ptbr_asid(io_ptw_ptbr_asid), 
		.io_ptw_ptbr_ppn(io_ptw_ptbr_ppn), 
		.io_ptw_invalidate(io_ptw_invalidate), 
		.io_ptw_status_debug(io_ptw_status_debug), 
		.io_ptw_status_isa(io_ptw_status_isa), 
		.io_ptw_status_prv(io_ptw_status_prv), 
		.io_ptw_status_sd(io_ptw_status_sd), 
		.io_ptw_status_zero3(io_ptw_status_zero3), 
		.io_ptw_status_sd_rv32(io_ptw_status_sd_rv32), 
		.io_ptw_status_zero2(io_ptw_status_zero2), 
		.io_ptw_status_vm(io_ptw_status_vm), 
		.io_ptw_status_zero1(io_ptw_status_zero1), 
		.io_ptw_status_mxr(io_ptw_status_mxr), 
		.io_ptw_status_pum(io_ptw_status_pum), 
		.io_ptw_status_mprv(io_ptw_status_mprv), 
		.io_ptw_status_xs(io_ptw_status_xs), 
		.io_ptw_status_fs(io_ptw_status_fs), 
		.io_ptw_status_mpp(io_ptw_status_mpp), 
		.io_ptw_status_hpp(io_ptw_status_hpp), 
		.io_ptw_status_spp(io_ptw_status_spp), 
		.io_ptw_status_mpie(io_ptw_status_mpie), 
		.io_ptw_status_hpie(io_ptw_status_hpie), 
		.io_ptw_status_spie(io_ptw_status_spie), 
		.io_ptw_status_upie(io_ptw_status_upie), 
		.io_ptw_status_mie(io_ptw_status_mie), 
		.io_ptw_status_hie(io_ptw_status_hie), 
		.io_ptw_status_sie(io_ptw_status_sie), 
		.io_ptw_status_uie(io_ptw_status_uie)
	);
	standard_TLB uutSTD (
		.clock(clock), 
		.reset(reset), 
		.io_req_ready(io_req_ready_STD), 
		.io_req_valid(io_req_valid), 
		.io_req_bits_vpn(io_req_bits_vpn), 
		.io_req_bits_passthrough(io_req_bits_passthrough), 
		.io_req_bits_instruction(io_req_bits_instruction), 
		.io_req_bits_store(io_req_bits_store), 
		.io_resp_miss(io_resp_miss_STD), 
		.io_resp_ppn(io_resp_ppn_STD), 
		.io_resp_xcpt_ld(io_resp_xcpt_ld_STD), 
		.io_resp_xcpt_st(io_resp_xcpt_st_STD), 
		.io_resp_xcpt_if(io_resp_xcpt_if_STD), 
		.io_resp_cacheable(io_resp_cacheable_STD), 
		.io_ptw_req_ready(io_ptw_req_ready), 
		.io_ptw_req_valid(io_ptw_req_valid_STD), 
		.io_ptw_req_bits_prv(io_ptw_req_bits_prv_STD), 
		.io_ptw_req_bits_pum(io_ptw_req_bits_pum_STD), 
		.io_ptw_req_bits_mxr(io_ptw_req_bits_mxr_STD), 
		.io_ptw_req_bits_addr(io_ptw_req_bits_addr_STD), 
		.io_ptw_req_bits_store(io_ptw_req_bits_store_STD), 
		.io_ptw_req_bits_fetch(io_ptw_req_bits_fetch_STD), 
		.io_ptw_resp_valid(io_ptw_resp_valid), 
		.io_ptw_resp_bits_pte_reserved_for_hardware(io_ptw_resp_bits_pte_reserved_for_hardware), 
		.io_ptw_resp_bits_pte_ppn(io_ptw_resp_bits_pte_ppn), 
		.io_ptw_resp_bits_pte_reserved_for_software(io_ptw_resp_bits_pte_reserved_for_software), 
		.io_ptw_resp_bits_pte_d(io_ptw_resp_bits_pte_d), 
		.io_ptw_resp_bits_pte_a(io_ptw_resp_bits_pte_a), 
		.io_ptw_resp_bits_pte_g(io_ptw_resp_bits_pte_g), 
		.io_ptw_resp_bits_pte_u(io_ptw_resp_bits_pte_u), 
		.io_ptw_resp_bits_pte_x(io_ptw_resp_bits_pte_x), 
		.io_ptw_resp_bits_pte_w(io_ptw_resp_bits_pte_w), 
		.io_ptw_resp_bits_pte_r(io_ptw_resp_bits_pte_r), 
		.io_ptw_resp_bits_pte_v(io_ptw_resp_bits_pte_v), 
		.io_ptw_ptbr_asid(io_ptw_ptbr_asid), 
		.io_ptw_ptbr_ppn(io_ptw_ptbr_ppn), 
		.io_ptw_invalidate(io_ptw_invalidate), 
		.io_ptw_status_debug(io_ptw_status_debug), 
		.io_ptw_status_isa(io_ptw_status_isa), 
		.io_ptw_status_prv(io_ptw_status_prv), 
		.io_ptw_status_sd(io_ptw_status_sd), 
		.io_ptw_status_zero3(io_ptw_status_zero3), 
		.io_ptw_status_sd_rv32(io_ptw_status_sd_rv32), 
		.io_ptw_status_zero2(io_ptw_status_zero2), 
		.io_ptw_status_vm(io_ptw_status_vm), 
		.io_ptw_status_zero1(io_ptw_status_zero1), 
		.io_ptw_status_mxr(io_ptw_status_mxr), 
		.io_ptw_status_pum(io_ptw_status_pum), 
		.io_ptw_status_mprv(io_ptw_status_mprv), 
		.io_ptw_status_xs(io_ptw_status_xs), 
		.io_ptw_status_fs(io_ptw_status_fs), 
		.io_ptw_status_mpp(io_ptw_status_mpp), 
		.io_ptw_status_hpp(io_ptw_status_hpp), 
		.io_ptw_status_spp(io_ptw_status_spp), 
		.io_ptw_status_mpie(io_ptw_status_mpie), 
		.io_ptw_status_hpie(io_ptw_status_hpie), 
		.io_ptw_status_spie(io_ptw_status_spie), 
		.io_ptw_status_upie(io_ptw_status_upie), 
		.io_ptw_status_mie(io_ptw_status_mie), 
		.io_ptw_status_hie(io_ptw_status_hie), 
		.io_ptw_status_sie(io_ptw_status_sie), 
		.io_ptw_status_uie(io_ptw_status_uie)
	);
endmodule

