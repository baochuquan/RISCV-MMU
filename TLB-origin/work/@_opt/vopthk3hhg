library verilog;
use verilog.vl_types.all;
entity v_p_trans_arbi is
    port(
        io_req_bits_instruction: in     vl_logic;
        io_ptw_status_mprv: in     vl_logic;
        io_ptw_status_mpp: in     vl_logic_vector(1 downto 0);
        io_ptw_status_prv: in     vl_logic_vector(1 downto 0);
        io_ptw_status_debug: in     vl_logic;
        io_ptw_status_vm_3: in     vl_logic;
        io_req_bits_passthrough: in     vl_logic;
        priv_s          : out    vl_logic;
        vm_enabled      : out    vl_logic
    );
end v_p_trans_arbi;
