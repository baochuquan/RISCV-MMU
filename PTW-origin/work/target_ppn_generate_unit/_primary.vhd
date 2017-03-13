library verilog;
use verilog.vl_types.all;
entity target_ppn_generate_unit is
    port(
        count           : in     vl_logic_vector(1 downto 0);
        pte_addr        : in     vl_logic_vector(49 downto 0);
        r_req_addr      : in     vl_logic_vector(27 downto 0);
        resp_ppn        : out    vl_logic_vector(37 downto 0)
    );
end target_ppn_generate_unit;
