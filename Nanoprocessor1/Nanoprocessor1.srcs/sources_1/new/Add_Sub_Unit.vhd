----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:28:48 AM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Add/Sub Selector --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC); -- Zero flag
--           N_Out : out STD_LOGIC; -- Negetive flag
--           P_Out : out STD_LOGIC );-- Parity flag (Odd parity detector)         
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal FA0_C, FA1_C, FA2_C, FA3_C, B0,B1,B2,B3: STD_LOGIC;
signal S_out:STD_LOGIC_VECTOR (3 downto 0);

begin

FA_0: FA
    PORT MAP(
        A=>A(0),
        B=>B0,
        C_in=>Sel,
        S=>S_out(0),
        C_out=>FA0_C);

FA_1: FA
    PORT MAP(
        A=>A(1),
        B=>B1,
        C_in=>FA0_C,
        S=>S_out(1),
        C_out=>FA1_C);

FA_2: FA
    PORT MAP(
        A=>A(2),
        B=>B2,
        C_in=>FA1_C,
        S=>S_out(2),
        C_out=>FA2_C);

FA_3: FA
    PORT MAP(
        A=>A(3),
        B=>B3,
        C_in=>FA2_C,
        S=>S_out(3),
        C_out=> FA3_C);
       
B0<=B(0) XOR Sel; 
B1<=B(1) XOR Sel; 
B2<=B(2) XOR Sel; 
B3<=B(3) XOR Sel; 

C_Out<=FA3_C ;
Z_Out<= NOT(S_out(0) OR S_out(1) OR S_out(2) OR S_out(3));

S <= S_out;

--N_Out <= S_out(3);
--P_Out <= S_out(0) XOR S_out(1) XOR S_out(2) XOR S_out(3);
        
end Behavioral;
