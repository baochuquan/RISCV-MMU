library verilog;
use verilog.vl_types.all;
entity no_leaf_pte_check_unit is
    port(
        pte_v           : in     vl_logic;
        pte_r           : in     vl_logic;
        pte_w           : in     vl_logic;
        pte_x           : in     vl_logic;
        is_pte_table    : out    vl_logic
    );
end no_leaf_pte_check_unit;
