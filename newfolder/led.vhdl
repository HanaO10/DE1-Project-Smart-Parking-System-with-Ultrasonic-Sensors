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
    if (distance <= 30) and (distance >=28)  
    then 
    sig_led <= b"0000";
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
                
                    
   elsif (distance >=26) and (distance <=28)
    then 
    sig_led <= b"0001";
                    end if;
                    
  elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"0010";
                    end if;
                    
 elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"0100";
                    end if;
                    
elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"0101";
                    end if;
                    
 elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"0110";
                    end if;
                    
elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"0111";
                    end if;
                    
    elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"1000";
                    end if;
                    
    elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"1001";
                    end if;
                    
    elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"1010";
                    end if;
                    
  elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"1011";
                    end if;
                    
    elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"1100";
                    end if;
                    
elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"1101";
                    end if;
                    
  elsif (distance =>0) and (distance <=2)
    then  
    sig_led <= b"1110";
                    end if;
    
    
    elsif (distance =>0) and (distance <=2)
    then 
    sig_led <= b"1111";
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
         end if;
            end process p_led;
                    end Behavioral;
