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

    Port ( TRIG : out STD_LOGIC;
           ECHO : in STD_LOGIC;
           clk  : in std_logic;
           rst   : in    std_logic;
                                   
           distance : out INTEGER RANGE 0 TO 100;
           en    : in    std_logic);
end HS_SR04;

architecture Behavioral of HS_SR04 is
type   state_type is (START, WAIT1, COUNTER, CONTROL,WAIT2, TRIGWAIT);
    signal state : state_type; --! FSM state
signal sig_count : integer;
signal sig_watchdog : integer;
signal sig_dist : std_logic;
constant SOUND_SPEED : INTEGER :=343;
begin


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
                            TRIG <='1';
                            state     <= TRIGWAIT;
                            sig_count <=0;
                            sig_watchdog <= 0;
                            
                     when TRIGWAIT =>
                     sig_count <= sig_count + 1;
                     if (sig_count > 1000) then
                     TRIG <='0';
                     sig_count <= 0; 
                    state     <= WAIT1;
                    end if;
                    when WAIT1 =>
                        if (ECHO = '1') then
                           state <= COUNTER;
                           
                           
                         else 
                         sig_watchdog <= sig_watchdog + 1;
                         if (sig_watchdog > 4000000) then
                         state <= START;
                         end if;
                        end if;

                    when COUNTER =>
          
                        

                        -- Clock enable activated
                        if (ECHO = '1') then
                        sig_count <= sig_count + 1;
                        elsif (ECHO = '0') then
                        state <= CONTROL;
                        
            
                        end if;
                       

                    when CONTROL =>
                            if (sig_count < 2299999) then
                            distance <= (((sig_count/10000) * SOUND_SPEED) / (1000*2)) ;
                          else
                          distance <=99;
                          end if;
                         state <= START;  
                    
                    -- Prevent unhandled cases
                    when others =>
                        null;

                end case;

            end if;
        end if;

    end process p_fsm;
    
end Behavioral;
