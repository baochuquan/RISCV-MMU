library verilog;
use verilog.vl_types.all;
entity mem_wire_path is
    port(
        io_mem_resp_bits_data: in     vl_logic_vector(63 downto 0);
        pte_addr        : in     vl_logic_vector(49 downto 0);
        r_req_store     : in     vl_logic;
        state           : in     vl_logic_vector(2 downto 0);
        s1_kill         : in     vl_logic;
        pte_reserved_for_hardware: out    vl_logic_vector(15 downto 0);
        pte_ppn         : out    vl_logic_vector(37 downto 0);
        pte_reserved_for_software: out    vl_logic_vector(1 downto 0);
        pte_d           : out    vl_logic;
        pte_a           : out    vl_logic;
        pte_g           : out    vl_logic;
        pte_u           : out    vl_logic;
        pte_x           : out    vl_logic;
        pte_w           : out    vl_logic;
        pte_r           : out    vl_logic;
        pte_v           : out    vl_logic;
        io_mem_req_bits_addr: out    vl_logic_vector(39 downto 0);
        io_mem_req_bits_tag: out    vl_logic_vector(6 downto 0);
        io_mem_req_bits_typ: out    vl_logic_vector(2 downto 0);
        io_mem_req_bits_phys: out    vl_logic;
        io_mem_req_bits_data: out    vl_logic_vector(63 downto 0);
        io_mem_s1_kill  : out    vl_logic;
        io_mem_invalidate_lr: out    vl_logic;
        io_mem_req_bits_cmd: out    vl_logic_vector(4 downto 0);
        io_mem_req_valid: out    vl_logic;
        io_mem_s1_data  : out    vl_logic_vector(63 downto 0)
    );
end mem_wire_path;
