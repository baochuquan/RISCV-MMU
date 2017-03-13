library verilog;
use verilog.vl_types.all;
entity tlb_replace is
    port(
        valid           : in     vl_logic_vector(7 downto 0);
        plru_val        : in     vl_logic_vector(7 downto 0);
        repl_waddr      : out    vl_logic_vector(2 downto 0)
    );
end tlb_replace;
