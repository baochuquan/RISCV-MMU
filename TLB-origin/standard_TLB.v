`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:05 01/19/2017 
// Design Name: 
// Module Name:    standard_TLB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module standard_TLB(
  input   clock,
  input   reset,
  output  io_req_ready,
  input   io_req_valid,
  input  [27:0] io_req_bits_vpn,
  input   io_req_bits_passthrough,
  input   io_req_bits_instruction,
  input   io_req_bits_store,
  output  io_resp_miss,
  output [19:0] io_resp_ppn,
  output  io_resp_xcpt_ld,
  output  io_resp_xcpt_st,
  output  io_resp_xcpt_if,
  output  io_resp_cacheable,
  input   io_ptw_req_ready,
  output  io_ptw_req_valid,
  output [1:0] io_ptw_req_bits_prv,
  output  io_ptw_req_bits_pum,
  output  io_ptw_req_bits_mxr,
  output [26:0] io_ptw_req_bits_addr,
  output  io_ptw_req_bits_store,
  output  io_ptw_req_bits_fetch,
  input   io_ptw_resp_valid,
  input  [15:0] io_ptw_resp_bits_pte_reserved_for_hardware,
  input  [37:0] io_ptw_resp_bits_pte_ppn,
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
  reg [7:0] valid;
  reg [31:0] GEN_58;
  reg [19:0] ppns_0;
  reg [31:0] GEN_62;
  reg [19:0] ppns_1;
  reg [31:0] GEN_64;
  reg [19:0] ppns_2;
  reg [31:0] GEN_65;
  reg [19:0] ppns_3;
  reg [31:0] GEN_66;
  reg [19:0] ppns_4;
  reg [31:0] GEN_67;
  reg [19:0] ppns_5;
  reg [31:0] GEN_68;
  reg [19:0] ppns_6;
  reg [31:0] GEN_69;
  reg [19:0] ppns_7;
  reg [31:0] GEN_70;
  reg [33:0] tags_0;
  reg [63:0] GEN_71;
  reg [33:0] tags_1;
  reg [63:0] GEN_72;
  reg [33:0] tags_2;
  reg [63:0] GEN_73;
  reg [33:0] tags_3;
  reg [63:0] GEN_74;
  reg [33:0] tags_4;
  reg [63:0] GEN_75;
  reg [33:0] tags_5;
  reg [63:0] GEN_76;
  reg [33:0] tags_6;
  reg [63:0] GEN_77;
  reg [33:0] tags_7;
  reg [63:0] GEN_78;
  reg [1:0] state;
  reg [31:0] GEN_79;
  reg [33:0] r_refill_tag;
  reg [63:0] GEN_80;
  reg [2:0] r_refill_waddr;
  reg [31:0] GEN_81;
  reg [27:0] r_req_vpn;
  reg [31:0] GEN_82;
  reg  r_req_passthrough;
  reg [31:0] GEN_83;
  reg  r_req_instruction;
  reg [31:0] GEN_84;
  reg  r_req_store;
  reg [31:0] GEN_85;
  wire  T_219;
  wire  do_mprv;
  wire [1:0] priv;
  wire  priv_s;
  wire  T_222;
  wire  T_224;
  wire  priv_uses_vm;
  wire [19:0] passthrough_ppn;
  wire [19:0] refill_ppn;
  wire [19:0] mpu_ppn;
  wire [31:0] GEN_57;
  wire [31:0] T_226;
  wire  T_230;
  wire [2:0] T_234;
  wire  T_236;
  wire  T_238;
  wire  T_239;
  wire [2:0] T_242;
  wire  T_244;
  wire  T_246;
  wire  T_247;
  wire [2:0] T_250;
  wire  T_252;
  wire  T_254;
  wire  T_255;
  wire [2:0] T_258;
  wire  T_260;
  wire  T_262;
  wire  T_263;
  wire [2:0] T_266;
  wire [2:0] T_271;
  wire [2:0] T_272;
  wire [2:0] T_273;
  wire [2:0] T_274;
  wire  prot_x;
  wire  prot_w;
  wire  prot_r;
  wire  T_282;
  wire  T_283;
  wire  T_284;
  wire [26:0] T_292;
  wire [33:0] lookup_tag;
  wire  T_294;
  wire  T_296;
  wire  T_298;
  wire  vm_enabled;
  wire  T_299;
  wire  T_300;
  wire  T_301;
  wire  hitsVec_0;
  wire  T_302;
  wire  T_303;
  wire  T_304;
  wire  hitsVec_1;
  wire  T_305;
  wire  T_306;
  wire  T_307;
  wire  hitsVec_2;
  wire  T_308;
  wire  T_309;
  wire  T_310;
  wire  hitsVec_3;
  wire  T_311;
  wire  T_312;
  wire  T_313;
  wire  hitsVec_4;
  wire  T_314;
  wire  T_315;
  wire  T_316;
  wire  hitsVec_5;
  wire  T_317;
  wire  T_318;
  wire  T_319;
  wire  hitsVec_6;
  wire  T_320;
  wire  T_321;
  wire  T_322;
  wire  hitsVec_7;
  wire  hitsVec_8;
  wire [1:0] T_324;
  wire [1:0] T_325;
  wire [3:0] T_326;
  wire [1:0] T_327;
  wire [1:0] T_328;
  wire [2:0] T_329;
  wire [4:0] T_330;
  wire [8:0] hits;
  reg [15:0] pte_array_reserved_for_hardware;
  reg [31:0] GEN_86;
  reg [37:0] pte_array_ppn;
  reg [63:0] GEN_87;
  reg [1:0] pte_array_reserved_for_software;
  reg [31:0] GEN_88;
  reg  pte_array_d;
  reg [31:0] GEN_89;
  reg  pte_array_a;
  reg [31:0] GEN_90;
  reg  pte_array_g;
  reg [31:0] GEN_91;
  reg  pte_array_u;
  reg [31:0] GEN_92;
  reg  pte_array_x;
  reg [31:0] GEN_93;
  reg  pte_array_w;
  reg [31:0] GEN_94;
  reg  pte_array_r;
  reg [31:0] GEN_95;
  reg  pte_array_v;
  reg [31:0] GEN_96;
  reg [7:0] u_array;
  reg [31:0] GEN_97;
  reg [7:0] sw_array;
  reg [31:0] GEN_98;
  reg [7:0] sx_array;
  reg [31:0] GEN_99;
  reg [7:0] sr_array;
  reg [31:0] GEN_100;
  reg [7:0] xr_array;
  reg [31:0] GEN_101;
  reg [7:0] cash_array;
  reg [31:0] GEN_102;
  reg [7:0] dirty_array;
  reg [31:0] GEN_103;
  wire [19:0] GEN_0;
  wire [19:0] GEN_2;
  wire [19:0] GEN_3;
  wire [19:0] GEN_4;
  wire [19:0] GEN_5;
  wire [19:0] GEN_6;
  wire [19:0] GEN_7;
  wire [19:0] GEN_8;
  wire [19:0] GEN_9;
  wire [33:0] GEN_1;
  wire [33:0] GEN_10;
  wire [33:0] GEN_11;
  wire [33:0] GEN_12;
  wire [33:0] GEN_13;
  wire [33:0] GEN_14;
  wire [33:0] GEN_15;
  wire [33:0] GEN_16;
  wire [33:0] GEN_17;
  wire [7:0] T_362;
  wire [7:0] T_363;
  wire [7:0] T_364;
  wire [7:0] T_365;
  wire [7:0] T_366;
  wire [7:0] T_367;
  wire  T_369;
  wire  T_370;
  wire  T_371;
  wire  T_372;
  wire  T_373;
  wire  T_374;
  wire [7:0] T_375;
  wire [7:0] T_377;
  wire [7:0] T_378;
  wire  T_384;
  wire  T_385;
  wire [7:0] T_386;
  wire [7:0] T_388;
  wire [7:0] T_389;
  wire  T_395;
  wire  T_396;
  wire [7:0] T_397;
  wire [7:0] T_399;
  wire [7:0] T_400;
  wire  T_407;
  wire [7:0] T_408;
  wire [7:0] T_410;
  wire [7:0] T_411;
  wire [7:0] T_412;
  wire [7:0] T_414;
  wire [7:0] T_415;
  wire [7:0] T_416;
  wire [7:0] T_418;
  wire [7:0] T_419;
  wire [19:0] GEN_18;
  wire [19:0] GEN_19;
  wire [19:0] GEN_20;
  wire [19:0] GEN_21;
  wire [19:0] GEN_22;
  wire [19:0] GEN_23;
  wire [19:0] GEN_24;
  wire [19:0] GEN_25;
  wire [33:0] GEN_26;
  wire [33:0] GEN_27;
  wire [33:0] GEN_28;
  wire [33:0] GEN_29;
  wire [33:0] GEN_30;
  wire [33:0] GEN_31;
  wire [33:0] GEN_32;
  wire [33:0] GEN_33;
  wire [7:0] GEN_34;
  wire [7:0] GEN_35;
  wire [7:0] GEN_36;
  wire [7:0] GEN_37;
  wire [7:0] GEN_38;
  wire [7:0] GEN_39;
  wire [7:0] GEN_40;
  wire [7:0] GEN_41;
  reg [7:0] T_421;
  reg [31:0] GEN_104;
  wire [7:0] T_422;
  wire  T_424;
  wire  T_426;
  wire  T_428;
  wire  T_429;
  wire  T_430;
  wire  T_431;
  wire  T_432;
  wire  T_433;
  wire  T_434;
  wire [2:0] T_444;
  wire [2:0] T_445;
  wire [2:0] T_446;
  wire [2:0] T_447;
  wire [2:0] T_448;
  wire [2:0] T_449;
  wire [2:0] T_450;
  wire [7:0] T_452;
  wire  T_453;
  wire [1:0] T_454;
  wire [7:0] T_455;
  wire  T_456;
  wire [2:0] T_457;
  wire [7:0] T_458;
  wire  T_459;
  wire [3:0] T_460;
  wire [2:0] T_461;
  wire [2:0] repl_waddr;
  wire [7:0] T_463;
  wire [7:0] T_464;
  wire [7:0] priv_ok;
  wire [7:0] T_465;
  wire [8:0] w_array;
  wire [7:0] T_466;
  wire [8:0] x_array;
  wire [7:0] T_468;
  wire [7:0] T_469;
  wire [7:0] T_470;
  wire [8:0] r_array;
  wire [8:0] c_array;
  wire  T_471;
  wire  T_472;
  wire  bad_va;
  wire [7:0] T_473;
  wire [8:0] T_475;
  wire [8:0] T_476;
  wire [8:0] GEN_59;
  wire [8:0] T_477;
  wire [8:0] GEN_60;
  wire [8:0] tlb_hits;
  wire  tlb_hit;
  wire  T_480;
  wire  T_481;
  wire  T_483;
  wire  tlb_miss;
  wire  T_485;
  wire  T_486;
  wire [3:0] T_488;
  wire [3:0] T_489;
  wire  T_491;
  wire [3:0] T_492;
  wire [1:0] T_493;
  wire [1:0] T_494;
  wire  T_496;
  wire [1:0] T_497;
  wire  T_498;
  wire [1:0] T_499;
  wire [2:0] T_500;
  wire  T_502;
  wire  T_504;
  wire [1:0] T_506;
  wire [7:0] GEN_61;
  wire [7:0] T_507;
  wire [7:0] T_508;
  wire [7:0] T_509;
  wire [7:0] T_510;
  wire [7:0] T_511;
  wire [1:0] T_512;
  wire  T_513;
  wire  T_515;
  wire [3:0] T_517;
  wire [7:0] GEN_63;
  wire [7:0] T_518;
  wire [7:0] T_519;
  wire [7:0] T_520;
  wire [7:0] T_521;
  wire [7:0] T_522;
  wire [2:0] T_523;
  wire  T_524;
  wire  T_526;
  wire [7:0] T_528;
  wire [7:0] T_529;
  wire [7:0] T_530;
  wire [7:0] T_531;
  wire [7:0] T_532;
  wire [7:0] T_533;
  wire [7:0] GEN_42;
  wire  T_535;
  wire [8:0] T_536;
  wire [8:0] T_537;
  wire  T_539;
  wire  T_540;
  wire [8:0] T_541;
  wire [8:0] T_542;
  wire  T_544;
  wire  T_545;
  wire [8:0] T_546;
  wire [8:0] T_547;
  wire  T_549;
  wire  T_550;
  wire [8:0] T_551;
  wire  T_553;
  wire  T_554;
  wire [19:0] T_556;
  wire [19:0] T_558;
  wire [19:0] T_560;
  wire [19:0] T_562;
  wire [19:0] T_564;
  wire [19:0] T_566;
  wire [19:0] T_568;
  wire [19:0] T_570;
  wire [19:0] T_572;
  wire [19:0] T_574;
  wire [19:0] T_575;
  wire [19:0] T_576;
  wire [19:0] T_577;
  wire [19:0] T_578;
  wire [19:0] T_579;
  wire [19:0] T_580;
  wire [19:0] T_581;
  wire [19:0] T_582;
  wire  T_583;
  wire  T_584;
  wire  T_585;
  wire [1:0] GEN_43;
  wire [33:0] GEN_44;
  wire [2:0] GEN_45;
  wire [27:0] GEN_46;
  wire  GEN_47;
  wire  GEN_48;
  wire  GEN_49;
  wire [1:0] GEN_50;
  wire [1:0] GEN_51;
  wire [1:0] GEN_52;
  wire [1:0] GEN_53;
  wire  T_587;
  wire  T_588;
  wire [1:0] GEN_54;
  wire [1:0] GEN_55;
  wire [7:0] GEN_56;
  assign io_req_ready = T_535;
  assign io_resp_miss = T_554;
  assign io_resp_ppn = T_582;
  assign io_resp_xcpt_ld = T_540;
  assign io_resp_xcpt_st = T_545;
  assign io_resp_xcpt_if = T_550;
  assign io_resp_cacheable = T_553;
  assign io_ptw_req_valid = T_583;
  assign io_ptw_req_bits_prv = io_ptw_status_prv;
  assign io_ptw_req_bits_pum = io_ptw_status_pum;
  assign io_ptw_req_bits_mxr = io_ptw_status_mxr;
  assign io_ptw_req_bits_addr = r_refill_tag[26:0];
  assign io_ptw_req_bits_store = r_req_store;
  assign io_ptw_req_bits_fetch = r_req_instruction;
  assign T_219 = io_req_bits_instruction == 1'h0;
  assign do_mprv = io_ptw_status_mprv & T_219;
  assign priv = do_mprv ? io_ptw_status_mpp : io_ptw_status_prv;
  assign priv_s = priv == 2'h1;
  assign T_222 = priv <= 2'h1;
  assign T_224 = io_ptw_status_debug == 1'h0;
  assign priv_uses_vm = T_222 & T_224;
  assign passthrough_ppn = io_req_bits_vpn[19:0];
  assign refill_ppn = io_ptw_resp_bits_pte_ppn[19:0];
  assign mpu_ppn = io_ptw_resp_valid ? refill_ppn : passthrough_ppn;
  assign GEN_57 = {{12'd0}, mpu_ppn};
  assign T_226 = GEN_57 << 12;
  assign T_230 = T_226 < 32'h1000;
  assign T_234 = T_230 ? 3'h7 : 3'h0;
  assign T_236 = 32'h1000 <= T_226;
  assign T_238 = T_226 < 32'h2000;
  assign T_239 = T_236 & T_238;
  assign T_242 = T_239 ? 3'h5 : 3'h0;
  assign T_244 = 32'h2000000 <= T_226;
  assign T_246 = T_226 < 32'h2010000;
  assign T_247 = T_244 & T_246;
  assign T_250 = T_247 ? 3'h3 : 3'h0;
  assign T_252 = 32'hc000000 <= T_226;
  assign T_254 = T_226 < 32'h10000000;
  assign T_255 = T_252 & T_254;
  assign T_258 = T_255 ? 3'h3 : 3'h0;
  assign T_260 = 32'h80000000 <= T_226;
  assign T_262 = T_226 < 32'h90000000;
  assign T_263 = T_260 & T_262;
  assign T_266 = T_263 ? 3'h7 : 3'h0;
  assign T_271 = T_234 | T_242;
  assign T_272 = T_271 | T_250;
  assign T_273 = T_272 | T_258;
  assign T_274 = T_273 | T_266;
  assign prot_x = T_284;
  assign prot_w = T_283;
  assign prot_r = T_282;
  assign T_282 = T_274[0];
  assign T_283 = T_274[1];
  assign T_284 = T_274[2];
  assign T_292 = io_req_bits_vpn[26:0];
  assign lookup_tag = {io_ptw_ptbr_asid,T_292};
  assign T_294 = io_ptw_status_vm[3];
  assign T_296 = T_294 & priv_uses_vm;
  assign T_298 = io_req_bits_passthrough == 1'h0;
  assign vm_enabled = T_296 & T_298;
  assign T_299 = valid[0];
  assign T_300 = T_299 & vm_enabled;
  assign T_301 = tags_0 == lookup_tag;
  assign hitsVec_0 = T_300 & T_301;
  assign T_302 = valid[1];
  assign T_303 = T_302 & vm_enabled;
  assign T_304 = tags_1 == lookup_tag;
  assign hitsVec_1 = T_303 & T_304;
  assign T_305 = valid[2];
  assign T_306 = T_305 & vm_enabled;
  assign T_307 = tags_2 == lookup_tag;
  assign hitsVec_2 = T_306 & T_307;
  assign T_308 = valid[3];
  assign T_309 = T_308 & vm_enabled;
  assign T_310 = tags_3 == lookup_tag;
  assign hitsVec_3 = T_309 & T_310;
  assign T_311 = valid[4];
  assign T_312 = T_311 & vm_enabled;
  assign T_313 = tags_4 == lookup_tag;
  assign hitsVec_4 = T_312 & T_313;
  assign T_314 = valid[5];
  assign T_315 = T_314 & vm_enabled;
  assign T_316 = tags_5 == lookup_tag;
  assign hitsVec_5 = T_315 & T_316;
  assign T_317 = valid[6];
  assign T_318 = T_317 & vm_enabled;
  assign T_319 = tags_6 == lookup_tag;
  assign hitsVec_6 = T_318 & T_319;
  assign T_320 = valid[7];
  assign T_321 = T_320 & vm_enabled;
  assign T_322 = tags_7 == lookup_tag;
  assign hitsVec_7 = T_321 & T_322;
  assign hitsVec_8 = vm_enabled == 1'h0;
  assign T_324 = {hitsVec_1,hitsVec_0};
  assign T_325 = {hitsVec_3,hitsVec_2};
  assign T_326 = {T_325,T_324};
  assign T_327 = {hitsVec_5,hitsVec_4};
  assign T_328 = {hitsVec_8,hitsVec_7};
  assign T_329 = {T_328,hitsVec_6};
  assign T_330 = {T_329,T_327};
  assign hits = {T_330,T_326};
  assign GEN_0 = io_ptw_resp_bits_pte_ppn[19:0];
  assign GEN_2 = 3'h0 == r_refill_waddr ? GEN_0 : ppns_0;
  assign GEN_3 = 3'h1 == r_refill_waddr ? GEN_0 : ppns_1;
  assign GEN_4 = 3'h2 == r_refill_waddr ? GEN_0 : ppns_2;
  assign GEN_5 = 3'h3 == r_refill_waddr ? GEN_0 : ppns_3;
  assign GEN_6 = 3'h4 == r_refill_waddr ? GEN_0 : ppns_4;
  assign GEN_7 = 3'h5 == r_refill_waddr ? GEN_0 : ppns_5;
  assign GEN_8 = 3'h6 == r_refill_waddr ? GEN_0 : ppns_6;
  assign GEN_9 = 3'h7 == r_refill_waddr ? GEN_0 : ppns_7;
  assign GEN_1 = r_refill_tag;
  assign GEN_10 = 3'h0 == r_refill_waddr ? GEN_1 : tags_0;
  assign GEN_11 = 3'h1 == r_refill_waddr ? GEN_1 : tags_1;
  assign GEN_12 = 3'h2 == r_refill_waddr ? GEN_1 : tags_2;
  assign GEN_13 = 3'h3 == r_refill_waddr ? GEN_1 : tags_3;
  assign GEN_14 = 3'h4 == r_refill_waddr ? GEN_1 : tags_4;
  assign GEN_15 = 3'h5 == r_refill_waddr ? GEN_1 : tags_5;
  assign GEN_16 = 3'h6 == r_refill_waddr ? GEN_1 : tags_6;
  assign GEN_17 = 3'h7 == r_refill_waddr ? GEN_1 : tags_7;
  assign T_362 = 8'h1 << r_refill_waddr;
  assign T_363 = valid | T_362;
  assign T_364 = u_array | T_362;
  assign T_365 = ~ T_362;
  assign T_366 = u_array & T_365;
  assign T_367 = io_ptw_resp_bits_pte_u ? T_364 : T_366;
  assign T_369 = io_ptw_resp_bits_pte_w == 1'h0;
  assign T_370 = io_ptw_resp_bits_pte_x & T_369;
  assign T_371 = io_ptw_resp_bits_pte_r | T_370;
  assign T_372 = io_ptw_resp_bits_pte_v & T_371;
  assign T_373 = T_372 & io_ptw_resp_bits_pte_w;
  assign T_374 = T_373 & prot_w;
  assign T_375 = sw_array | T_362;
  assign T_377 = sw_array & T_365;
  assign T_378 = T_374 ? T_375 : T_377;
  assign T_384 = T_372 & io_ptw_resp_bits_pte_x;
  assign T_385 = T_384 & prot_x;
  assign T_386 = sx_array | T_362;
  assign T_388 = sx_array & T_365;
  assign T_389 = T_385 ? T_386 : T_388;
  assign T_395 = T_372 & io_ptw_resp_bits_pte_r;
  assign T_396 = T_395 & prot_r;
  assign T_397 = sr_array | T_362;
  assign T_399 = sr_array & T_365;
  assign T_400 = T_396 ? T_397 : T_399;
  assign T_407 = T_384 & prot_r;
  assign T_408 = xr_array | T_362;
  assign T_410 = xr_array & T_365;
  assign T_411 = T_407 ? T_408 : T_410;
  assign T_412 = cash_array | T_362;
  assign T_414 = cash_array & T_365;
  assign T_415 = T_263 ? T_412 : T_414;
  assign T_416 = dirty_array | T_362;
  assign T_418 = dirty_array & T_365;
  assign T_419 = io_ptw_resp_bits_pte_d ? T_416 : T_418;
  assign GEN_18 = io_ptw_resp_valid ? GEN_2 : ppns_0;
  assign GEN_19 = io_ptw_resp_valid ? GEN_3 : ppns_1;
  assign GEN_20 = io_ptw_resp_valid ? GEN_4 : ppns_2;
  assign GEN_21 = io_ptw_resp_valid ? GEN_5 : ppns_3;
  assign GEN_22 = io_ptw_resp_valid ? GEN_6 : ppns_4;
  assign GEN_23 = io_ptw_resp_valid ? GEN_7 : ppns_5;
  assign GEN_24 = io_ptw_resp_valid ? GEN_8 : ppns_6;
  assign GEN_25 = io_ptw_resp_valid ? GEN_9 : ppns_7;
  assign GEN_26 = io_ptw_resp_valid ? GEN_10 : tags_0;
  assign GEN_27 = io_ptw_resp_valid ? GEN_11 : tags_1;
  assign GEN_28 = io_ptw_resp_valid ? GEN_12 : tags_2;
  assign GEN_29 = io_ptw_resp_valid ? GEN_13 : tags_3;
  assign GEN_30 = io_ptw_resp_valid ? GEN_14 : tags_4;
  assign GEN_31 = io_ptw_resp_valid ? GEN_15 : tags_5;
  assign GEN_32 = io_ptw_resp_valid ? GEN_16 : tags_6;
  assign GEN_33 = io_ptw_resp_valid ? GEN_17 : tags_7;
  assign GEN_34 = io_ptw_resp_valid ? T_363 : valid;
  assign GEN_35 = io_ptw_resp_valid ? T_367 : u_array;
  assign GEN_36 = io_ptw_resp_valid ? T_378 : sw_array;
  assign GEN_37 = io_ptw_resp_valid ? T_389 : sx_array;
  assign GEN_38 = io_ptw_resp_valid ? T_400 : sr_array;
  assign GEN_39 = io_ptw_resp_valid ? T_411 : xr_array;
  assign GEN_40 = io_ptw_resp_valid ? T_415 : cash_array;
  assign GEN_41 = io_ptw_resp_valid ? T_419 : dirty_array;
  assign T_422 = ~ valid;
  assign T_424 = T_422 == 8'h0;
  assign T_426 = T_424 == 1'h0;
  assign T_428 = T_422[0];
  assign T_429 = T_422[1];
  assign T_430 = T_422[2];
  assign T_431 = T_422[3];
  assign T_432 = T_422[4];
  assign T_433 = T_422[5];
  assign T_434 = T_422[6];
  assign T_444 = T_434 ? 3'h6 : 3'h7;
  assign T_445 = T_433 ? 3'h5 : T_444;
  assign T_446 = T_432 ? 3'h4 : T_445;
  assign T_447 = T_431 ? 3'h3 : T_446;
  assign T_448 = T_430 ? 3'h2 : T_447;
  assign T_449 = T_429 ? 3'h1 : T_448;
  assign T_450 = T_428 ? 3'h0 : T_449;
  assign T_452 = T_421 >> 1'h1;
  assign T_453 = T_452[0];
  assign T_454 = {1'h1,T_453};
  assign T_455 = T_421 >> T_454;
  assign T_456 = T_455[0];
  assign T_457 = {T_454,T_456};
  assign T_458 = T_421 >> T_457;
  assign T_459 = T_458[0];
  assign T_460 = {T_457,T_459};
  assign T_461 = T_460[2:0];
  assign repl_waddr = T_426 ? T_450 : T_461;
  assign T_463 = io_ptw_status_pum ? u_array : 8'h0;
  assign T_464 = ~ T_463;
  assign priv_ok = priv_s ? T_464 : u_array;
  assign T_465 = priv_ok & sw_array;
  assign w_array = {prot_w,T_465};
  assign T_466 = priv_ok & sx_array;
  assign x_array = {prot_x,T_466};
  assign T_468 = io_ptw_status_mxr ? xr_array : 8'h0;
  assign T_469 = sr_array | T_468;
  assign T_470 = priv_ok & T_469;
  assign r_array = {prot_r,T_470};
  assign c_array = {T_263,cash_array};
  assign T_471 = io_req_bits_vpn[27];
  assign T_472 = io_req_bits_vpn[26];
  assign bad_va = T_471 != T_472;
  assign T_473 = hits[7:0];
  assign T_475 = io_req_bits_store ? w_array : 9'h0;
  assign T_476 = ~ T_475;
  assign GEN_59 = {{1'd0}, dirty_array};
  assign T_477 = GEN_59 | T_476;
  assign GEN_60 = {{1'd0}, T_473};
  assign tlb_hits = GEN_60 & T_477;
  assign tlb_hit = tlb_hits != 9'h0;
  assign T_480 = bad_va == 1'h0;
  assign T_481 = vm_enabled & T_480;
  assign T_483 = tlb_hit == 1'h0;
  assign tlb_miss = T_481 & T_483;
  assign T_485 = tlb_miss == 1'h0;
  assign T_486 = io_req_valid & T_485;
  assign T_488 = T_473[7:4];
  assign T_489 = T_473[3:0];
  assign T_491 = T_488 != 4'h0;
  assign T_492 = T_488 | T_489;
  assign T_493 = T_492[3:2];
  assign T_494 = T_492[1:0];
  assign T_496 = T_493 != 2'h0;
  assign T_497 = T_493 | T_494;
  assign T_498 = T_497[1];
  assign T_499 = {T_496,T_498};
  assign T_500 = {T_491,T_499};
  assign T_502 = T_500[2];
  assign T_504 = T_502 == 1'h0;
  assign T_506 = 2'h1 << 1'h1;
  assign GEN_61 = {{6'd0}, T_506};
  assign T_507 = T_421 | GEN_61;
  assign T_508 = ~ T_421;
  assign T_509 = T_508 | GEN_61;
  assign T_510 = ~ T_509;
  assign T_511 = T_504 ? T_507 : T_510;
  assign T_512 = {1'h1,T_502};
  assign T_513 = T_500[1];
  assign T_515 = T_513 == 1'h0;
  assign T_517 = 4'h1 << T_512;
  assign GEN_63 = {{4'd0}, T_517};
  assign T_518 = T_511 | GEN_63;
  assign T_519 = ~ T_511;
  assign T_520 = T_519 | GEN_63;
  assign T_521 = ~ T_520;
  assign T_522 = T_515 ? T_518 : T_521;
  assign T_523 = {T_512,T_513};
  assign T_524 = T_500[0];
  assign T_526 = T_524 == 1'h0;
  assign T_528 = 8'h1 << T_523;
  assign T_529 = T_522 | T_528;
  assign T_530 = ~ T_522;
  assign T_531 = T_530 | T_528;
  assign T_532 = ~ T_531;
  assign T_533 = T_526 ? T_529 : T_532;
  assign GEN_42 = T_486 ? T_533 : T_421;
  assign T_535 = state == 2'h0;
  assign T_536 = ~ r_array;
  assign T_537 = T_536 & hits;
  assign T_539 = T_537 != 9'h0;
  assign T_540 = bad_va | T_539;
  assign T_541 = ~ w_array;
  assign T_542 = T_541 & hits;
  assign T_544 = T_542 != 9'h0;
  assign T_545 = bad_va | T_544;
  assign T_546 = ~ x_array;
  assign T_547 = T_546 & hits;
  assign T_549 = T_547 != 9'h0;
  assign T_550 = bad_va | T_549;
  assign T_551 = c_array & hits;
  assign T_553 = T_551 != 9'h0;
  assign T_554 = io_ptw_resp_valid | tlb_miss;
  assign T_556 = hitsVec_0 ? ppns_0 : 20'h0;
  assign T_558 = hitsVec_1 ? ppns_1 : 20'h0;
  assign T_560 = hitsVec_2 ? ppns_2 : 20'h0;
  assign T_562 = hitsVec_3 ? ppns_3 : 20'h0;
  assign T_564 = hitsVec_4 ? ppns_4 : 20'h0;
  assign T_566 = hitsVec_5 ? ppns_5 : 20'h0;
  assign T_568 = hitsVec_6 ? ppns_6 : 20'h0;
  assign T_570 = hitsVec_7 ? ppns_7 : 20'h0;
  assign T_572 = hitsVec_8 ? passthrough_ppn : 20'h0;
  assign T_574 = T_556 | T_558;
  assign T_575 = T_574 | T_560;
  assign T_576 = T_575 | T_562;
  assign T_577 = T_576 | T_564;
  assign T_578 = T_577 | T_566;
  assign T_579 = T_578 | T_568;
  assign T_580 = T_579 | T_570;
  assign T_581 = T_580 | T_572;
  assign T_582 = T_581;
  assign T_583 = state == 2'h1;
  assign T_584 = io_req_ready & io_req_valid;
  assign T_585 = T_584 & tlb_miss;
  assign GEN_43 = T_585 ? 2'h1 : state;
  assign GEN_44 = T_585 ? lookup_tag : r_refill_tag;
  assign GEN_45 = T_585 ? repl_waddr : r_refill_waddr;
  assign GEN_46 = T_585 ? io_req_bits_vpn : r_req_vpn;
  assign GEN_47 = T_585 ? io_req_bits_passthrough : r_req_passthrough;
  assign GEN_48 = T_585 ? io_req_bits_instruction : r_req_instruction;
  assign GEN_49 = T_585 ? io_req_bits_store : r_req_store;
  assign GEN_50 = io_ptw_invalidate ? 2'h0 : GEN_43;
  assign GEN_51 = io_ptw_invalidate ? 2'h3 : 2'h2;
  assign GEN_52 = io_ptw_req_ready ? GEN_51 : GEN_50;
  assign GEN_53 = T_583 ? GEN_52 : GEN_43;
  assign T_587 = state == 2'h2;
  assign T_588 = T_587 & io_ptw_invalidate;
  assign GEN_54 = T_588 ? 2'h3 : GEN_53;
  assign GEN_55 = io_ptw_resp_valid ? 2'h0 : GEN_54;
  assign GEN_56 = io_ptw_invalidate ? 8'h0 : GEN_34;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_58 = {1{$random}};
  valid = GEN_58[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_62 = {1{$random}};
  ppns_0 = GEN_62[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_64 = {1{$random}};
  ppns_1 = GEN_64[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_65 = {1{$random}};
  ppns_2 = GEN_65[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_66 = {1{$random}};
  ppns_3 = GEN_66[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_67 = {1{$random}};
  ppns_4 = GEN_67[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_68 = {1{$random}};
  ppns_5 = GEN_68[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_69 = {1{$random}};
  ppns_6 = GEN_69[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_70 = {1{$random}};
  ppns_7 = GEN_70[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_71 = {2{$random}};
  tags_0 = GEN_71[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_72 = {2{$random}};
  tags_1 = GEN_72[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_73 = {2{$random}};
  tags_2 = GEN_73[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_74 = {2{$random}};
  tags_3 = GEN_74[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_75 = {2{$random}};
  tags_4 = GEN_75[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_76 = {2{$random}};
  tags_5 = GEN_76[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_77 = {2{$random}};
  tags_6 = GEN_77[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_78 = {2{$random}};
  tags_7 = GEN_78[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_79 = {1{$random}};
  state = GEN_79[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_80 = {2{$random}};
  r_refill_tag = GEN_80[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_81 = {1{$random}};
  r_refill_waddr = GEN_81[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_82 = {1{$random}};
  r_req_vpn = GEN_82[27:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_83 = {1{$random}};
  r_req_passthrough = GEN_83[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_84 = {1{$random}};
  r_req_instruction = GEN_84[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_85 = {1{$random}};
  r_req_store = GEN_85[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_86 = {1{$random}};
  pte_array_reserved_for_hardware = GEN_86[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_87 = {2{$random}};
  pte_array_ppn = GEN_87[37:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_88 = {1{$random}};
  pte_array_reserved_for_software = GEN_88[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_89 = {1{$random}};
  pte_array_d = GEN_89[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_90 = {1{$random}};
  pte_array_a = GEN_90[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_91 = {1{$random}};
  pte_array_g = GEN_91[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_92 = {1{$random}};
  pte_array_u = GEN_92[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_93 = {1{$random}};
  pte_array_x = GEN_93[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_94 = {1{$random}};
  pte_array_w = GEN_94[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_95 = {1{$random}};
  pte_array_r = GEN_95[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_96 = {1{$random}};
  pte_array_v = GEN_96[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_97 = {1{$random}};
  u_array = GEN_97[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_98 = {1{$random}};
  sw_array = GEN_98[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_99 = {1{$random}};
  sx_array = GEN_99[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_100 = {1{$random}};
  sr_array = GEN_100[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_101 = {1{$random}};
  xr_array = GEN_101[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_102 = {1{$random}};
  cash_array = GEN_102[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_103 = {1{$random}};
  dirty_array = GEN_103[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_104 = {1{$random}};
  T_421 = GEN_104[7:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(reset) begin
      valid <= 8'h0;
    end else begin
      if(io_ptw_invalidate) begin
        valid <= 8'h0;
      end else begin
        if(io_ptw_resp_valid) begin
          valid <= T_363;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h0 == r_refill_waddr) begin
          ppns_0 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h1 == r_refill_waddr) begin
          ppns_1 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h2 == r_refill_waddr) begin
          ppns_2 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h3 == r_refill_waddr) begin
          ppns_3 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h4 == r_refill_waddr) begin
          ppns_4 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h5 == r_refill_waddr) begin
          ppns_5 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h6 == r_refill_waddr) begin
          ppns_6 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h7 == r_refill_waddr) begin
          ppns_7 <= GEN_0;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h0 == r_refill_waddr) begin
          tags_0 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h1 == r_refill_waddr) begin
          tags_1 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h2 == r_refill_waddr) begin
          tags_2 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h3 == r_refill_waddr) begin
          tags_3 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h4 == r_refill_waddr) begin
          tags_4 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h5 == r_refill_waddr) begin
          tags_5 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h6 == r_refill_waddr) begin
          tags_6 <= GEN_1;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(3'h7 == r_refill_waddr) begin
          tags_7 <= GEN_1;
        end
      end
    end
    if(reset) begin
      state <= 2'h0;
    end else begin
      if(io_ptw_resp_valid) begin
        state <= 2'h0;
      end else begin
        if(T_588) begin
          state <= 2'h3;
        end else begin
          if(T_583) begin
            if(io_ptw_req_ready) begin
              if(io_ptw_invalidate) begin
                state <= 2'h3;
              end else begin
                state <= 2'h2;
              end
            end else begin
              if(io_ptw_invalidate) begin
                state <= 2'h0;
              end else begin
                if(T_585) begin
                  state <= 2'h1;
                end
              end
            end
          end else begin
            if(T_585) begin
              state <= 2'h1;
            end
          end
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        r_refill_tag <= lookup_tag;
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        if(T_426) begin
          if(T_428) begin
            r_refill_waddr <= 3'h0;
          end else begin
            if(T_429) begin
              r_refill_waddr <= 3'h1;
            end else begin
              if(T_430) begin
                r_refill_waddr <= 3'h2;
              end else begin
                if(T_431) begin
                  r_refill_waddr <= 3'h3;
                end else begin
                  if(T_432) begin
                    r_refill_waddr <= 3'h4;
                  end else begin
                    if(T_433) begin
                      r_refill_waddr <= 3'h5;
                    end else begin
                      if(T_434) begin
                        r_refill_waddr <= 3'h6;
                      end else begin
                        r_refill_waddr <= 3'h7;
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          r_refill_waddr <= T_461;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        r_req_vpn <= io_req_bits_vpn;
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        r_req_passthrough <= io_req_bits_passthrough;
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        r_req_instruction <= io_req_bits_instruction;
      end
    end
    if(1'h0) begin
    end else begin
      if(T_585) begin
        r_req_store <= io_req_bits_store;
      end
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(io_ptw_resp_bits_pte_u) begin
          u_array <= T_364;
        end else begin
          u_array <= T_366;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(T_374) begin
          sw_array <= T_375;
        end else begin
          sw_array <= T_377;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(T_385) begin
          sx_array <= T_386;
        end else begin
          sx_array <= T_388;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(T_396) begin
          sr_array <= T_397;
        end else begin
          sr_array <= T_399;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(T_407) begin
          xr_array <= T_408;
        end else begin
          xr_array <= T_410;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(T_263) begin
          cash_array <= T_412;
        end else begin
          cash_array <= T_414;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(io_ptw_resp_valid) begin
        if(io_ptw_resp_bits_pte_d) begin
          dirty_array <= T_416;
        end else begin
          dirty_array <= T_418;
        end
      end
    end
    if(1'h0) begin
    end else begin
      if(T_486) begin
        if(T_526) begin
          T_421 <= T_529;
        end else begin
          T_421 <= T_532;
        end
      end
    end
  end
endmodule
