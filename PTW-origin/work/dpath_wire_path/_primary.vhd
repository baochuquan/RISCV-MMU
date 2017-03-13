library verilog;
use verilog.vl_types.all;
entity dpath_wire_path is
    port(
        io_dpath_ptbr_asid: in     vl_logic_vector(6 downto 0);
        io_dpath_ptbr_ppn: in     vl_logic_vector(37 downto 0);
        io_dpath_invalidate: in     vl_logic;
        io_dpath_status_debug: in     vl_logic;
        io_dpath_status_isa: in     vl_logic_vector(31 downto 0);
        io_dpath_status_prv: in     vl_logic_vector(1 downto 0);
        io_dpath_status_sd: in     vl_logic;
        io_dpath_status_zero3: in     vl_logic_vector(30 downto 0);
        io_dpath_status_sd_rv32: in     vl_logic;
        io_dpath_status_zero2: in     vl_logic_vector(1 downto 0);
        io_dpath_status_vm: in     vl_logic_vector(4 downto 0);
        io_dpath_status_zero1: in     vl_logic_vector(3 downto 0);
        io_dpath_status_mxr: in     vl_logic;
        io_dpath_status_pum: in     vl_logic;
        io_dpath_status_mprv: in     vl_logic;
        io_dpath_status_xs: in     vl_logic_vector(1 downto 0);
        io_dpath_status_fs: in     vl_logic_vector(1 downto 0);
        io_dpath_status_mpp: in     vl_logic_vector(1 downto 0);
        io_dpath_status_hpp: in     vl_logic_vector(1 downto 0);
        io_dpath_status_spp: in     vl_logic;
        io_dpath_status_mpie: in     vl_logic;
        io_dpath_status_hpie: in     vl_logic;
        io_dpath_status_spie: in     vl_logic;
        io_dpath_status_upie: in     vl_logic;
        io_dpath_status_mie: in     vl_logic;
        io_dpath_status_hie: in     vl_logic;
        io_dpath_status_sie: in     vl_logic;
        io_dpath_status_uie: in     vl_logic;
        io_requestor_0_ptbr_asid: out    vl_logic_vector(6 downto 0);
        io_requestor_0_ptbr_ppn: out    vl_logic_vector(37 downto 0);
        io_requestor_0_invalidate: out    vl_logic;
        io_requestor_0_status_debug: out    vl_logic;
        io_requestor_0_status_isa: out    vl_logic_vector(31 downto 0);
        io_requestor_0_status_prv: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_sd: out    vl_logic;
        io_requestor_0_status_zero3: out    vl_logic_vector(30 downto 0);
        io_requestor_0_status_sd_rv32: out    vl_logic;
        io_requestor_0_status_zero2: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_vm: out    vl_logic_vector(4 downto 0);
        io_requestor_0_status_zero1: out    vl_logic_vector(3 downto 0);
        io_requestor_0_status_mxr: out    vl_logic;
        io_requestor_0_status_pum: out    vl_logic;
        io_requestor_0_status_mprv: out    vl_logic;
        io_requestor_0_status_xs: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_fs: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_mpp: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_hpp: out    vl_logic_vector(1 downto 0);
        io_requestor_0_status_spp: out    vl_logic;
        io_requestor_0_status_mpie: out    vl_logic;
        io_requestor_0_status_hpie: out    vl_logic;
        io_requestor_0_status_spie: out    vl_logic;
        io_requestor_0_status_upie: out    vl_logic;
        io_requestor_0_status_mie: out    vl_logic;
        io_requestor_0_status_hie: out    vl_logic;
        io_requestor_0_status_sie: out    vl_logic;
        io_requestor_0_status_uie: out    vl_logic;
        io_requestor_1_ptbr_asid: out    vl_logic_vector(6 downto 0);
        io_requestor_1_ptbr_ppn: out    vl_logic_vector(37 downto 0);
        io_requestor_1_invalidate: out    vl_logic;
        io_requestor_1_status_debug: out    vl_logic;
        io_requestor_1_status_isa: out    vl_logic_vector(31 downto 0);
        io_requestor_1_status_prv: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_sd: out    vl_logic;
        io_requestor_1_status_zero3: out    vl_logic_vector(30 downto 0);
        io_requestor_1_status_sd_rv32: out    vl_logic;
        io_requestor_1_status_zero2: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_vm: out    vl_logic_vector(4 downto 0);
        io_requestor_1_status_zero1: out    vl_logic_vector(3 downto 0);
        io_requestor_1_status_mxr: out    vl_logic;
        io_requestor_1_status_pum: out    vl_logic;
        io_requestor_1_status_mprv: out    vl_logic;
        io_requestor_1_status_xs: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_fs: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_mpp: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_hpp: out    vl_logic_vector(1 downto 0);
        io_requestor_1_status_spp: out    vl_logic;
        io_requestor_1_status_mpie: out    vl_logic;
        io_requestor_1_status_hpie: out    vl_logic;
        io_requestor_1_status_spie: out    vl_logic;
        io_requestor_1_status_upie: out    vl_logic;
        io_requestor_1_status_mie: out    vl_logic;
        io_requestor_1_status_hie: out    vl_logic;
        io_requestor_1_status_sie: out    vl_logic;
        io_requestor_1_status_uie: out    vl_logic
    );
end dpath_wire_path;