----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:17:49 AM
-- Design Name: 
-- Module Name: MUX_8_way_4_Bit - Behavioral
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

entity MUX_8_way_4_Bit is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_way_4_Bit;

architecture Behavioral of MUX_8_way_4_Bit is

begin
    process(R0,R1,R2,R3,R4,R5,R6,R7,S)
    begin
    if S = "000" then
        Q <= R0;
    elsif S = "001" then
         Q <= R1;
    elsif S = "010" then
         Q <= R2;
    elsif S = "011" then
         Q <= R3; 
    elsif S = "100" then
         Q <= R4;
    elsif S = "101" then
        Q <= R5; 
    elsif S = "110" then
        Q <= R6;
    elsif S = "111" then
        Q <= R7;
    end if;
     end process;
end Behavioral;
