library verilog;
use verilog.vl_types.all;
entity tlb_req_trans is
    port(
        state           : in     vl_logic_vector(1 downto 0);
        io_ptw_resp_valid: in     vl_logic;
        tlb_miss        : in     vl_logic;
        r_refill_tag    : in     vl_logic_vector(33 downto 0);
        r_req_instruction: in     vl_logic;
        r_req_store     : in     vl_logic;
        io_ptw_status_pum: in     vl_logic;
        io_ptw_status_mxr: in     vl_logic;
        io_ptw_status_prv: in     vl_logic_vector(1 downto 0);
        io_req_ready    : out    vl_logic;
        io_ptw_req_valid: out    vl_logic;
        io_resp_miss    : out    vl_logic;
        io_ptw_req_bits_addr: out    vl_logic_vector(26 downto 0);
        io_ptw_req_bits_fetch: out    vl_logic;
        io_ptw_req_bits_store: out    vl_logic;
        io_ptw_req_bits_pum: out    vl_logic;
        io_ptw_req_bits_mxr: out    vl_logic;
        io_ptw_req_bits_prv: out    vl_logic_vector(1 downto 0)
    );
end tlb_req_trans;
