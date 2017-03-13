module PTW(
  input   clock,
  input   reset,

  output  io_requestor_0_req_ready,
  input   io_requestor_0_req_valid,
  input  [1:0] io_requestor_0_req_bits_prv,
  input   io_requestor_0_req_bits_pum,
  input   io_requestor_0_req_bits_mxr,
  input  [26:0] io_requestor_0_req_bits_addr,
  input   io_requestor_0_req_bits_store,
  input   io_requestor_0_req_bits_fetch,
  output  io_requestor_0_resp_valid,
  output [15:0] io_requestor_0_resp_bits_pte_reserved_for_hardware,
  output [37:0] io_requestor_0_resp_bits_pte_ppn,
  output [1:0] io_requestor_0_resp_bits_pte_reserved_for_software,
  output  io_requestor_0_resp_bits_pte_d,
  output  io_requestor_0_resp_bits_pte_a,
  output  io_requestor_0_resp_bits_pte_g,
  output  io_requestor_0_resp_bits_pte_u,
  output  io_requestor_0_resp_bits_pte_x,
  output  io_requestor_0_resp_bits_pte_w,
  output  io_requestor_0_resp_bits_pte_r,
  output  io_requestor_0_resp_bits_pte_v,
  output [6:0] io_requestor_0_ptbr_asid,
  output [37:0] io_requestor_0_ptbr_ppn,
  output  io_requestor_0_invalidate,
  output  io_requestor_0_status_debug,
  output [31:0] io_requestor_0_status_isa,
  output [1:0] io_requestor_0_status_prv,
  output  io_requestor_0_status_sd,
  output [30:0] io_requestor_0_status_zero3,
  output  io_requestor_0_status_sd_rv32,
  output [1:0] io_requestor_0_status_zero2,
  output [4:0] io_requestor_0_status_vm,
  output [3:0] io_requestor_0_status_zero1,
  output  io_requestor_0_status_mxr,
  output  io_requestor_0_status_pum,
  output  io_requestor_0_status_mprv,
  output [1:0] io_requestor_0_status_xs,
  output [1:0] io_requestor_0_status_fs,
  output [1:0] io_requestor_0_status_mpp,
  output [1:0] io_requestor_0_status_hpp,
  output  io_requestor_0_status_spp,
  output  io_requestor_0_status_mpie,
  output  io_requestor_0_status_hpie,
  output  io_requestor_0_status_spie,
  output  io_requestor_0_status_upie,
  output  io_requestor_0_status_mie,
  output  io_requestor_0_status_hie,
  output  io_requestor_0_status_sie,
  output  io_requestor_0_status_uie,

  output  io_requestor_1_req_ready,
  input   io_requestor_1_req_valid,
  input  [1:0] io_requestor_1_req_bits_prv,
  input   io_requestor_1_req_bits_pum,
  input   io_requestor_1_req_bits_mxr,
  input  [26:0] io_requestor_1_req_bits_addr,
  input   io_requestor_1_req_bits_store,
  input   io_requestor_1_req_bits_fetch,
  output  io_requestor_1_resp_valid,
  output [15:0] io_requestor_1_resp_bits_pte_reserved_for_hardware,
  output [37:0] io_requestor_1_resp_bits_pte_ppn,
  output [1:0] io_requestor_1_resp_bits_pte_reserved_for_software,
  output  io_requestor_1_resp_bits_pte_d,
  output  io_requestor_1_resp_bits_pte_a,
  output  io_requestor_1_resp_bits_pte_g,
  output  io_requestor_1_resp_bits_pte_u,
  output  io_requestor_1_resp_bits_pte_x,
  output  io_requestor_1_resp_bits_pte_w,
  output  io_requestor_1_resp_bits_pte_r,
  output  io_requestor_1_resp_bits_pte_v,
  output [6:0] io_requestor_1_ptbr_asid,
  output [37:0] io_requestor_1_ptbr_ppn,
  output  io_requestor_1_invalidate,
  output  io_requestor_1_status_debug,
  output [31:0] io_requestor_1_status_isa,
  output [1:0] io_requestor_1_status_prv,
  output  io_requestor_1_status_sd,
  output [30:0] io_requestor_1_status_zero3,
  output  io_requestor_1_status_sd_rv32,
  output [1:0] io_requestor_1_status_zero2,
  output [4:0] io_requestor_1_status_vm,
  output [3:0] io_requestor_1_status_zero1,
  output  io_requestor_1_status_mxr,
  output  io_requestor_1_status_pum,
  output  io_requestor_1_status_mprv,
  output [1:0] io_requestor_1_status_xs,
  output [1:0] io_requestor_1_status_fs,
  output [1:0] io_requestor_1_status_mpp,
  output [1:0] io_requestor_1_status_hpp,
  output  io_requestor_1_status_spp,
  output  io_requestor_1_status_mpie,
  output  io_requestor_1_status_hpie,
  output  io_requestor_1_status_spie,
  output  io_requestor_1_status_upie,
  output  io_requestor_1_status_mie,
  output  io_requestor_1_status_hie,
  output  io_requestor_1_status_sie,
  output  io_requestor_1_status_uie,

  input   io_mem_req_ready,
  output  io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output [6:0] io_mem_req_bits_tag,
  output [4:0] io_mem_req_bits_cmd,
  output [2:0] io_mem_req_bits_typ,
  output  io_mem_req_bits_phys,
  output [63:0] io_mem_req_bits_data,
  output  io_mem_s1_kill,
  output [63:0] io_mem_s1_data,
  input   io_mem_s2_nack,
  input   io_mem_resp_valid,/*
  input  [39:0] io_mem_resp_bits_addr,
  input  [6:0] io_mem_resp_bits_tag,
  input  [4:0] io_mem_resp_bits_cmd,
  input  [2:0] io_mem_resp_bits_typ,*/
  input  [63:0] io_mem_resp_bits_data,/*
  input   io_mem_resp_bits_replay,
  input   io_mem_resp_bits_has_data,
  input  [63:0] io_mem_resp_bits_data_word_bypass,
  input  [63:0] io_mem_resp_bits_store_data,
  input   io_mem_replay_next,
  input   io_mem_xcpt_ma_ld,
  input   io_mem_xcpt_ma_st,*/
  input   io_mem_xcpt_pf_ld,
  input   io_mem_xcpt_pf_st,
  output  io_mem_invalidate_lr,
  input   io_mem_ordered,

  input  [6:0] io_dpath_ptbr_asid,
  input  [37:0] io_dpath_ptbr_ppn,
  input   io_dpath_invalidate,
  input   io_dpath_status_debug,
  input  [31:0] io_dpath_status_isa,
  input  [1:0] io_dpath_status_prv,
  input   io_dpath_status_sd,
  input  [30:0] io_dpath_status_zero3,
  input   io_dpath_status_sd_rv32,
  input  [1:0] io_dpath_status_zero2,
  input  [4:0] io_dpath_status_vm,
  input  [3:0] io_dpath_status_zero1,
  input   io_dpath_status_mxr,
  input   io_dpath_status_pum,
  input   io_dpath_status_mprv,
  input  [1:0] io_dpath_status_xs,
  input  [1:0] io_dpath_status_fs,
  input  [1:0] io_dpath_status_mpp,
  input  [1:0] io_dpath_status_hpp,
  input   io_dpath_status_spp,
  input   io_dpath_status_mpie,
  input   io_dpath_status_hpie,
  input   io_dpath_status_spie,
  input   io_dpath_status_upie,
  input   io_dpath_status_mie,
  input   io_dpath_status_hie,
  input   io_dpath_status_sie,
  input   io_dpath_status_uie	
);
  // module注释的接口为未使用到的接口，最终测试时需要保留
	// FSM 状态机参数
	parameter
		S_ready 		    = 3'h0,
		S_req   		    = 3'h1,
		S_wait1 		    = 3'h2,
		S_wait2 		    = 3'h3,
		S_set_dirty 	  = 3'h4,
		S_wait1_dirty 	= 3'h5,
		S_wait2_dirty 	= 3'h6,
		S_done 			    = 3'h7;
  
