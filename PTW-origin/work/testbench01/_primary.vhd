library verilog;
use verilog.vl_types.all;
entity testbench01 is
    generic(
        test_number01   : integer := 1;
        test_number02   : integer := 12
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of test_number01 : constant is 1;
    attribute mti_svvh_generic_type of test_number02 : constant is 1;
end testbench01;
