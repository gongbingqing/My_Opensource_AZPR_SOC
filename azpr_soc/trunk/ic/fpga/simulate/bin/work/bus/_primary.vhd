library verilog;
use verilog.vl_types.all;
entity \bus\ is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        m0_req_n        : in     vl_logic;
        m0_grant_n      : out    vl_logic;
        m0_addr         : in     vl_logic_vector(29 downto 0);
        m0_as_n         : in     vl_logic;
        m0_rw           : in     vl_logic;
        m0_wr_data      : in     vl_logic_vector(31 downto 0);
        m1_req_n        : in     vl_logic;
        m1_grant_n      : out    vl_logic;
        m1_addr         : in     vl_logic_vector(29 downto 0);
        m1_as_n         : in     vl_logic;
        m1_rw           : in     vl_logic;
        m1_wr_data      : in     vl_logic_vector(31 downto 0);
        m2_req_n        : in     vl_logic;
        m2_grant_n      : out    vl_logic;
        m2_addr         : in     vl_logic_vector(29 downto 0);
        m2_as_n         : in     vl_logic;
        m2_rw           : in     vl_logic;
        m2_wr_data      : in     vl_logic_vector(31 downto 0);
        m3_req_n        : in     vl_logic;
        m3_grant_n      : out    vl_logic;
        m3_addr         : in     vl_logic_vector(29 downto 0);
        m3_as_n         : in     vl_logic;
        m3_rw           : in     vl_logic;
        m3_wr_data      : in     vl_logic_vector(31 downto 0);
        s_addr          : out    vl_logic_vector(29 downto 0);
        s_as_n          : out    vl_logic;
        s_rw            : out    vl_logic;
        s_wr_data       : out    vl_logic_vector(31 downto 0);
        s0_cs_n         : out    vl_logic;
        s0_rd_data      : in     vl_logic_vector(31 downto 0);
        s0_rdy_n        : in     vl_logic;
        s1_cs_n         : out    vl_logic;
        s1_rd_data      : in     vl_logic_vector(31 downto 0);
        s1_rdy_n        : in     vl_logic;
        s2_cs_n         : out    vl_logic;
        s2_rd_data      : in     vl_logic_vector(31 downto 0);
        s2_rdy_n        : in     vl_logic;
        s3_cs_n         : out    vl_logic;
        s3_rd_data      : in     vl_logic_vector(31 downto 0);
        s3_rdy_n        : in     vl_logic;
        s4_cs_n         : out    vl_logic;
        s4_rd_data      : in     vl_logic_vector(31 downto 0);
        s4_rdy_n        : in     vl_logic;
        s5_cs_n         : out    vl_logic;
        s5_rd_data      : in     vl_logic_vector(31 downto 0);
        s5_rdy_n        : in     vl_logic;
        s6_cs_n         : out    vl_logic;
        s6_rd_data      : in     vl_logic_vector(31 downto 0);
        s6_rdy_n        : in     vl_logic;
        s7_cs_n         : out    vl_logic;
        s7_rd_data      : in     vl_logic_vector(31 downto 0);
        s7_rdy_n        : in     vl_logic;
        m_rd_data       : out    vl_logic_vector(31 downto 0);
        m_rdy_n         : out    vl_logic
    );
end \bus\;