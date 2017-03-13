library verilog;
use verilog.vl_types.all;
entity cacheable_check is
    port(
        cash_array      : in     vl_logic_vector(7 downto 0);
        cacheable_buf   : in     vl_logic;
        hits            : in     vl_logic_vector(8 downto 0);
        io_resp_cacheable: out    vl_logic
    );
end cacheable_check;
