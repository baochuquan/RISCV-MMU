module v_addr_check
(
   input io_req_bits_vpn_27 ,
   input io_req_bits_vpn_26 ,
   output bad_va
);
assign bad_va=io_req_bits_vpn_27!=io_req_bits_vpn_26;

endmodule

