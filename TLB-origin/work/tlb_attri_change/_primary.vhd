library verilog;
use verilog.vl_types.all;
entity tlb_attri_change is
    port(
        r_refill_waddr  : in     vl_logic_vector(2 downto 0);
        io_ptw_invalidate: in     vl_logic;
        io_ptw_resp_valid: in     vl_logic;
        io_ptw_resp_bits_pte_v: in     vl_logic;
        io_ptw_resp_bits_pte_u: in     vl_logic;
        io_ptw_resp_bits_pte_w: in     vl_logic;
        io_ptw_resp_bits_pte_x: in     vl_logic;
        io_ptw_resp_bits_pte_r: in     vl_logic;
        io_ptw_resp_bits_pte_d: in     vl_logic;
        valid           : in     vl_logic_vector(7 downto 0);
        u_array         : in     vl_logic_vector(7 downto 0);
        sw_array        : in     vl_logic_vector(7 downto 0);
        sr_array        : in     vl_logic_vector(7 downto 0);
        sx_array        : in     vl_logic_vector(7 downto 0);
        xr_array        : in     vl_logic_vector(7 downto 0);
        cash_array      : in     vl_logic_vector(7 downto 0);
        dirty_array     : in     vl_logic_vector(7 downto 0);
        prot_w          : in     vl_logic;
        prot_x          : in     vl_logic;
        prot_r          : in     vl_logic;
        cacheable_buf   : in     vl_logic;
        new_valid       : out    vl_logic_vector(7 downto 0);
        new_u_array     : out    vl_logic_vector(7 downto 0);
        new_sw_array    : out    vl_logic_vector(7 downto 0);
        new_sx_array    : out    vl_logic_vector(7 downto 0);
        new_sr_array    : out    vl_logic_vector(7 downto 0);
        new_xr_array    : out    vl_logic_vector(7 downto 0);
        new_cash_array  : out    vl_logic_vector(7 downto 0);
        new_dirty_array : out    vl_logic_vector(7 downto 0)
    );
end tlb_attri_change;
