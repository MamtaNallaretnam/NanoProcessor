----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:39:17 AM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
   data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;


architecture Behavioral of Program_Rom is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal program_ROM : rom_type := (

--"100010000011", -- 0  move R1, 3
--"100100000001", --1   move R2, 1
--"010100000000", --2   Neg R2
--"001110010000", --3   Add R7, R1 
--"000010100000", --4   Add R1, R2
--"110010000111", --5   Jump R1, 7
--"110000000011", --6   Jump R0, 3
--"110000000111" --7

                    "101110000001", -- MOVI R7,1 
                    "100100000010", --MOVI R2,2
                    "001110100000", --ADD R7,R2
                    "100110000011", --MOVI R3,3
                    "001110110000", --ADD R7,R3
                    "110000000110", --JZR R0, 6
                    --extra instructions
                    "100001000000", --Enabling Halt Signal
                    "100001000000" --Enabling Halt Signal
                  
);

begin
data <= program_ROM(to_integer(unsigned(address)));

end Behavioral;