/* internal regs */
  reg [2:0] state;
  reg [1:0] count;
  reg s1_kill;
  reg [7:0] plru;

  reg [15:0] r_pte_reserved_for_hardware;
  reg [37:0] r_pte_ppn;
  reg [1:0] r_pte_reserved_for_software;
  reg r_pte_d;
  reg r_pte_a;
  reg r_pte_g;
  reg r_pte_u;
  reg r_pte_x;
  reg r_pte_w;
  reg r_pte_r;
  reg r_pte_v;

  reg [1:0] r_req_prv;
  reg r_req_pum;
  reg r_req_mxr;
  reg [26:0] r_req_addr;
  reg r_req_store;
  reg r_req_fetch;
  reg r_req_dest;

/* pte storage unit */
  reg [7:0] valid;
  reg [31:0] tag_0;
  reg [31:0] tag_1;
  reg [31:0] tag_2;
  reg [31:0] tag_3;
  reg [31:0] tag_4;
  reg [31:0] tag_5;
  reg [31:0] tag_6;
  reg [31:0] tag_7;
  reg [19:0] ppn_0;
  reg [19:0] ppn_1;
  reg [19:0] ppn_2;
  reg [19:0] ppn_3;
  reg [19:0] ppn_4;
  reg [19:0] ppn_5;
  reg [19:0] ppn_6;
  reg [19:0] ppn_7;

