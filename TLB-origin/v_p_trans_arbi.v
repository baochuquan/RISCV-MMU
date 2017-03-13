module v_p_trans_arbi(
  input io_req_bits_instruction,
  input io_ptw_status_mprv,
  input [1:0] io_ptw_status_mpp,
  input [1:0] io_ptw_status_prv,
  input io_ptw_status_debug,
  input io_ptw_status_vm_3,
  input io_req_bits_passthrough,
  
  output priv_s,
  output vm_enabled
  );

  wire do_mprv;
  wire priv;
  wire priv_uses_vm;
   
  assign do_mprv = io_ptw_status_mprv & (io_req_bits_instruction == 1'h0);
  assign priv = do_mprv ? io_ptw_status_mpp : io_ptw_status_prv;
  assign priv_s = priv == 2'h1;
  assign priv_uses_vm = (priv <= 2'h1) & (io_ptw_status_debug == 1'h0);
  assign vm_enabled = (io_ptw_status_vm_3 & priv_uses_vm) & (io_req_bits_passthrough == 1'h0);

endmodule