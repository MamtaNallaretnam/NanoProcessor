----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 10:58:48 AM
-- Design Name: 
-- Module Name: TB_SevenSeg_LUT_16_7 - Behavioral
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

entity TB_SevenSeg_LUT_16_7 is
--  Port ( );
end TB_SevenSeg_LUT_16_7;

architecture Behavioral of TB_SevenSeg_LUT_16_7 is
component SevenSeg_LUT_16_7 
PORT ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0)
);
end component;

signal add : STD_LOGIC_VECTOR (3 downto 0);
signal d : STD_LOGIC_VECTOR (6 downto 0);

begin
    UUT : SevenSeg_LUT_16_7
    PORT MAP ( address => add,
               data => d
    );

    process begin
    
    add <= "0001";
    wait for 100 ns;

    add <= "0011";
    wait for 100 ns;
    
    add <= "1010";
    wait for 100 ns;    
    
    add <= "0101";
    wait for 100 ns;
    
    end process;
    


end Behavioral;
