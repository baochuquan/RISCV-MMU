library verilog;
use verilog.vl_types.all;
entity cache_hit_judge_unit is
    port(
        count           : in     vl_logic_vector(1 downto 0);
        valid           : in     vl_logic_vector(7 downto 0);
        pte_addr        : in     vl_logic_vector(49 downto 0);
        tag_7           : in     vl_logic_vector(31 downto 0);
        tag_6           : in     vl_logic_vector(31 downto 0);
        tag_5           : in     vl_logic_vector(31 downto 0);
        tag_4           : in     vl_logic_vector(31 downto 0);
        tag_3           : in     vl_logic_vector(31 downto 0);
        tag_2           : in     vl_logic_vector(31 downto 0);
        tag_1           : in     vl_logic_vector(31 downto 0);
        tag_0           : in     vl_logic_vector(31 downto 0);
        hit             : out    vl_logic;
        hit_bit         : out    vl_logic_vector(7 downto 0);
        pte_cache_hit   : out    vl_logic
    );
end cache_hit_judge_unit;
