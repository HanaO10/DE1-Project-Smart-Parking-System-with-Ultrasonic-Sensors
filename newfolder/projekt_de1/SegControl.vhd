----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 09:10:23 AM
-- Design Name: 
-- Module Name: SegControl - Behavioral
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

entity SegControl is
    Port ( Dist1 : in integer range 0 to 99;
           Dist2 : in integer range 0 to 99;
           Dist3 : in integer range 0 to 99;
           Dist4 : in integer range 0 to 99;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           dist_out : out integer range 0 to 10);
end SegControl;

architecture Behavioral of SegControl is

signal sig_count : integer range 0 to 7;

begin


    SegSer : process (clk) is
    begin

        if (rising_edge(clk)) then
            if (rst = '1') then
                sig_count <= 0;
                dist_out <= 0;

            elsif (rst = '0') then
                if (sig_count < 7) then
                    sig_count <= sig_count + 1;
                    case sig_count is 
                    when 0 => 
                    dist_out <= dist1 / 10;
                    AN <= b"0111_1111"; 
                     when 1 => 
                    dist_out <= dist1 mod 10;
                    AN <= b"1011_1111";
                     when 2 => 
                    dist_out <= dist2 / 10;
                    AN <= b"1101_1111"; 
                     when 3 => 
                    dist_out <= dist2 mod 10;
                    AN <= b"1110_1111"; 
                     when 4 => 
                    dist_out <= dist3 / 10;
                    AN <= b"1111_0111"; 
                     when 5 => 
                    dist_out <= dist3 mod 10;
                    AN <= b"1111_1011"; 
                     when 6 => 
                    dist_out <= dist4 / 10;
                    AN <= b"0111_1101"; 
                     when 7 => 
                    dist_out <= dist4 mod 10;
                    AN <= b"1111_1110"; 
                    end case;
                else
                    sig_count <= 0;
                end if;
            end if;
            
        end if;

    end process SegSer;


end Behavioral;
