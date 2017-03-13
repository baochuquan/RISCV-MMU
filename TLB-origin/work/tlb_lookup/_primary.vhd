library verilog;
use verilog.vl_types.all;
entity tlb_lookup is
    port(
        io_ptw_ptbr_asid: in     vl_logic_vector(6 downto 0);
        io_req_bits_vpn : in     vl_logic_vector(26 downto 0);
        tags_0          : in     vl_logic_vector(33 downto 0);
        tags_1          : in     vl_logic_vector(33 downto 0);
        tags_2          : in     vl_logic_vector(33 downto 0);
        tags_3          : in     vl_logic_vector(33 downto 0);
        tags_4          : in     vl_logic_vector(33 downto 0);
        tags_5          : in     vl_logic_vector(33 downto 0);
        tags_6          : in     vl_logic_vector(33 downto 0);
        tags_7          : in     vl_logic_vector(33 downto 0);
        valid           : in     vl_logic_vector(7 downto 0);
        dirty_hit_check : in     vl_logic_vector(8 downto 0);
        vm_enabled      : in     vl_logic;
        bad_va          : in     vl_logic;
        lookup_tag      : out    vl_logic_vector(33 downto 0);
        hitsVec         : out    vl_logic_vector(8 downto 0);
        hits            : out    vl_logic_vector(8 downto 0);
        tlb_miss        : out    vl_logic
    );
end tlb_lookup;
