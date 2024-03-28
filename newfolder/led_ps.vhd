


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_ps is
    Port ( distance : in STD_LOGIC;
           clock :in STD_LOGIC;
           reset: in  STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (4 downto 0));
end led_ps;

architecture Behavioral of led_ps is

begin

p_led : process


end Behavioral;
