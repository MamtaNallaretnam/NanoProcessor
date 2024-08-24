----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:20:34 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
Component Program_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0):="000";--D
            En : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (2 downto 0));--Q   
end component; 
signal Mux_out,Mem_s:std_logic_vector(2 downto 0);
signal Clk:std_logic:='0';
signal Res, En:std_logic;
begin
UUT: Program_Counter
    port map(
        D=>Mux_out,
        Clk=>Clk,
        Reset=>Res,
        Q=>Mem_s,
        En=>En
    );
process begin
    wait for 20ns;
    Clk<=not(Clk);
end process;
process begin
    En <='1';
    Res<='1';
    wait for 40ns;
    Res<='0';
    Mux_out<="001";
    wait for 40ns;
    Mux_out<="010";
    wait for 40ns;
    mux_out<="011";
    wait for 40ns;
    Mux_out<="100";
    wait for 40ns;
    Mux_out<="101";
    wait for 40ns;
    Mux_out<="110";
    wait for 40ns;
    Mux_out<="111";
    wait for 40ns;
    Mux_out<="000";
    wait for 40ns;
    Mux_out<="001";
    wait for 40ns;
    Mux_out<="010";
    wait for 40ns;
    mux_out<="011";
    wait for 40ns;
    Res<='1';
    wait for 40ns;
    Res<='0';
    Mux_out<="001";
    wait for 40ns;
    Mux_out<="010";
    wait for 40ns;
    mux_out<="011";
    wait;
end process;
end Behavioral;
