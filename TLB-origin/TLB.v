module TLB(
  input   clock,
  input   reset,
  output  io_req_ready,//????????
  input   io_req_valid,//??????
  input  [27:0] io_req_bits_vpn,//?????27???????????????28?
  input   io_req_bits_passthrough,
  input   io_req_bits_instruction,//??????????
  input   io_req_bits_store,//????store???????
  output  io_resp_miss,//TLB??
  output [19:0] io_resp_ppn,
  output  io_resp_xcpt_ld,//load??
  output  io_resp_xcpt_st,//store??
  output  io_resp_xcpt_if,//????
  output  io_resp_cacheable,//?????
  input   io_ptw_req_ready,//ptw??????
  output  io_ptw_req_valid,//TLB??????
  output [1:0] io_ptw_req_bits_prv,
  output  io_ptw_req_bits_pum,
  output  io_ptw_req_bits_mxr,
  output [26:0] io_ptw_req_bits_addr,//??????27+7=34??????27?
  output  io_ptw_req_bits_store,
  output  io_ptw_req_bits_fetch,
  input   io_ptw_resp_valid,//ptw???????
  input  [15:0] io_ptw_resp_bits_pte_reserved_for_hardware,
  input  [37:0] io_ptw_resp_bits_pte_ppn,//?????20??????????TLB???20?
  input  [1:0] io_ptw_resp_bits_pte_reserved_for_software,
  input   io_ptw_resp_bits_pte_d,
  input   io_ptw_resp_bits_pte_a,
  input   io_ptw_resp_bits_pte_g,
  input   io_ptw_resp_bits_pte_u,
  input   io_ptw_resp_bits_pte_x,
  input   io_ptw_resp_bits_pte_w,
  input   io_ptw_resp_bits_pte_r,
  input   io_ptw_resp_bits_pte_v,
  input  [6:0] io_ptw_ptbr_asid,
  input  [37:0] io_ptw_ptbr_ppn,
  input   io_ptw_invalidate,
  input   io_ptw_status_debug,
  input  [31:0] io_ptw_status_isa,
  input  [1:0] io_ptw_status_prv,
  input   io_ptw_status_sd,
  input  [30:0] io_ptw_status_zero3,
  input   io_ptw_status_sd_rv32,
  input  [1:0] io_ptw_status_zero2,
  input  [4:0] io_ptw_status_vm,
  input  [3:0] io_ptw_status_zero1,
  input   io_ptw_status_mxr,
  input   io_ptw_status_pum,
  input   io_ptw_status_mprv,
  input  [1:0] io_ptw_status_xs,
  input  [1:0] io_ptw_status_fs,
  input  [1:0] io_ptw_status_mpp,
  input  [1:0] io_ptw_status_hpp,
  input   io_ptw_status_spp,
  input   io_ptw_status_mpie,
  input   io_ptw_status_hpie,
  input   io_ptw_status_spie,
  input   io_ptw_status_upie,
  input   io_ptw_status_mie,
  input   io_ptw_status_hie,
  input   io_ptw_status_sie,
  input   io_ptw_status_uie
  );

  parameter
    S_ready           = 2'h0,
    S_request         = 2'h1,
    S_wait            = 2'h2,
    S_wait_invalidate = 2'h3;
// global 
  reg [15:0] pte_array_reserved_for_hardware;
  reg [37:0] pte_array_ppn;
  reg [1:0] pte_array_reserved_for_software;
  reg  pte_array_d;
  reg  pte_array_a;
  reg  pte_array_g;
  reg  pte_array_u;
  reg  pte_array_x;
  reg  pte_array_w;
  reg  pte_array_r;
  reg  pte_array_v;

  reg [1:0] state;
  reg [33:0] r_refill_tag;
  reg [2:0] r_refill_waddr;
  reg [27:0] r_req_vpn;
  reg  r_req_passthrough;
  reg  r_req_instruction;
  reg  r_req_store;
  reg [7:0] plru_val;

