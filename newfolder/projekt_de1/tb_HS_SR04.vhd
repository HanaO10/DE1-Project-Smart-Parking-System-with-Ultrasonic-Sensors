
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 11:07:42 UTC

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity tb_HS_SR04 is
end tb_HS_SR04;

architecture tb of tb_HS_SR04 is

    component HS_SR04
    generic (
            nbit : integer
        );
        port (TRIG     : out std_logic;
              ECHO     : in std_logic;
              clk      : in std_logic;
              rst      : in std_logic;
              distance : out integer;
              en       : in std_logic
              );
    end component;
    constant nbit : integer := 10;
    signal sig_trig     : std_logic;
    signal sig_echo     : std_logic;
    signal sig_clk      : std_logic;
    signal sig_rst      : std_logic;
    signal sig_distance : integer;
    signal sig_en       : std_logic;
    signal sig_count : integer;

    constant TbPeriod : time := 5800 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : HS_SR04
    generic map (
            nbit
        )
    port map (TRIG     => sig_TRIG,
              ECHO     => sig_ECHO,
              clk      => sig_clk,
              rst      => sig_rst,
              distance => sig_distance,
              
              en       => sig_en
              );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    sig_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_rst <= '1';
       wait for 100ns;
       sig_rst <='0';
       wait for 100ns;
       sig_en <='1';
        -- EDIT Add stimuli here
       sig_echo <='1';
       wait for 20ms;
       sig_echo <='0';
       wait for 2ms;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_HS_SR04 of tb_HS_SR04 is
    for tb
    end for;
end cfg_tb_HS_SR04;