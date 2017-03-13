library verilog;
use verilog.vl_types.all;
entity plru_unit is
    port(
        hit_bit         : in     vl_logic_vector(7 downto 0);
        plru            : in     vl_logic_vector(7 downto 0);
        new_plru        : out    vl_logic_vector(7 downto 0)
    );
end plru_unit;