/**/
// for RRArbiter output
  wire arb_io_in_0_ready;
  wire arb_io_in_1_ready;
  wire arb_io_out_ready;
  wire arb_io_out_valid;
  wire [1:0] arb_io_out_bits_prv;
  wire arb_io_out_bits_pum;
  wire arb_io_out_bits_mxr;
  wire [26:0] arb_io_out_bits_addr;
  wire arb_io_out_bits_store;
  wire arb_io_out_bits_fetch;
  wire arb_io_chosen;
// for dpath_wire_path output
// for requestor_arb_wire_path output
  wire arb_clock;
  wire arb_reset;
  wire arb_io_in_0_valid;
  wire [1:0] arb_io_in_0_bits_prv;
  wire arb_io_in_0_bits_pum;
  wire arb_io_in_0_bits_mxr;
  wire [26:0] arb_io_in_0_bits_addr;
  wire arb_io_in_0_bits_store;
  wire arb_io_in_0_bits_fetch;
  wire arb_io_in_1_valid;
  wire [1:0] arb_io_in_1_bits_prv;
  wire arb_io_in_1_bits_pum;
  wire arb_io_in_1_bits_mxr;
  wire [26:0] arb_io_in_1_bits_addr;
  wire arb_io_in_1_bits_store;
  wire arb_io_in_1_bits_fetch;
// for mem_wire_path output
  wire [15:0] pte_reserved_for_hardware;
  wire [37:0] pte_ppn;
  wire [1:0] pte_reserved_for_software;
  wire pte_d;
  wire pte_a;
  wire pte_g;
  wire pte_u;
  wire pte_x;
  wire pte_w;
  wire pte_r;
  wire pte_v;
// for no_leaf_pte_check_unit output
  wire is_pte_table;
// for permission_privilege_check_unit output
  wire access_ok;
// for target_ppn_generate_unit output
  wire [37:0] resp_ppn;
// for index_address_generate_unit output
  wire [49:0] pte_addr;
// for cache_search_unit output
  wire hit;
  wire [7:0] hit_bit;
  wire pte_cache_hit;
// for access_dirty_check_unit output
  wire AD_bit_not_ok;
// for replace_select_unit output
  wire [2:0] replace_entry;
  wire [7:0] new_valid;
// for plru_unit output
  wire [7:0] new_plru;
