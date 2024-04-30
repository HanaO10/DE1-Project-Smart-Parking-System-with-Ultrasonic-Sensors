-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 12:09:44 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_led_ps is
end tb_led_ps;

architecture tb of tb_led_ps is

    component led_ps
        port (distance : in integer;
              LED_D    : out std_logic_vector (15 downto 0));
    end component;

    signal sig_distance : integer;
    signal sig_LED_D    : std_logic_vector (15 downto 0);

begin

    dut : led_ps
    port map (distance => sig_distance,
              LED_D    => sig_LED_D);

    stimuli : process
    begin
        sig_distance <= 0;
        wait for 100ns;
        sig_distance <= 8;
        wait for 100ns;
        sig_distance <= 7;
        wait for 100ns;
        sig_distance <= 16;
        wait for 100ns;
        sig_distance <= 24;
        wait for 100ns;
        sig_distance <= 32;
        wait for 100ns;
        sig_distance <= 39;
        wait for 100ns;
        wait;
    end process;

end tb;

configuration cfg_tb_led_ps of tb_led_ps is
    for tb
    end for;
end cfg_tb_led_ps;