// for TLB Entries
  reg [7:0] valid;
  reg [33:0] tags_0;
  reg [33:0] tags_1;
  reg [33:0] tags_2;
  reg [33:0] tags_3;
  reg [33:0] tags_4;
  reg [33:0] tags_5;
  reg [33:0] tags_6;
  reg [33:0] tags_7;
  reg [19:0] ppns_0;
  reg [19:0] ppns_1;
  reg [19:0] ppns_2;
  reg [19:0] ppns_3;
  reg [19:0] ppns_4;
  reg [19:0] ppns_5;
  reg [19:0] ppns_6;
  reg [19:0] ppns_7;
  reg [7:0] u_array;
  reg [7:0] sw_array;
  reg [7:0] sx_array;
  reg [7:0] sr_array;
  reg [7:0] xr_array;
  reg [7:0] cash_array;
  reg [7:0] dirty_array;

// for tlb_attri_change -- output
  wire [7:0] new_valid;
  wire [7:0] new_u_array;
  wire [7:0] new_sw_array;
  wire [7:0] new_sx_array;
  wire [7:0] new_sr_array;
  wire [7:0] new_xr_array;
  wire [7:0] new_cash_array;
  wire [7:0] new_dirty_array;
// for tlb_lookup -- output
  wire [33:0] lookup_tag;
  wire [8:0] hitsVec;
  wire [8:0] hits;
  wire tlb_miss;
// for tlb_replace -- output
  wire [2:0] repl_waddr;
// for tlb_req_trans -- output

// for v_addr_check -- output
  wire bad_va;
// for v_p_trans_arbi -- output
  wire priv_s;
  wire vm_enabled;
// for addr_prot_check -- output
  wire [19:0] passthrough_ppn;
  wire prot_r;
  wire prot_w;
  wire prot_x;
  wire cacheable_buf;//cacheable
// for except_detec -- output
  wire [8:0] dirty_hit_check;
// for plru -- output
  wire [7:0] new_plru_val;

tlb_attri_change instance_tlb_attri_change(
  .r_refill_waddr( r_refill_waddr ),
  .io_ptw_invalidate( io_ptw_invalidate ),
  .io_ptw_resp_valid( io_ptw_resp_valid ),
  .io_ptw_resp_bits_pte_v( io_ptw_resp_bits_pte_v ),
  .io_ptw_resp_bits_pte_u( io_ptw_resp_bits_pte_u),
  .io_ptw_resp_bits_pte_w( io_ptw_resp_bits_pte_w ),
  .io_ptw_resp_bits_pte_x( io_ptw_resp_bits_pte_x ),
  .io_ptw_resp_bits_pte_r( io_ptw_resp_bits_pte_r ),
  .io_ptw_resp_bits_pte_d( io_ptw_resp_bits_pte_d ),
  .valid( valid ),
  .u_array( u_array ),
  .sw_array( sw_array ),
  .sr_array( sr_array ),
  .sx_array( sx_array ),
  .xr_array( xr_array ),
  .cash_array( cash_array ),
  .dirty_array( dirty_array ),
  .prot_w( prot_w ),
  .prot_x( prot_x ),
  .prot_r( prot_r ),
  .cacheable_buf( cacheable_buf ),//cacheable

  .new_valid( new_valid ),
  .new_u_array( new_u_array ),
  .new_sw_array( new_sw_array ),
  .new_sx_array( new_sx_array ),
  .new_sr_array( new_sr_array ),
  .new_xr_array( new_xr_array ),
  .new_cash_array( new_cash_array ),
  .new_dirty_array( new_dirty_array )
);

tlb_lookup instance_tlb_lookup(
  .io_ptw_ptbr_asid( io_ptw_ptbr_asid ),
  .io_req_bits_vpn( io_req_bits_vpn ),
  .tags_0( tags_0 ),
  .tags_1( tags_1 ),
  .tags_2( tags_2 ),
  .tags_3( tags_3 ),
  .tags_4( tags_4 ),
  .tags_5( tags_5 ),
  .tags_6( tags_6 ),
  .tags_7( tags_7 ),
  .valid( valid ),
  .dirty_hit_check( dirty_hit_check ),
  .vm_enabled( vm_enabled ),
  .bad_va( bad_va ),

  .lookup_tag( lookup_tag ),
  .hitsVec( hitsVec ),
  .hits( hits ),
  .tlb_miss( tlb_miss )
);

tlb_replace instance_tlb_replace(
  .valid( valid ),
  .plru_val( plru_val ),//8????

  .repl_waddr( repl_waddr )
);

