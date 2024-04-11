library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_ps is
    Port ( distance : in integer;
           LED_D : out STD_LOGIC_VECTOR (4 downto 0));
end led_ps;

architecture Behavioral of led_ps is

    signal sig_led : STD_LOGIC_VECTOR (4 DOWNTO 0);

begin
    p_led : process(distance) is
begin
    if (distance <= 40) and (distance >=32)  
    then 
   
            LED_D(0) <='0';
            LED_D(1) <='0';
            LED_D(2) <='0';
            LED_D(3) <='0';
            LED_D(4) <='0';
            LED_D(5) <='0';
            LED_D(6) <='0';
            LED_D(7) <='0';
            LED_D(8) <='0';
            LED_D(9) <='0';
            LED_D(10) <='0';
            LED_D(11) <='0';
            LED_D(12) <='0';
            LED_D(13) <='0';
            LED_D(14) <='0';
            LED_D(15) <='0';
                          
    elsif (distance <=32) and (distance >=24)
    then  
            LED_D(0) <='1';
            LED_D(1) <='1';
            LED_D(2) <='1';
            LED_D(3) <='1';
            LED_D(4) <='0';
            LED_D(5) <='0';
            LED_D(6) <='0';
            LED_D(7) <='0';
            LED_D(8) <='0';
            LED_D(9) <='0';
            LED_D(10) <='0';
            LED_D(11) <='0';
            LED_D(12) <='0';
            LED_D(13) <='0';
            LED_D(14) <='0';
            LED_D(15) <='0';
                                        
    elsif (distance <=24) and (distance >=16)
    then 
            LED_D(0) <='1';
            LED_D(1) <='1';
            LED_D(2) <='1';
            LED_D(3) <='1';
            LED_D(4) <='1';
            LED_D(5) <='1';
            LED_D(6) <='1';
            LED_D(7) <='1';
            LED_D(8) <='0';
            LED_D(9) <='0';
            LED_D(10) <='0';
            LED_D(11) <='0';
            LED_D(12) <='0';
            LED_D(13) <='0';
            LED_D(14) <='0';
            LED_D(15) <='0';
                            
    elsif (distance <=16) and (distance >=8)
    then  
            LED_D(0) <='1';
            LED_D(1) <='1';
            LED_D(2) <='1';
            LED_D(3) <='1';
            LED_D(4) <='1';
            LED_D(5) <='1';
            LED_D(6) <='1';
            LED_D(7) <='1';
            LED_D(8) <='1';
            LED_D(9) <='1';
            LED_D(10) <='1';
            LED_D(11) <='1';
            LED_D(12) <='0';
            LED_D(13) <='0';
            LED_D(14) <='0';
            LED_D(15) <='0';
                   
    elsif (distance <=8) and (distance >=0)
    then
            LED_D(0) <='1';
            LED_D(1) <='1';
            LED_D(2) <='1';
            LED_D(3) <='1';
            LED_D(4) <='1';
            LED_D(5) <='1';
            LED_D(6) <='1';
            LED_D(7) <='1';
            LED_D(8) <='1';
            LED_D(9) <='1';
            LED_D(10) <='1';
            LED_D(11) <='1';
            LED_D(12) <='1';
            LED_D(13) <='1';
            LED_D(14) <='1';
            LED_D(15) <='1';
                                end if;
                                        end process p_led;
                                                end Behavioral;


