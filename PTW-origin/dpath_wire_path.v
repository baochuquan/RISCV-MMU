module dpath_wire_path(
	input [6:0] io_dpath_ptbr_asid,
	input [37:0] io_dpath_ptbr_ppn,
	input io_dpath_invalidate,
	input io_dpath_status_debug,
	input [31:0] io_dpath_status_isa,
	input [1:0] io_dpath_status_prv,
	input io_dpath_status_sd,
	input [30:0] io_dpath_status_zero3,
	input io_dpath_status_sd_rv32,
	input [1:0] io_dpath_status_zero2,
	input [4:0] io_dpath_status_vm,
	input [3:0] io_dpath_status_zero1,
	input io_dpath_status_mxr,
	input io_dpath_status_pum,
	input io_dpath_status_mprv,
	input [1:0] io_dpath_status_xs,
	input [1:0] io_dpath_status_fs,
	input [1:0] io_dpath_status_mpp,
	input [1:0] io_dpath_status_hpp,
	input io_dpath_status_spp,
	input io_dpath_status_mpie,
	input io_dpath_status_hpie,
	input io_dpath_status_spie,
	input io_dpath_status_upie,
	input io_dpath_status_mie,
	input io_dpath_status_hie,
	input io_dpath_status_sie,
	input io_dpath_status_uie,

	output [6:0] io_requestor_0_ptbr_asid,
	output [37:0] io_requestor_0_ptbr_ppn,
	output io_requestor_0_invalidate,
	output io_requestor_0_status_debug,
	output [31:0] io_requestor_0_status_isa,
	output [1:0] io_requestor_0_status_prv,
	output io_requestor_0_status_sd,
	output [30:0] io_requestor_0_status_zero3,
	output io_requestor_0_status_sd_rv32,
	output [1:0] io_requestor_0_status_zero2,
	output [4:0] io_requestor_0_status_vm,
	output [3:0] io_requestor_0_status_zero1,
	output io_requestor_0_status_mxr,
	output io_requestor_0_status_pum,
	output io_requestor_0_status_mprv,
	output [1:0] io_requestor_0_status_xs,
	output [1:0] io_requestor_0_status_fs,
	output [1:0] io_requestor_0_status_mpp,
	output [1:0] io_requestor_0_status_hpp,
	output io_requestor_0_status_spp,
	output io_requestor_0_status_mpie,
	output io_requestor_0_status_hpie,
	output io_requestor_0_status_spie,
	output io_requestor_0_status_upie,
	output io_requestor_0_status_mie,
	output io_requestor_0_status_hie,
	output io_requestor_0_status_sie,
	output io_requestor_0_status_uie,

	output [6:0] io_requestor_1_ptbr_asid,
	output [37:0] io_requestor_1_ptbr_ppn,
	output io_requestor_1_invalidate,
	output io_requestor_1_status_debug,
	output [31:0] io_requestor_1_status_isa,
	output [1:0] io_requestor_1_status_prv,
	output io_requestor_1_status_sd,
	output [30:0] io_requestor_1_status_zero3,
	output io_requestor_1_status_sd_rv32,
	output [1:0] io_requestor_1_status_zero2,
	output [4:0] io_requestor_1_status_vm,
	output [3:0] io_requestor_1_status_zero1,
	output io_requestor_1_status_mxr,
	output io_requestor_1_status_pum,
	output io_requestor_1_status_mprv,
	output [1:0] io_requestor_1_status_xs,
	output [1:0] io_requestor_1_status_fs,
	output [1:0] io_requestor_1_status_mpp,
	output [1:0] io_requestor_1_status_hpp,
	output io_requestor_1_status_spp,
	output io_requestor_1_status_mpie,
	output io_requestor_1_status_hpie,
	output io_requestor_1_status_spie,
	output io_requestor_1_status_upie,
	output io_requestor_1_status_mie,
	output io_requestor_1_status_hie,
	output io_requestor_1_status_sie,
	output io_requestor_1_status_uie
	);

	assign io_requestor_0_ptbr_asid 		= io_dpath_ptbr_asid; 
	assign io_requestor_0_ptbr_ppn 			= io_dpath_ptbr_ppn;
	assign io_requestor_0_invalidate 		= io_dpath_invalidate;
	assign io_requestor_0_status_debug 		= io_dpath_status_debug;
	assign io_requestor_0_status_isa 		= io_dpath_status_isa;
	assign io_requestor_0_status_prv 		= io_dpath_status_prv;
	assign io_requestor_0_status_sd 		= io_dpath_status_sd;
	assign io_requestor_0_status_zero3 		= io_dpath_status_zero3;
	assign io_requestor_0_status_sd_rv32 	= io_dpath_status_sd_rv32;
	assign io_requestor_0_status_zero2 		= io_dpath_status_zero2;
	assign io_requestor_0_status_vm 		= io_dpath_status_vm;
	assign io_requestor_0_status_zero1 		= io_dpath_status_zero1;
	assign io_requestor_0_status_mxr 		= io_dpath_status_mxr;
	assign io_requestor_0_status_pum 		= io_dpath_status_pum;
	assign io_requestor_0_status_mprv 		= io_dpath_status_mprv;
	assign io_requestor_0_status_xs 		= io_dpath_status_xs;
	assign io_requestor_0_status_fs 		= io_dpath_status_fs;
	assign io_requestor_0_status_mpp 		= io_dpath_status_mpp;
	assign io_requestor_0_status_hpp 		= io_dpath_status_hpp;
	assign io_requestor_0_status_spp 		= io_dpath_status_spp;
	assign io_requestor_0_status_mpie 		= io_dpath_status_mpie;
	assign io_requestor_0_status_hpie 		= io_dpath_status_hpie;
	assign io_requestor_0_status_spie 		= io_dpath_status_spie;
	assign io_requestor_0_status_upie 		= io_dpath_status_upie;
	assign io_requestor_0_status_mie 		= io_dpath_status_mie;
	assign io_requestor_0_status_hie 		= io_dpath_status_hie;
	assign io_requestor_0_status_sie 		= io_dpath_status_sie;
	assign io_requestor_0_status_uie 		= io_dpath_status_uie;

	assign io_requestor_1_ptbr_asid 		= io_dpath_ptbr_asid; 
	assign io_requestor_1_ptbr_ppn 			= io_dpath_ptbr_ppn;
	assign io_requestor_1_invalidate 		= io_dpath_invalidate;
	assign io_requestor_1_status_debug 		= io_dpath_status_debug;
	assign io_requestor_1_status_isa 		= io_dpath_status_isa;
	assign io_requestor_1_status_prv 		= io_dpath_status_prv;
	assign io_requestor_1_status_sd 		= io_dpath_status_sd;
	assign io_requestor_1_status_zero3 		= io_dpath_status_zero3;
	assign io_requestor_1_status_sd_rv32 	= io_dpath_status_sd_rv32;
	assign io_requestor_1_status_zero2 		= io_dpath_status_zero2;
	assign io_requestor_1_status_vm 		= io_dpath_status_vm;
	assign io_requestor_1_status_zero1 		= io_dpath_status_zero1;
	assign io_requestor_1_status_mxr 		= io_dpath_status_mxr;
	assign io_requestor_1_status_pum 		= io_dpath_status_pum;
	assign io_requestor_1_status_mprv 		= io_dpath_status_mprv;
	assign io_requestor_1_status_xs 		= io_dpath_status_xs;
	assign io_requestor_1_status_fs 		= io_dpath_status_fs;
	assign io_requestor_1_status_mpp 		= io_dpath_status_mpp;
	assign io_requestor_1_status_hpp 		= io_dpath_status_hpp;
	assign io_requestor_1_status_spp 		= io_dpath_status_spp;
	assign io_requestor_1_status_mpie 		= io_dpath_status_mpie;
	assign io_requestor_1_status_hpie 		= io_dpath_status_hpie;
	assign io_requestor_1_status_spie 		= io_dpath_status_spie;
	assign io_requestor_1_status_upie 		= io_dpath_status_upie;
	assign io_requestor_1_status_mie 		= io_dpath_status_mie;
	assign io_requestor_1_status_hie 		= io_dpath_status_hie;
	assign io_requestor_1_status_sie 		= io_dpath_status_sie;
	assign io_requestor_1_status_uie 		= io_dpath_status_uie;
	 
endmodule
