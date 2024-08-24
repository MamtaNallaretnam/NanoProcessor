----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 10:59:50 AM
-- Design Name: 
-- Module Name: TB_Slow_Clk - Behavioral
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

entity TB_Slow_Clk is
--  Port ( );
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is

component Slow_Clk
PORT ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
       
end component;

signal clk_in : STD_LOGIC :='0'; 
signal clk_out : STD_LOGIC ; 

begin

    UUT: Slow_Clk
        PORT MAP( Clk_in => clk_in,
                Clk_out => clk_out
        );
    process
    
    begin
    clk_in <= NOT(clk_in);
    wait for 20 ns;
    
    end process;
    


end Behavioral;