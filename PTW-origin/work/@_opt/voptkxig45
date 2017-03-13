library verilog;
use verilog.vl_types.all;
entity RRArbiter is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        io_in_0_ready   : out    vl_logic;
        io_in_0_valid   : in     vl_logic;
        io_in_0_bits_prv: in     vl_logic_vector(1 downto 0);
        io_in_0_bits_pum: in     vl_logic;
        io_in_0_bits_mxr: in     vl_logic;
        io_in_0_bits_addr: in     vl_logic_vector(26 downto 0);
        io_in_0_bits_store: in     vl_logic;
        io_in_0_bits_fetch: in     vl_logic;
        io_in_1_ready   : out    vl_logic;
        io_in_1_valid   : in     vl_logic;
        io_in_1_bits_prv: in     vl_logic_vector(1 downto 0);
        io_in_1_bits_pum: in     vl_logic;
        io_in_1_bits_mxr: in     vl_logic;
        io_in_1_bits_addr: in     vl_logic_vector(26 downto 0);
        io_in_1_bits_store: in     vl_logic;
        io_in_1_bits_fetch: in     vl_logic;
        io_out_ready    : in     vl_logic;
        io_out_valid    : out    vl_logic;
        io_out_bits_prv : out    vl_logic_vector(1 downto 0);
        io_out_bits_pum : out    vl_logic;
        io_out_bits_mxr : out    vl_logic;
        io_out_bits_addr: out    vl_logic_vector(26 downto 0);
        io_out_bits_store: out    vl_logic;
        io_out_bits_fetch: out    vl_logic;
        io_chosen       : out    vl_logic
    );
end RRArbiter;
