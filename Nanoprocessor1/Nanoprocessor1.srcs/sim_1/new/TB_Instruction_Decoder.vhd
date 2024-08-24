----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:21:23 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instuction_Decoder is
    PORT ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           Load_sel : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_flag : out STD_LOGIC;
           Jump_add : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0)
           
);
end component;

signal ins : STD_LOGIC_VECTOR (11 downto 0);
signal load_sel,addsub_sel,jump_flag,mux_en_A,mux_en_B,mux_en_2to4,regbank_en,halt: STD_LOGIC;
signal reg_en, reg_selA, reg_selB, jump_add :  STD_LOGIC_VECTOR (2 downto 0);
signal imd_val, jump_sel : STD_LOGIC_VECTOR (3 downto 0);


begin

    UUT: Instuction_Decoder
    PORT MAP( Instruction => ins,
              Reg_en => reg_en,
              Load_sel => load_sel,
              Imm_val => imd_val,
              Reg_Sel_A => reg_selA,
              Reg_Sel_B => reg_selB,
              Add_Sub_Sel => addsub_sel,
              Jump_flag => jump_flag,
              Jump_add => jump_add,
              Reg_Chk_Jmp => jump_sel
              
    );
    
    
    process begin
    ins <= "101110000001";
    wait for 100 ns;
    
    ins <= "100100000010";
    wait for 100 ns;
    
    ins <= "001110100000";
    wait for 100 ns;
    
    ins <= "011110000000";
    wait for 100 ns;
    
    
    ins <= "110010000011";
    wait for 100 ns;
    
    jump_sel <= "0000";
    ins <= "110010000011";
    wait for 100 ns;
    
    ins <= "101100000111";
    wait for 100 ns;
    
    end process;



end Behavioral;
