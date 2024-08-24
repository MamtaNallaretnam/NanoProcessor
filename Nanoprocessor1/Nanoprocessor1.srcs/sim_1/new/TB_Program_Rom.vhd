----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:19:51 PM
-- Design Name: 
-- Module Name: TB_Program_Rom - Behavioral
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

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is
COMPONENT Program_ROM 
PORT ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal mem_add: STD_LOGIC_VECTOR (2 downto 0);
signal ins : STD_LOGIC_VECTOR (11 downto 0);


begin
    UUT : Program_ROM 
    PORT MAP( address => mem_add,
              data => ins 
              );
    process begin
    
    mem_add <= "000";
    wait for 100 ns;
    
    mem_add <= "001";
    wait for 100 ns;
    
    mem_add <= "011";
    wait for 100 ns;
    
    mem_add <= "010";
    wait for 100 ns;
    
    mem_add <= "101";
    wait;
    
    end process;
              



end Behavioral;
