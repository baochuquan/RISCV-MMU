`timescale 1ns/100ps

module test_for_tlb();
  reg   clock;
  reg   reset;
  wire  io_req_ready;//????????
  reg   io_req_valid;//??????
  reg  [27:0] io_req_bits_vpn;//?????27???????????????28?
  reg   io_req_bits_passthrough;
  reg   io_req_bits_instruction;//??????????
  reg   io_req_bits_store;//????store???????
  wire  io_resp_miss;//TLB??
  wire [19:0] io_resp_ppn;
  wire  io_resp_xcpt_ld;//load??
  wire  io_resp_xcpt_st;//store??
  wire  io_resp_xcpt_if;//????
  wire  io_resp_cacheable;//?????
  reg   io_ptw_req_ready;//ptw??????
  wire  io_ptw_req_valid;//TLB??????
  wire [1:0] io_ptw_req_bits_prv;
  wire  io_ptw_req_bits_pum;
  wire  io_ptw_req_bits_mxr;
  wire [26:0] io_ptw_req_bits_addr;//??????27+7=34??????27?
  wire  io_ptw_req_bits_store;
  wire  io_ptw_req_bits_fetch;
  reg   io_ptw_resp_valid;//ptw???????
  reg  [15:0] io_ptw_resp_bits_pte_reserved_for_hardware;
  reg  [37:0] io_ptw_resp_bits_pte_ppn;//?????20??????????TLB???20?
  reg  [1:0] io_ptw_resp_bits_pte_reserved_for_software;
  reg   io_ptw_resp_bits_pte_d;
  reg   io_ptw_resp_bits_pte_a;
  reg   io_ptw_resp_bits_pte_g;
  reg   io_ptw_resp_bits_pte_u;
  reg   io_ptw_resp_bits_pte_x;
  reg   io_ptw_resp_bits_pte_w;
  reg   io_ptw_resp_bits_pte_r;
  reg   io_ptw_resp_bits_pte_v;
  reg  [6:0] io_ptw_ptbr_asid;
  reg  [37:0] io_ptw_ptbr_ppn;
  reg   io_ptw_invalidate;
  reg   io_ptw_status_debug;
  reg  [31:0] io_ptw_status_isa;
  reg  [1:0] io_ptw_status_prv;
  reg   io_ptw_status_sd;
  reg  [30:0] io_ptw_status_zero3;
  reg   io_ptw_status_sd_rv32;
  reg  [1:0] io_ptw_status_zero2;
  reg  [4:0] io_ptw_status_vm;
  reg  [3:0] io_ptw_status_zero1;
  reg   io_ptw_status_mxr;
  reg   io_ptw_status_pum;
  reg   io_ptw_status_mprv;
  reg  [1:0] io_ptw_status_xs;
  reg  [1:0] io_ptw_status_fs;
  reg  [1:0] io_ptw_status_mpp;
  reg  [1:0] io_ptw_status_hpp;
  reg   io_ptw_status_spp;
  reg   io_ptw_status_mpie;
  reg   io_ptw_status_hpie;
  reg   io_ptw_status_spie;
  reg   io_ptw_status_upie;
  reg   io_ptw_status_mie;
  reg   io_ptw_status_hie;
  reg   io_ptw_status_sie;
  reg   io_ptw_status_uie;
  
  
TLB tlb_test
(
 .clock(clock ),                 
 .reset(reset ),                 
 .io_req_ready(io_req_ready),//????????
 .io_req_valid(io_req_valid),//??????  
 .io_req_bits_vpn(io_req_bits_vpn),
 .io_req_bits_passthrough(io_req_bits_passthrough),
 .io_req_bits_instruction(io_req_bits_instruction),
 .io_req_bits_store(io_req_bits_store),//???
 .io_resp_miss(io_resp_miss),//TLB??   
 .io_resp_ppn(io_resp_ppn),     
 .io_resp_xcpt_ld(io_resp_xcpt_ld),//load?
 .io_resp_xcpt_st(io_resp_xcpt_st),//store
 .io_resp_xcpt_if(io_resp_xcpt_if),//???? 
 .io_resp_cacheable(io_resp_cacheable),//???
 .io_ptw_req_ready(io_ptw_req_ready),//ptw?
 .io_ptw_req_valid(io_ptw_req_valid),//TLB?
 .io_ptw_req_bits_prv(io_ptw_req_bits_prv),
 .io_ptw_req_bits_pum(io_ptw_req_bits_pum),   
 .io_ptw_req_bits_mxr(io_ptw_req_bits_mxr),   
 .io_ptw_req_bits_addr(io_ptw_req_bits_addr),
 .io_ptw_req_bits_store(io_ptw_req_bits_store), 
 .io_ptw_req_bits_fetch(io_ptw_req_bits_fetch), 
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

initial begin
		clock=0;
		forever #5		clock=~clock;
end

initial begin
  reset=1;
  io_req_valid=0;
  io_req_bits_vpn=28'b1;
  io_req_bits_passthrough=0;
  io_req_bits_instruction=0;
  io_req_bits_store=0;
  io_ptw_req_ready=0;
  io_ptw_resp_valid=0;
  io_ptw_resp_bits_pte_ppn=0;
  io_ptw_resp_bits_pte_d=0;
  io_ptw_resp_bits_pte_a=0;
  io_ptw_resp_bits_pte_g=0;
  io_ptw_resp_bits_pte_u=0;
  io_ptw_resp_bits_pte_x=0;
  io_ptw_resp_bits_pte_w=0;
  io_ptw_resp_bits_pte_r=0;
  io_ptw_resp_bits_pte_v=0;
  io_ptw_ptbr_asid=0;
  io_ptw_invalidate=0;
  io_ptw_status_debug=0;
  io_ptw_status_isa=0;
  io_ptw_status_prv=0;//user??
  io_ptw_status_vm=5'b1001;//sv39
  io_ptw_status_mxr=0;
  io_ptw_status_pum=0;
  io_ptw_status_mprv=0;
  io_ptw_status_mpp=1;//s??
  #10;
  reset=0;
  io_req_valid=1;
  io_ptw_req_ready=1;
  io_ptw_ptbr_asid=7'b100;
  #10;
  io_ptw_resp_valid=1;
  io_ptw_resp_bits_pte_ppn=20'b10000000000000;
  io_ptw_resp_bits_pte_u=1;
  io_ptw_resp_bits_pte_w=1;
  io_ptw_resp_bits_pte_r=1;
  io_ptw_resp_bits_pte_x=1;
  io_ptw_resp_bits_pte_v=1;
  #10;
  io_req_bits_passthrough=1;
  io_ptw_resp_valid=0;
  #10;
  io_req_bits_vpn=28'b10;
  io_req_bits_passthrough=0;
  
  #10;
  io_ptw_resp_valid=1;
  io_ptw_resp_bits_pte_ppn=20'b10000000000001;
  io_ptw_resp_bits_pte_r=0;
  #10;
  io_req_bits_store=1;
  io_ptw_resp_valid=0;
end
  
endmodule 
