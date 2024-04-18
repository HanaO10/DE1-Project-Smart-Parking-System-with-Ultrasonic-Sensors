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
    Port ( TRIG : out STD_LOGIC;
           ECHO : in STD_LOGIC;
           clk  : in std_logic;
           rst   : in    std_logic;                          
           distance : out INTEGER RANGE 0 TO 40;
           en    : in    std_logic);
end HS_SR04;

architecture Behavioral of HS_SR04 is
type   state_type is (START, WAIT1, COUNTER, CONTROL,WAIT2, LEDSEG);
    signal state : state_type; --! FSM state
signal sig_count : integer;
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
                            state     <= WAIT1;
                            
                            
                        

                    when WAIT1 =>
                        if (ECHO = '1') then
                           state <= COUNTER;
                           
                           sig_count <= 0; 
                            
                        end if;

                    when COUNTER =>
          
                        

                        -- Clock enable activated
                        if (ECHO = '1') then
                        sig_count <= sig_count + 1;
                        elsif (ECHO = '0') then
                        state <= CONTROL;
                        
            
                        end if;
                       

                    when CONTROL =>
                            
                            distance <= (sig_count * SOUND_SPEED / 2) ;
                          
                         state <= LEDSEG;  
                        

                    -- Prevent unhandled cases
                    when others =>
                        null;

                end case;

            end if;
        end if;

    end process p_fsm;
    
end Behavioral;