tlb_req_trans instance_tlb_req_trans(
  .state( state ),
  .io_ptw_resp_valid( io_ptw_resp_valid ),
  .tlb_miss( tlb_miss ),
  .r_refill_tag( r_refill_tag ),
  .r_req_instruction( r_req_instruction ),
  .r_req_store( r_req_store ),
  .io_ptw_status_pum( io_ptw_status_pum ),
  .io_ptw_status_mxr( io_ptw_status_mxr ),
  .io_ptw_status_prv( io_ptw_status_prv ),

  .io_req_ready( io_req_ready ),
  .io_ptw_req_valid( io_ptw_req_valid ),
  .io_resp_miss( io_resp_miss ),
  .io_ptw_req_bits_addr( io_ptw_req_bits_addr ),
  .io_ptw_req_bits_fetch( io_ptw_req_bits_fetch ),
  .io_ptw_req_bits_store( io_ptw_req_bits_store ),
  .io_ptw_req_bits_pum( io_ptw_req_bits_pum ),
  .io_ptw_req_bits_mxr( io_ptw_req_bits_mxr ),
  .io_ptw_req_bits_prv( io_ptw_req_bits_prv )
);

v_addr_check instance_v_addr_check(
   .io_req_bits_vpn_27( io_req_bits_vpn[27] ) ,
   .io_req_bits_vpn_26( io_req_bits_vpn[26] ) ,
   .bad_va( bad_va )
);

v_p_trans_arbi instance_v_p_trans_arbi(
  .io_req_bits_instruction( io_req_bits_instruction ),
  .io_ptw_status_mprv( io_ptw_status_mprv ),
  .io_ptw_status_mpp( io_ptw_status_mpp ),
  .io_ptw_status_prv( io_ptw_status_prv ),
  .io_ptw_status_debug( io_ptw_status_debug ),
  .io_ptw_status_vm_3( io_ptw_status_vm[3] ),
  .io_req_bits_passthrough( io_req_bits_passthrough ),
  
  .priv_s( priv_s ),
  .vm_enabled( vm_enabled )
  );

addr_prot_check instance_addr_prot_check(
  .io_ptw_resp_valid( io_ptw_resp_valid ),
  .io_req_bits_vpn( io_req_bits_vpn[19:0] ),
  .io_ptw_resp_bits_pte_ppn( io_ptw_resp_bits_pte_ppn[19:0] ),

  .passthrough_ppn( passthrough_ppn ),
  .prot_r( prot_r ),
  .prot_w( prot_w ),
  .prot_x( prot_x ),
  .cacheable_buf( cacheable_buf )//cacheable
);

cacheable_check instance_cacheable_check(
  .cash_array( cash_array ),
  .cacheable_buf( cacheable_buf ),//cacheable
  .hits( hits ),

  .io_resp_cacheable( io_resp_cacheable )
);

except_detec instance_except_detec(
  .io_req_bits_store( io_req_bits_store ),
  .io_ptw_status_pum( io_ptw_status_pum ),
  .u_array( u_array ),
  .sw_array( sw_array ),
  .sx_array( sx_array ),
  .sr_array( sr_array ),
  .xr_array( xr_array ),
  .dirty_array( dirty_array ),
  .io_ptw_status_mxr( io_ptw_status_mxr ),
  .priv_s( priv_s ),
  .prot_w( prot_w ),
  .prot_r( prot_r ),
  .prot_x( prot_x ),
  .hits( hits ),
  .bad_va( bad_va ),

  .io_resp_xcpt_st( io_resp_xcpt_st ),
  .io_resp_xcpt_if( io_resp_xcpt_if ), 
  .io_resp_xcpt_ld( io_resp_xcpt_ld ),
  .dirty_hit_check( dirty_hit_check )
);

