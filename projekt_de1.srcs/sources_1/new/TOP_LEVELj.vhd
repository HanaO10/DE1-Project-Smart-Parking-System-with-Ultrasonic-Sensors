----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 11:33:48 AM
-- Design Name: 
-- Module Name: TOP_LEVELj - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_LEVELj is
    Port ( BTNC : in STD_LOGIC;
        LED   : out   std_logic_vector(15 downto 0);
        JD1 : out std_logic;
       JD2 : in std_logic;
        CA    : out   std_logic;                    --! Cathode of segment A
        CB    : out   std_logic;                    --! Cathode of segment B
        CC    : out   std_logic;                    --! Cathode of segment C
        CD    : out   std_logic;                    --! Cathode of segment D
        CE    : out   std_logic;                    --! Cathode of segment E
        CF    : out   std_logic;                    --! Cathode of segment F
        CG    : out   std_logic;                    --! Cathode of segment G
        DP    : out   std_logic;                    --! Decimal point
        AN    : out   std_logic_vector(7 downto 0); --! Common anodes of all on-board displays
          CLK100MHZ: in STD_LOGIC);
end TOP_LEVELj;

architecture Behavioral of TOP_LEVELj is
component led_ps is
    Port ( distance : in integer;
           LED_D : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component HS_SR04 is

    Port ( TRIG : out STD_LOGIC;
           ECHO : in STD_LOGIC;
           clk  : in std_logic;
           rst   : in    std_logic;
                                   
           distance : out INTEGER RANGE 0 TO 100;
           en    : in    std_logic);
end component;
component clock_enable is
    generic (
        N_PERIODS : integer := 3 --! Default number of clk periodes to generate one pulse
    );
    port (
        clk   : in    std_logic; --! Main clock
        rst   : in    std_logic; --! High-active synchronous reset
        pulse : out   std_logic  --! Clock enable pulse signal
    );
end component;
component int2seg is
    Port ( num : in integer;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           clear : in STD_LOGIC);
end component;
component Controler4Seg is
    Port ( Dist1 : in integer range 0 to 99;
           Dist2 : in integer range 0 to 99;
           Dist3 : in integer range 0 to 99;
           Dist4 : in integer range 0 to 99;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           dist_out : out integer range 0 to 10);
end component;
signal sig_pulse : std_logic;
signal sig_dist1 : INTEGER;
signal sig_dist2 : INTEGER;
signal sig_dist3 : INTEGER;
signal sig_dist4 : INTEGER;
signal sig_distout : INTEGER;
signal sig_en : std_logic;
signal sig_echo : std_logic;
begin
clk_en : component clock_enable
        generic map (
            N_PERIODS => 200_000
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => sig_pulse
        );
HS_SR041 : component HS_SR04 

     port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            TRIG => JD1,
            ECHO => JD2,
            en => sig_en,
            distance => sig_dist1
        );
int2seg1 : component int2seg 

     port map (
            num   => sig_distout,
            clear => BTNC,
            seg(6) => CA,
            seg(5) => CB,
            seg(4) => CC,
            seg(3) => CD,
            seg(2) => CE,
            seg(1) => CF,
            seg(0) => CG
        );
led_ps1 : component led_ps 

     port map (
            distance   => sig_dist1,
           LED_D => LED
        );
 Contoler : component Controler4Seg

     port map (
            Dist1   => sig_dist1,
            Dist2   => sig_dist2,
            Dist3   => sig_dist3,
            Dist4   => sig_dist4,
            clk => sig_pulse,
            AN => AN,
            rst => BTNC,
            dist_out => sig_distout
        );
  sig_en <= '1';
  sig_dist2 <= 99 ;
  sig_dist3 <= 99;
  sig_dist4 <= 99;
  DP <= '1';
  
end Behavioral;
