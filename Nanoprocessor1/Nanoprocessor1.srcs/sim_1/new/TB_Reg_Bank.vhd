----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:21:55 PM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is

COMPONENT Reg_Bank
    PORT ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Input_D : in STD_LOGIC_VECTOR (3 downto 0);
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;


SIGNAL Reg_En : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL En :  STD_LOGIC:= '1';
SIGNAL Clk :  STD_LOGIC := '0';
SIGNAL Res_Reg_Bank : STD_LOGIC := '0';
SIGNAL A :  STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B0 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B1 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B2 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B3 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B4 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B5 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B6 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B7 : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: Reg_Bank
    PORT MAP( Reg_en => Reg_En,
              --EN => En,
              Clk => Clk,
              Reset => Res_Reg_Bank,
              Input_D => A,
              Q0 => B0,
              Q1 => B1,
              Q2 => B2,
              Q3 => B3,
              Q4 => B4,
              Q5 => B5,
              Q6 => B6,
              Q7 => B7
    );
    
    process
    begin
    Clk <= not Clk;
    wait for 20 ns;
    end process;
    
    process begin
    --reset
    Res_Reg_Bank <= '1';
    wait for 100 ns;
    
    Reg_En <= "010";
    A <= "0011";
    wait for 100 ns;
    
    --undo reset
    Res_Reg_Bank <= '0';
    
    Reg_En <= "010";
    A <= "0011";
    wait for 100 ns; 
     
    Reg_En <= "001";
    A <= "0101";
    wait for 100 ns;
    
    Reg_En <= "011";
    A <= "1010";
    wait for 100 ns;  
    
    Reg_En <= "111";
    A <= "0110";
    wait for 100 ns;
    
    end process; 
        



end Behavioral;