ppn_generate instance_ppn_generate(
  .ppns_0( ppns_0 ),
  .ppns_1( ppns_1 ),
  .ppns_2( ppns_2 ),
  .ppns_3( ppns_3 ),
  .ppns_4( ppns_4 ),
  .ppns_5( ppns_5 ),
  .ppns_6( ppns_6 ),
  .ppns_7( ppns_7 ),
  .passthrough_ppn( passthrough_ppn ),
  .hitsVec( hitsVec ),

  .io_resp_ppn( io_resp_ppn )
);
plru instance_plru(
  .hits( hits ),
  .plru_val( plru_val ),

  .new_plru_val( new_plru_val )
);

  always @(posedge clock) begin
    // 状态机    
    if( reset ) begin // 状态机控制，控制状态转移
      state <= S_ready; 
    end else begin
      if( io_ptw_resp_valid ) begin
        state <= S_ready; 
      end else begin
        if( state == S_wait && io_ptw_invalidate ) begin // wait && io_ptw_invalidate
          state <= S_wait_invalidate; 
        end else begin
          if( state == S_request ) begin // state == request 1
            if( io_ptw_req_ready ) begin 
              if( io_ptw_invalidate ) begin //
                state <= S_wait_invalidate; // state <= wait_invalidate
              end else begin
                state <= S_wait;
              end
            end else begin
              if( io_ptw_invalidate ) begin // 
                state <= S_ready; 
              end else begin
                if( io_req_ready && io_req_valid && tlb_miss ) begin // io_req_ready && io_req_valid && tlb_miss
                  state <= S_request; 
                end
              end
            end
          end else begin
            if( io_req_ready && io_req_valid && tlb_miss ) begin // to deal state != request 
              state <= S_request; 
            end
          end
        end
      end
    end

    if( io_req_ready && io_req_valid && tlb_miss ) begin // io_req_ready && io_req_valid && tlb_miss
      r_refill_tag      <= lookup_tag; 
      r_refill_waddr    <= repl_waddr; // 与plru_val寄存器有关
      r_req_vpn         <= io_req_bits_vpn;
      r_req_passthrough <= io_req_bits_passthrough;
      r_req_instruction <= io_req_bits_instruction;
      r_req_store       <= io_req_bits_store;
    end

    // 更新伪LRU寄存器
    if( io_req_valid && !tlb_miss )
      plru_val <= new_plru_val;

    if(reset) begin
      valid <= 8'h0;
    end else begin
      valid <= new_valid;
    end 
    // 对应表项的属性为设置，说明：更新的值已经考虑了io_ptw_resp_valid = 0的情况，所以不用写入条件判断之中
    u_array     <= new_u_array; // 对应项的u位置0
    sw_array    <= new_sw_array;
    sx_array    <= new_sx_array;
    sr_array    <= new_sr_array;
    xr_array    <= new_xr_array;
    cash_array  <= new_cash_array;
    dirty_array <= new_dirty_array;

    if(io_ptw_resp_valid) begin 
      // 如果PTW响应有效，则根据r_refill_waddr提供的表项位置，将GEN_0数据写入对应表项的PPN中
      if(3'h0 == r_refill_waddr) begin
        ppns_0 <= io_ptw_resp_bits_pte_ppn; // 即io_ptw_resp_bits_pte_ppn[19:0]
      end
      if(3'h1 == r_refill_waddr) begin
        ppns_1 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h2 == r_refill_waddr) begin
        ppns_2 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h3 == r_refill_waddr) begin
        ppns_3 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h4 == r_refill_waddr) begin
        ppns_4 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h5 == r_refill_waddr) begin
        ppns_5 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h6 == r_refill_waddr) begin
        ppns_6 <= io_ptw_resp_bits_pte_ppn;
      end
      if(3'h7 == r_refill_waddr) begin
        ppns_7 <= io_ptw_resp_bits_pte_ppn;
      end

      // 如果PTW响应有效，则根据r_refill_waddr提供的表项位置，将GEN_1数据写入对应表项的TAGS中
      if(3'h0 == r_refill_waddr) begin
        tags_0 <= r_refill_tag; // 即r_refill_tag[33:0]
      end
      if(3'h1 == r_refill_waddr) begin
        tags_1 <= r_refill_tag;
      end
      if(3'h2 == r_refill_waddr) begin
        tags_2 <= r_refill_tag;
      end
      if(3'h3 == r_refill_waddr) begin
        tags_3 <= r_refill_tag;
      end
      if(3'h4 == r_refill_waddr) begin
        tags_4 <= r_refill_tag;
      end
      if(3'h5 == r_refill_waddr) begin
        tags_5 <= r_refill_tag;
      end
      if(3'h6 == r_refill_waddr) begin
        tags_6 <= r_refill_tag;
      end
      if(3'h7 == r_refill_waddr) begin
        tags_7 <= r_refill_tag;
      end
    end    
  end

endmodule