----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:26:41 PM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_Bit - Behavioral
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

entity TB_MUX_8_way_4_Bit is
--  Port ( );
end TB_MUX_8_way_4_Bit;

architecture Behavioral of TB_MUX_8_way_4_Bit is
component MUX_8_way_4_Bit
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0); 
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 DOWNTO 0); 
           --EN : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));    
end component;
signal IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,OP : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S : STD_LOGIC_VECTOR (2 DOWNTO 0);
--SIGNAL EN : STD_LOGIC;
begin
UUT : MUX_8_way_4_Bit
PORT MAP( R0 => IN0,
        R1 => IN1,
        R2 => IN2,
        R3 => IN3,
        R4 => IN4,
        R5 => IN5,
        R6 => IN6,
        R7 => IN7,
        S => S,
        --EN => EN,
        Q => OP
        );
PROCESS BEGIN
    IN0 <= "0000";
    IN1 <= "0010";
    IN2 <= "0001";
    IN3 <= "0011";
    IN4 <= "0110";
    IN5 <= "0111";
    IN6 <= "0101";
    IN7 <= "1000";
   
    --EN <= '1'; 
    S <= "000";
    WAIT FOR 100NS;
    S <= "001";
    WAIT FOR 100NS;
    S <= "010";
    WAIT FOR 100NS;
    S <= "011";
    WAIT FOR 100NS;
    S <= "100";
    WAIT FOR 100NS;
    S <= "101";
    WAIT FOR 100NS;
    S <= "110";
    WAIT FOR 100NS;
    S <= "111";
    WAIT FOR 100NS;
    
    
END PROCESS;
end Behavioral;