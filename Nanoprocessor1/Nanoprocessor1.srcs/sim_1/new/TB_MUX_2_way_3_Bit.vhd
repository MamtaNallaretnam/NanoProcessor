----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:25:21 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_3_Bit - Behavioral
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

entity TB_MUX_2_way_3_Bit is
--  Port ( );
end TB_MUX_2_way_3_Bit;

architecture Behavioral of TB_MUX_2_way_3_Bit is

COMPONENT MUX_2_way_3_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0); 
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC; 
           Q : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;
SIGNAL IN0,IN1,OP :STD_LOGIC_VECTOR (2 downto 0);
SIGNAL S : STD_LOGIC; 
begin
UUT : MUX_2_way_3_Bit
    PORT MAP(
            I0 => IN0,
            I1 => IN1,
            S => S,
            Q => OP       
            );
PROCESS BEGIN
    IN0 <= "000";
    IN1 <= "001";
    S <= '0';
    WAIT FOR 100NS;
    
    IN0 <= "100";
    IN1 <= "101";
    S <= '1';
    WAIT FOR 100NS;
    
    S <= '0';
    WAIT FOR 100NS;
    
    IN0 <= "110";
    IN1 <= "010";
    S <= '0';
    WAIT FOR 100NS;

END PROCESS;
end Behavioral;