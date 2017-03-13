library verilog;
use verilog.vl_types.all;
entity ppn_generate is
    port(
        ppns_0          : in     vl_logic_vector(19 downto 0);
        ppns_1          : in     vl_logic_vector(19 downto 0);
        ppns_2          : in     vl_logic_vector(19 downto 0);
        ppns_3          : in     vl_logic_vector(19 downto 0);
        ppns_4          : in     vl_logic_vector(19 downto 0);
        ppns_5          : in     vl_logic_vector(19 downto 0);
        ppns_6          : in     vl_logic_vector(19 downto 0);
        ppns_7          : in     vl_logic_vector(19 downto 0);
        passthrough_ppn : in     vl_logic_vector(19 downto 0);
        hitsVec         : in     vl_logic_vector(8 downto 0);
        io_resp_ppn     : out    vl_logic_vector(19 downto 0)
    );
end ppn_generate;