// for cache_search_unit output
  wire [19:0] pte_cache_data;

  RRArbiter arb (
    .clock(arb_clock),
    .reset(arb_reset),
    .io_in_0_ready(arb_io_in_0_ready),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_prv(arb_io_in_0_bits_prv),
    .io_in_0_bits_pum(arb_io_in_0_bits_pum),
    .io_in_0_bits_mxr(arb_io_in_0_bits_mxr),
    .io_in_0_bits_addr(arb_io_in_0_bits_addr),
    .io_in_0_bits_store(arb_io_in_0_bits_store),
    .io_in_0_bits_fetch(arb_io_in_0_bits_fetch),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_prv(arb_io_in_1_bits_prv),
    .io_in_1_bits_pum(arb_io_in_1_bits_pum),
    .io_in_1_bits_mxr(arb_io_in_1_bits_mxr),
    .io_in_1_bits_addr(arb_io_in_1_bits_addr),
    .io_in_1_bits_store(arb_io_in_1_bits_store),
    .io_in_1_bits_fetch(arb_io_in_1_bits_fetch),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_prv(arb_io_out_bits_prv),
    .io_out_bits_pum(arb_io_out_bits_pum),
    .io_out_bits_mxr(arb_io_out_bits_mxr),
    .io_out_bits_addr(arb_io_out_bits_addr),
    .io_out_bits_store(arb_io_out_bits_store),
    .io_out_bits_fetch(arb_io_out_bits_fetch),
    .io_chosen(arb_io_chosen)
  );

  dpath_wire_path m1_dpath(
    .io_dpath_ptbr_asid( io_dpath_ptbr_asid ),
    .io_dpath_ptbr_ppn( io_dpath_ptbr_ppn ),
    .io_dpath_invalidate( io_dpath_invalidate ),
    .io_dpath_status_debug( io_dpath_status_debug ),
    .io_dpath_status_isa( io_dpath_status_isa ),
    .io_dpath_status_prv( io_dpath_status_prv ),
    .io_dpath_status_sd( io_dpath_status_sd ),
    .io_dpath_status_zero3( io_dpath_status_zero3 ),
    .io_dpath_status_sd_rv32( io_dpath_status_sd_rv32 ),
    .io_dpath_status_zero2( io_dpath_status_zero2 ),
    .io_dpath_status_vm( io_dpath_status_vm ),
    .io_dpath_status_zero1( io_dpath_status_zero1 ),
    .io_dpath_status_mxr( io_dpath_status_mxr ),
    .io_dpath_status_pum( io_dpath_status_pum ),
    .io_dpath_status_mprv( io_dpath_status_mprv ),
    .io_dpath_status_xs( io_dpath_status_xs ),
    .io_dpath_status_fs( io_dpath_status_fs ),
    .io_dpath_status_mpp( io_dpath_status_mpp ),
    .io_dpath_status_hpp( io_dpath_status_hpp ),
    .io_dpath_status_spp( io_dpath_status_spp ),
    .io_dpath_status_mpie( io_dpath_status_mpie ),
    .io_dpath_status_hpie( io_dpath_status_hpie ),
    .io_dpath_status_spie( io_dpath_status_spie ),
    .io_dpath_status_upie( io_dpath_status_upie ),
    .io_dpath_status_mie( io_dpath_status_mie ),
    .io_dpath_status_hie( io_dpath_status_hie ),
    .io_dpath_status_sie( io_dpath_status_sie ),
    .io_dpath_status_uie( io_dpath_status_uie ),

    .io_requestor_0_ptbr_asid( io_requestor_0_ptbr_asid ),
    .io_requestor_0_ptbr_ppn( io_requestor_0_ptbr_ppn ),
    .io_requestor_0_invalidate( io_requestor_0_invalidate ),
    .io_requestor_0_status_debug( io_requestor_0_status_debug ),
    .io_requestor_0_status_isa( io_requestor_0_status_isa ),
    .io_requestor_0_status_prv( io_requestor_0_status_prv ),
    .io_requestor_0_status_sd( io_requestor_0_status_sd ),
    .io_requestor_0_status_zero3( io_requestor_0_status_zero3 ),
    .io_requestor_0_status_sd_rv32( io_requestor_0_status_sd_rv32 ),
    .io_requestor_0_status_zero2( io_requestor_0_status_zero2 ),
    .io_requestor_0_status_vm( io_requestor_0_status_vm ),
    .io_requestor_0_status_zero1( io_requestor_0_status_zero1 ),
    .io_requestor_0_status_mxr( io_requestor_0_status_mxr ),
    .io_requestor_0_status_pum( io_requestor_0_status_pum ),
    .io_requestor_0_status_mprv( io_requestor_0_status_mprv ),
    .io_requestor_0_status_xs( io_requestor_0_status_xs ),
    .io_requestor_0_status_fs( io_requestor_0_status_fs ),
    .io_requestor_0_status_mpp( io_requestor_0_status_mpp ),
    .io_requestor_0_status_hpp( io_requestor_0_status_hpp ),
    .io_requestor_0_status_spp( io_requestor_0_status_spp ),
    .io_requestor_0_status_mpie( io_requestor_0_status_mpie ),
    .io_requestor_0_status_hpie( io_requestor_0_status_hpie ),
    .io_requestor_0_status_spie( io_requestor_0_status_spie ),
    .io_requestor_0_status_upie( io_requestor_0_status_upie ),
    .io_requestor_0_status_mie( io_requestor_0_status_mie ),
    .io_requestor_0_status_hie( io_requestor_0_status_hie ),
    .io_requestor_0_status_sie( io_requestor_0_status_sie ),
    .io_requestor_0_status_uie( io_requestor_0_status_uie ),

    .io_requestor_1_ptbr_asid( io_requestor_1_ptbr_asid ),
    .io_requestor_1_ptbr_ppn( io_requestor_1_ptbr_ppn ),
    .io_requestor_1_invalidate( io_requestor_1_invalidate ),
    .io_requestor_1_status_debug( io_requestor_1_status_debug ),
    .io_requestor_1_status_isa( io_requestor_1_status_isa ),
    .io_requestor_1_status_prv( io_requestor_1_status_prv ),
    .io_requestor_1_status_sd( io_requestor_1_status_sd ),
    .io_requestor_1_status_zero3( io_requestor_1_status_zero3 ),
    .io_requestor_1_status_sd_rv32( io_requestor_1_status_sd_rv32 ),
    .io_requestor_1_status_zero2( io_requestor_1_status_zero2 ),
    .io_requestor_1_status_vm( io_requestor_1_status_vm ),
    .io_requestor_1_status_zero1( io_requestor_1_status_zero1 ),
    .io_requestor_1_status_mxr( io_requestor_1_status_mxr ),
    .io_requestor_1_status_pum( io_requestor_1_status_pum ),
    .io_requestor_1_status_mprv( io_requestor_1_status_mprv ),
    .io_requestor_1_status_xs( io_requestor_1_status_xs ),
    .io_requestor_1_status_fs( io_requestor_1_status_fs ),
    .io_requestor_1_status_mpp( io_requestor_1_status_mpp ),
    .io_requestor_1_status_hpp( io_requestor_1_status_hpp ),
    .io_requestor_1_status_spp( io_requestor_1_status_spp ),
    .io_requestor_1_status_mpie( io_requestor_1_status_mpie ),
    .io_requestor_1_status_hpie( io_requestor_1_status_hpie ),
    .io_requestor_1_status_spie( io_requestor_1_status_spie ),
    .io_requestor_1_status_upie( io_requestor_1_status_upie ),
    .io_requestor_1_status_mie( io_requestor_1_status_mie ),
    .io_requestor_1_status_hie( io_requestor_1_status_hie ),
    .io_requestor_1_status_sie( io_requestor_1_status_sie ),
    .io_requestor_1_status_uie( io_requestor_1_status_uie )
  );

  requestor_arb_wire_path m1_requestor_arb(
    .clock( clock ),
    .reset( reset ),
    .r_req_dest( r_req_dest ),
    .state( state ),
    .r_pte_reserved_for_hardware( r_pte_reserved_for_hardware ),
    .resp_ppn( resp_ppn ),
    .r_pte_reserved_for_software( r_pte_reserved_for_software ),
    .r_pte_d( r_pte_d ),
    .r_pte_a( r_pte_a ),
    .r_pte_g( r_pte_g ),
    .r_pte_u( r_pte_u ),
    .r_pte_x( r_pte_x ),
    .r_pte_w( r_pte_w ),
    .r_pte_r( r_pte_r ),
    .r_pte_v( r_pte_v ),
    .arb_io_in_0_ready( arb_io_in_0_ready ),
    .io_requestor_0_req_valid( io_requestor_0_req_valid ),
    .io_requestor_0_req_bits_prv( io_requestor_0_req_bits_prv ),
    .io_requestor_0_req_bits_pum( io_requestor_0_req_bits_pum ),
    .io_requestor_0_req_bits_mxr( io_requestor_0_req_bits_mxr ),
    .io_requestor_0_req_bits_addr( io_requestor_0_req_bits_addr ),
    .io_requestor_0_req_bits_store( io_requestor_0_req_bits_store ),
    .io_requestor_0_req_bits_fetch( io_requestor_0_req_bits_fetch ),
    .arb_io_in_1_ready( arb_io_in_1_ready ),
    .io_requestor_1_req_valid( io_requestor_1_req_valid ),
    .io_requestor_1_req_bits_prv( io_requestor_1_req_bits_prv ),
    .io_requestor_1_req_bits_pum( io_requestor_1_req_bits_pum ),
    .io_requestor_1_req_bits_mxr( io_requestor_1_req_bits_mxr ),
    .io_requestor_1_req_bits_addr( io_requestor_1_req_bits_addr ),
    .io_requestor_1_req_bits_store( io_requestor_1_req_bits_store ),
    .io_requestor_1_req_bits_fetch( io_requestor_1_req_bits_fetch ),

    .arb_clock( arb_clock ),
    .arb_reset( arb_reset ),
    .io_requestor_0_resp_valid( io_requestor_0_resp_valid ),
    .io_requestor_0_resp_bits_pte_reserved_for_hardware( io_requestor_0_resp_bits_pte_reserved_for_hardware ),
    .io_requestor_0_resp_bits_pte_ppn( io_requestor_0_resp_bits_pte_ppn ),
    .io_requestor_0_resp_bits_pte_reserved_for_software( io_requestor_0_resp_bits_pte_reserved_for_software ),
    .io_requestor_0_resp_bits_pte_d( io_requestor_0_resp_bits_pte_d ),
    .io_requestor_0_resp_bits_pte_a( io_requestor_0_resp_bits_pte_a ),
    .io_requestor_0_resp_bits_pte_g( io_requestor_0_resp_bits_pte_g ),
    .io_requestor_0_resp_bits_pte_u( io_requestor_0_resp_bits_pte_u ),
    .io_requestor_0_resp_bits_pte_x( io_requestor_0_resp_bits_pte_x ),
    .io_requestor_0_resp_bits_pte_w( io_requestor_0_resp_bits_pte_w ),
    .io_requestor_0_resp_bits_pte_r( io_requestor_0_resp_bits_pte_r ),
    .io_requestor_0_resp_bits_pte_v( io_requestor_0_resp_bits_pte_v ),
    .io_requestor_1_resp_valid( io_requestor_1_resp_valid ),
    .io_requestor_1_resp_bits_pte_reserved_for_hardware( io_requestor_1_resp_bits_pte_reserved_for_hardware ),
    .io_requestor_1_resp_bits_pte_ppn( io_requestor_1_resp_bits_pte_ppn ),
    .io_requestor_1_resp_bits_pte_reserved_for_software( io_requestor_1_resp_bits_pte_reserved_for_software ),
    .io_requestor_1_resp_bits_pte_d( io_requestor_1_resp_bits_pte_d ),
    .io_requestor_1_resp_bits_pte_a( io_requestor_1_resp_bits_pte_a ),
    .io_requestor_1_resp_bits_pte_g( io_requestor_1_resp_bits_pte_g ),
    .io_requestor_1_resp_bits_pte_u( io_requestor_1_resp_bits_pte_u ),
    .io_requestor_1_resp_bits_pte_x( io_requestor_1_resp_bits_pte_x ),
    .io_requestor_1_resp_bits_pte_w( io_requestor_1_resp_bits_pte_w ),
    .io_requestor_1_resp_bits_pte_r( io_requestor_1_resp_bits_pte_r ),
    .io_requestor_1_resp_bits_pte_v( io_requestor_1_resp_bits_pte_v ),
    .io_requestor_0_req_ready( io_requestor_0_req_ready ),
    .arb_io_in_0_valid( arb_io_in_0_valid ),
    .arb_io_in_0_bits_prv( arb_io_in_0_bits_prv ),
    .arb_io_in_0_bits_pum( arb_io_in_0_bits_pum ),
    .arb_io_in_0_bits_mxr( arb_io_in_0_bits_mxr ),
    .arb_io_in_0_bits_addr( arb_io_in_0_bits_addr ),
    .arb_io_in_0_bits_store( arb_io_in_0_bits_store ),
    .arb_io_in_0_bits_fetch( arb_io_in_0_bits_fetch ),
    .io_requestor_1_req_ready( io_requestor_1_req_ready ),
    .arb_io_in_1_valid( arb_io_in_1_valid ),
    .arb_io_in_1_bits_prv( arb_io_in_1_bits_prv ),
    .arb_io_in_1_bits_pum( arb_io_in_1_bits_pum ),
    .arb_io_in_1_bits_mxr( arb_io_in_1_bits_mxr ),
    .arb_io_in_1_bits_addr( arb_io_in_1_bits_addr ),
    .arb_io_in_1_bits_store( arb_io_in_1_bits_store ),
    .arb_io_in_1_bits_fetch( arb_io_in_1_bits_fetch )
  );

  mem_wire_path m1_mem(
    .io_mem_resp_bits_data( io_mem_resp_bits_data ),
    .pte_addr( pte_addr ),
    .r_req_store( r_req_store ),
    .state( state ),
    .s1_kill( s1_kill ),

    .pte_reserved_for_hardware( pte_reserved_for_hardware ),
    .pte_ppn( pte_ppn ),
    .pte_reserved_for_software( pte_reserved_for_software ),
    .pte_d( pte_d ),
    .pte_a( pte_a ),
    .pte_g( pte_g ),
    .pte_u( pte_u ),
    .pte_x( pte_x ),
    .pte_w( pte_w ),
    .pte_r( pte_r ),
    .pte_v( pte_v ),
    .io_mem_req_bits_addr( io_mem_req_bits_addr ),
    .io_mem_req_bits_tag( io_mem_req_bits_tag ),
    .io_mem_req_bits_typ( io_mem_req_bits_typ ),
    .io_mem_req_bits_phys( io_mem_req_bits_phys ),
    .io_mem_req_bits_data( io_mem_req_bits_data ),
    .io_mem_s1_kill( io_mem_s1_kill ),
    .io_mem_invalidate_lr( io_mem_invalidate_lr ),
    .io_mem_req_bits_cmd( io_mem_req_bits_cmd ),
    .io_mem_req_valid( io_mem_req_valid ),
    .io_mem_s1_data( io_mem_s1_data )
  );

  no_leaf_pte_check_unit m1_no_leaf(
    .pte_v( pte_v ),
    .pte_r( pte_r ),
    .pte_w( pte_w ),
    .pte_x( pte_x ),

    .is_pte_table( is_pte_table )
  );

  permission_privilege_check_unit m1_perm_priv(
    .r_req_store( r_req_store ),
    .r_req_fetch( r_req_fetch ),
    .r_req_prv( r_req_prv ),
    .r_req_mxr( r_req_mxr ),
    .r_req_pum( r_req_pum ),
    .pte_r( pte_r ),
    .pte_w( pte_w ),
    .pte_x( pte_x ),
    .pte_v( pte_v ),
    .pte_u( pte_u ),

    .access_ok( access_ok )
  );

  target_ppn_generate_unit m1_target_ppn(
    .count( count ),
    .pte_addr( pte_addr ),
    .r_req_addr( r_req_addr ),

    .resp_ppn( resp_ppn )
  );

  index_address_generate_unit m1_addr_gen(
    .r_pte_ppn( r_pte_ppn ),
    .count( count ),
    .r_req_addr( r_req_addr ),

    .pte_addr( pte_addr )
  );

  cache_hit_judge_unit m1_cache_hit(
    .count( count ),
    .valid( valid ),
    .pte_addr( pte_addr ),
    .tag_7( tag_7 ),
    .tag_6( tag_6 ),
    .tag_5( tag_5 ),
    .tag_4( tag_4 ),
    .tag_3( tag_3 ),
    .tag_2( tag_2 ),
    .tag_1( tag_1 ),
    .tag_0( tag_0 ),

    .hit( hit ),
    .hit_bit( hit_bit ),
    .pte_cache_hit( pte_cache_hit )
  );

  access_dirty_check_unit m1_AD(
    .r_req_store( r_req_store ),
    .pte_a( pte_a ),
    .pte_d( pte_d ),

    .AD_bit_not_ok( AD_bit_not_ok )
  );

  replace_select_unit m1_replace(
    .plru( plru ),
    .valid( valid ),

    .replace_entry( replace_entry ),
    .new_valid( new_valid )
  );

  plru_unit m1_plru(
    .hit_bit( hit_bit ),
    .plru( plru ),

    .new_plru( new_plru )
  );

  cache_search_unit m1_cache_search(
    .pte_ppn( pte_ppn ),
    .hit_bit( hit_bit ),
    .replace_entry( replace_entry ),
    .ppn_7( ppn_7 ),
    .ppn_6( ppn_6 ),
    .ppn_5( ppn_5 ),
    .ppn_4( ppn_4 ),
    .ppn_3( ppn_3 ),
    .ppn_2( ppn_2 ),
    .ppn_1( ppn_1 ),
    .ppn_0( ppn_0 ),

    .pte_cache_data( pte_cache_data )
  );

  always @(posedge clock) begin
    // 更新状态state 
    if (reset) begin
      state <= S_ready;
    end
    else begin
      case( state )
        S_ready: 
        begin
          if(arb_io_out_valid) begin
            state <= S_req;
          end
        end
        S_req:
        begin
          if(pte_cache_hit) begin
            state <= S_req;
          end else begin
            if(io_mem_req_ready) begin
              state <= S_wait1;
            end
          end
        end
        S_wait1: 
        begin
          if(io_mem_xcpt_pf_ld) begin
            state <= S_done;
          end else begin
            state <= S_wait2;
          end
        end
        S_wait2: 
        begin
          if(io_mem_resp_valid) begin
            if(is_pte_table && count < 2) begin // (v && !r && !w && !x) && count < 2, 即非叶子页表, T_2676
              state <= S_req;
            end else begin
              if( access_ok && AD_bit_not_ok ) begin // access_ok && (!d && req_store_ || !a)
                state <= S_set_dirty;
              end else begin // T_2664
                state <= S_done;
              end
            end
          end else begin
            if(io_mem_s2_nack) begin
              state <= S_req; // state <= req
            end
          end
        end
        S_set_dirty:
        begin
          if(io_mem_req_ready) begin
            state <= S_wait1_dirty;
          end
        end
        S_wait1_dirty: 
        begin
          if(io_mem_xcpt_pf_st) begin
            state <= S_done;
          end else begin
            state <= S_wait2_dirty;
          end
        end
        S_wait2_dirty:
        begin
          if(io_mem_resp_valid) begin
            state <= S_req;
          end else begin
            if(io_mem_s2_nack) begin 
              state <= S_set_dirty;
            end
          end
        end
        S_done:
        begin
            state <= S_ready;
        end
      endcase
    end

    // 更新count 
    if( state == S_wait2 ) begin
      if(io_mem_resp_valid) begin
        if(is_pte_table && count < 2) begin // (v && !r && !w && !x) && count < 2, 即非叶子页表, T_2676
          count <= count + 1; // count ++, T_2634
        end
      end
    end else begin
      if( state == S_req ) begin
        if(pte_cache_hit) begin
          count <= count + 1; // count++, T_2634
        end
      end
    end

    // 更新s1_kill 
    if( state == S_req ) begin
      s1_kill <= pte_cache_hit;
    end else begin
      s1_kill <= 1'h0;  // Chisel中有点不一样
    end

    // 缓存TLB请求 
    if(arb_io_out_ready && arb_io_out_valid) begin // arb_io_out_ready = (state == 3'h0)
      // r_req
      r_req_prv   <= arb_io_out_bits_prv;
      r_req_pum   <= arb_io_out_bits_pum;
      r_req_mxr   <= arb_io_out_bits_mxr;
      r_req_addr  <= arb_io_out_bits_addr;
      r_req_store <= arb_io_out_bits_store;
      r_req_fetch <= arb_io_out_bits_fetch;
      // r_req_dest
      r_req_dest  <= arb_io_chosen; 
      // r_pte.ppn
      // r_pte_ppn   <= io_dpath_ptbr_ppn;
    end

    // 更新r_pte_~, 除了r_pte_v 
    if( state == S_wait2 ) begin
      if(io_mem_resp_valid) begin
        if(!(AD_bit_not_ok && access_ok)) begin // !(access_ok && ((!d && r_req_store) || !a), T_2664
          r_pte_reserved_for_hardware <= pte_reserved_for_hardware;
          r_pte_ppn                   <= pte_ppn;
          r_pte_reserved_for_software <= pte_reserved_for_software;
          r_pte_d                     <= pte_d;
          r_pte_a                     <= pte_a;
          r_pte_g                     <= pte_g;
          r_pte_u                     <= pte_u;
          r_pte_x                     <= pte_x;
          r_pte_w                     <= pte_w;
          r_pte_r                     <= pte_r;
        end
      end
    end else begin
      if( state == S_req ) begin
        if(pte_cache_hit) begin
          r_pte_ppn <= {{18'd0}, pte_cache_data}; // 18 + 20bit
        end 
      end else begin
        if(arb_io_out_ready && arb_io_out_valid) begin // arb_io_out_ready = (state == 3'h0)
          r_pte_ppn <= io_dpath_ptbr_ppn;
        end
      end
    end

    // 更新r_pte_v 
    if( state == S_wait1_dirty ) begin
      if(io_mem_xcpt_pf_st) begin
        r_pte_v <= 1'h0;
      end
    end else begin
      if( state == S_wait2 ) begin
        if(io_mem_resp_valid) begin
          if(!(AD_bit_not_ok && access_ok)) begin // !(access_ok && ((!d && r_req_store) || !a), T_2664
            r_pte_v <= pte_v;
          end
        end
      end else begin
        if( state == S_wait1 ) begin
          if(io_mem_xcpt_pf_ld) begin
            r_pte_v <= 1'h0;
          end
        end
      end
    end

    // 更新PLRU 
    if(state == S_req && hit) begin // state == 1 && 缓存命中, T_2433 = T_2376 && state == 1
      plru <= new_plru; // 可能是PLRU寄存器
    end

    // 更新valid 
    if(reset) begin 
      valid <= 8'h0;
    end else begin
      if(io_dpath_invalidate) begin
        valid <= 8'h0;
      end else begin
        if(io_mem_resp_valid && is_pte_table && !hit) begin // 缓存未命中 && (v & !r & !w & !x) && io_mem_resp_valid, T_2389
          valid <= new_valid; // 如果缓存全部有效，则由plru指定，否则由优先队列指定
        end
      end
    end

    // 更新TAG, PPN 
    if(io_mem_resp_valid && is_pte_table && !hit) begin // 缓存未命中 && (v & !r & !w & !x) && io_mem_resp_valid, T_2389
      // 更新TAG，使用pte_addr, 32位, 原为GEN_0
      if(3'h0 == replace_entry) begin
        tag_0 <= pte_addr[31:0];
      end
      if(3'h1 == replace_entry) begin
        tag_1 <= pte_addr[31:0];
      end
      if(3'h2 == replace_entry) begin
        tag_2 <= pte_addr[31:0];
      end
      if(3'h3 == replace_entry) begin
        tag_3 <= pte_addr[31:0];
      end
      if(3'h4 == replace_entry) begin
        tag_4 <= pte_addr[31:0];
      end
      if(3'h5 == replace_entry) begin
        tag_5 <= pte_addr[31:0];
      end
      if(3'h6 == replace_entry) begin
        tag_6 <= pte_addr[31:0];
      end
      if(3'h7 == replace_entry) begin
        tag_7 <= pte_addr[31:0];
      end
    // 更新PPN，使用pte_ppn, 20位, 原为GEN_1
      if(3'h0 == replace_entry) begin
        ppn_0 <= pte_ppn[19:0];
      end
      if(3'h1 == replace_entry) begin
        ppn_1 <= pte_ppn[19:0];
      end
      if(3'h2 == replace_entry) begin
        ppn_2 <= pte_ppn[19:0];
      end
      if(3'h3 == replace_entry) begin
        ppn_3 <= pte_ppn[19:0];
      end
      if(3'h4 == replace_entry) begin
        ppn_4 <= pte_ppn[19:0];
      end
      if(3'h5 == replace_entry) begin
        ppn_5 <= pte_ppn[19:0];
      end
      if(3'h6 == replace_entry) begin
        ppn_6 <= pte_ppn[19:0];
      end
      if(3'h7 == replace_entry) begin
        ppn_7 <= pte_ppn[19:0];
      end
    end
  
  end
endmodule