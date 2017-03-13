library verilog;
use verilog.vl_types.all;
entity permission_privilege_check_unit is
    port(
        r_req_store     : in     vl_logic;
        r_req_fetch     : in     vl_logic;
        r_req_prv       : in     vl_logic_vector(1 downto 0);
        r_req_mxr       : in     vl_logic;
        r_req_pum       : in     vl_logic;
        pte_r           : in     vl_logic;
        pte_w           : in     vl_logic;
        pte_x           : in     vl_logic;
        pte_v           : in     vl_logic;
        pte_u           : in     vl_logic;
        access_ok       : out    vl_logic
    );
end permission_privilege_check_unit;
