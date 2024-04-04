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
 use ieee.std_logic_unsigned.all;

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
           distance : out INTEGER RANGE 0 TO 30;
           pos_edge : out   std_logic;
           neg_edge : out   std_logic;
           en    : in    std_logic;                          
           count : out   std_logic_vector(NBIT - 1 downto 0));
end HS_SR04;

architecture Behavioral of HS_SR04 is
type   state_type is (START, WAIT1, COUNTER, CONTROL,WAIT2, LEDSEG);
    signal state : state_type; --! FSM state
signal sig_count : unsigned (NBIT - 1 downto 0);
signal sig_echo : std_logic;
signal sig_trig : std_logic;
signal sig_clean : std_logic; 
signal sig_delayed : std_logic;
signal sig_dist : std_logic;
constant SOUND_SPEED : INTEGER :=343;
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
     p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
            -- Active-high reset
            if (rst = '1') then
                state <= START;
            -- Clock enable
            elsif (en = '1') then
                -- Define transitions between states
                case state is

                    when START =>
                        if (sig_trig = '1') then
                            
                            state     <= WAIT1;
                            
                            
                        end if;

                    when WAIT1 =>
                        if (sig_echo = '1') then
                           state <= COUNTER;
                           sig_count <= (others => '0'); 
                            
                        end if;

                    when COUNTER =>
          
                        

                        -- Clock enable activated
                        if (sig_echo = '1') then
                        sig_count <= sig_count + 1;
                        elsif (sig_echo = '0') then
                        state <= CONTROL;
                        
            
                        end if;
                       

                    when CONTROL =>
                        if (sig_dist = not'0') then
                            distance <= to_integer((sig_count * SOUND_SPEED) / 100000 );
                          else
                         state <= LEDSEG;  
                        end if;

                    -- Prevent unhandled cases
                    when others =>
                        null;

                end case;

            end if;
        end if;

    end process p_fsm;
    pos_edge <= sig_clean and not(sig_delayed);
    neg_edge <= not(sig_clean) and sig_delayed;
end Behavioral;
