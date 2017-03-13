library verilog;
use verilog.vl_types.all;
entity cache_search_unit is
    port(
        pte_ppn         : in     vl_logic_vector(37 downto 0);
        hit_bit         : in     vl_logic_vector(7 downto 0);
        replace_entry   : in     vl_logic_vector(2 downto 0);
        ppn_7           : in     vl_logic_vector(19 downto 0);
        ppn_6           : in     vl_logic_vector(19 downto 0);
        ppn_5           : in     vl_logic_vector(19 downto 0);
        ppn_4           : in     vl_logic_vector(19 downto 0);
        ppn_3           : in     vl_logic_vector(19 downto 0);
        ppn_2           : in     vl_logic_vector(19 downto 0);
        ppn_1           : in     vl_logic_vector(19 downto 0);
        ppn_0           : in     vl_logic_vector(19 downto 0);
        pte_cache_data  : out    vl_logic_vector(19 downto 0)
    );
end cache_search_unit;
