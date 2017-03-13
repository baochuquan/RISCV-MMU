library verilog;
use verilog.vl_types.all;
entity plru is
    port(
        hits            : in     vl_logic_vector(8 downto 0);
        plru_val        : in     vl_logic_vector(7 downto 0);
        new_plru_val    : out    vl_logic_vector(7 downto 0)
    );
end plru;
