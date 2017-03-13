library verilog;
use verilog.vl_types.all;
entity index_address_generate_unit is
    port(
        r_pte_ppn       : in     vl_logic_vector(37 downto 0);
        count           : in     vl_logic_vector(1 downto 0);
        r_req_addr      : in     vl_logic_vector(26 downto 0);
        pte_addr        : out    vl_logic_vector(49 downto 0)
    );
end index_address_generate_unit;
