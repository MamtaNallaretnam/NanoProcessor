----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:24:25 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_4_Bit - Behavioral
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

entity TB_MUX_2_way_4_Bit is
--  Port ( );
end TB_MUX_2_way_4_Bit;

architecture Behavioral of TB_MUX_2_way_4_Bit is
COMPONENT MUX_2_way_4_Bit
    Port ( Adder_Sub_Out : in STD_LOGIC_VECTOR (3 downto 0); 
           Imd_Value : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC; 
           --EN  : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
SIGNAL IN0,IN1,OP :STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S : STD_LOGIC; 
begin
UUT : MUX_2_way_4_Bit
    PORT MAP(
            Adder_Sub_Out=> IN0,
            Imd_Value => IN1,
            S => S,
            --EN => EN,
            Q => OP       
            );
PROCESS BEGIN
    --EN <= '1';
    IN0 <= "0000";
    IN1 <= "0011";
    S <= '0';
    WAIT FOR 100NS;
    
    IN0 <= "0101";
    IN1 <= "1110";
    S <= '1';
    WAIT FOR 100NS;
    
    S <= '0';
    WAIT FOR 100NS;
    
    IN0 <= "0101";
    IN1 <= "0000";
    S <= '0';
    WAIT FOR 100NS;
    
    S <= '1';
    WAIT FOR 100NS;
    
    
END PROCESS;
end Behavioral;