library verilog;
use verilog.vl_types.all;
entity id_stage is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        gpr_rd_data_0   : in     vl_logic_vector(31 downto 0);
        gpr_rd_data_1   : in     vl_logic_vector(31 downto 0);
        gpr_rd_addr_0   : out    vl_logic_vector(4 downto 0);
        gpr_rd_addr_1   : out    vl_logic_vector(4 downto 0);
        ex_en           : in     vl_logic;
        ex_fwd_data     : in     vl_logic_vector(31 downto 0);
        ex_dst_addr     : in     vl_logic_vector(4 downto 0);
        ex_gpr_we_n     : in     vl_logic;
        mem_fwd_data    : in     vl_logic_vector(31 downto 0);
        exe_mode        : in     vl_logic_vector(0 downto 0);
        creg_rd_data    : in     vl_logic_vector(31 downto 0);
        creg_rd_addr    : out    vl_logic_vector(4 downto 0);
        stall           : in     vl_logic;
        flush           : in     vl_logic;
        br_addr         : out    vl_logic_vector(29 downto 0);
        br_taken        : out    vl_logic;
        ld_hazard       : out    vl_logic;
        if_pc           : in     vl_logic_vector(29 downto 0);
        if_insn         : in     vl_logic_vector(31 downto 0);
        if_en           : in     vl_logic;
        id_pc           : out    vl_logic_vector(29 downto 0);
        id_en           : out    vl_logic;
        id_alu_op       : out    vl_logic_vector(3 downto 0);
        id_alu_in_0     : out    vl_logic_vector(31 downto 0);
        id_alu_in_1     : out    vl_logic_vector(31 downto 0);
        id_br_flag      : out    vl_logic;
        id_mem_op       : out    vl_logic_vector(1 downto 0);
        id_mem_wr_data  : out    vl_logic_vector(31 downto 0);
        id_ctrl_op      : out    vl_logic_vector(1 downto 0);
        id_dst_addr     : out    vl_logic_vector(4 downto 0);
        id_gpr_we_n     : out    vl_logic;
        id_exp_code     : out    vl_logic_vector(2 downto 0)
    );
end id_stage;
