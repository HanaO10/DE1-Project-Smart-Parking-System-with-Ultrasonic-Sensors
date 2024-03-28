----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 01:12:33 PM
-- Design Name: 
-- Module Name: HS_SR04 - Behavioral
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
 use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HS_SR04 is
generic (
        NBIT : integer := 3 --! Default number of counter bits
    );
    Port ( TRIG : in STD_LOGIC;
           ECHO : in STD_LOGIC;
           clk  : in std_logic;
           rst   : in    std_logic;                          
           distance : out STD_LOGIC_VECTOR (5 downto 0);
           pos_edge : out   std_logic;
           neg_edge : out   std_logic;
           en    : in    std_logic;                          
           count : out   std_logic_vector(NBIT - 1 downto 0));
end HS_SR04;

architecture Behavioral of HS_SR04 is
signal sig_count : unsigned (NBIT - 1 downto 0);
signal sig_echo : std_logic;
signal sig_trig : std_logic;
signal sig_clean : std_logic; 
signal sig_delayed : std_logic;
begin
p_HS_SR04 : process (clk)is 
begin
if (rising_edge(clk)) then
        sig_trig <= '1' ; 
     if sig_echo = '1' then         
    
           end if ;
           end if;     
end process p_HS_SR04;

 p_simple_counter : process (clk) is
    begin

        if (rising_edge(clk)) then
            -- Synchronous, active-high reset
            if (rst = '1') then
                sig_count <= (others => '0');

            -- Clock enable activated
            elsif (sig_echo = '1') then
                sig_count <= sig_count + 1;

            -- Each `if` must end by `end if`
            end if;
        end if;

    end process p_simple_counter;
     p_edge_detector : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                sig_delayed <= '0';
            else
                sig_delayed <= sig_clean;
            end if;
        end if;

    end process p_edge_detector;
    pos_edge <= sig_clean and not(sig_delayed);
    neg_edge <= not(sig_clean) and sig_delayed;
end Behavioral;
