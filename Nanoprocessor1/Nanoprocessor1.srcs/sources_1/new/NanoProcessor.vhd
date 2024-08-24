----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:31:23 AM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           
            -- pcadder :out std_logic_vector(2 downto 0);
                    
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end NanoProcessor;

architecture Behavioral of NanoProcessor is

--Import componentz

component SevenSeg_LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Reg_Bank 
    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
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

component MUX_8_way_4_Bit 
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
end component;

component Add_Sub_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Add/Sub Selector --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC); -- Zero flag
--           N_Out : out STD_LOGIC; -- Negetive flag
--           P_Out : out STD_LOGIC );-- Parity flag (Odd parity detector)         
end component;


component MUX_2_way_4_Bit is
    Port ( Adder_Sub_Out : in STD_LOGIC_VECTOR (3 downto 0);
           Imd_Value : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component Instuction_Decoder 
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           Load_sel : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_add : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : out STD_LOGIC;
           Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0)); 
                  
end component;


component Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
   data : out STD_LOGIC_VECTOR (11 downto 0));
end component;


component Program_Counter 
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;


component Adder_3_Bit 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;


component MUX_2_way_3_Bit 
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;



--Declaring signals
signal imd_val, RCA_out, Reg_Chk_Jmp, Add_Sub_Out, data, Data_bus0, Data_bus1, Data_bus2, Data_bus3, Data_bus4, Data_bus5, Data_bus6, Data_bus7: STD_LOGIC_VECTOR(3 downto 0);
signal Ins_Bus : STD_LOGIC_VECTOR(11 downto 0);
signal Reg_bus, Mem_Bus, Reg_SelA , Reg_SelB, count, mem, Jmp_Add: STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub_Sel, Load_Sel, C_out, Jmp_Flag: STD_LOGIC;
signal SlowClk: STD_LOGIC;

signal Mux_A_out , Mux_B_out :std_logic_vector(3 downto 0);
signal carryFlag, zeroFlag : std_logic;



begin

--Port mapping=============================================================

SevenSeg_LUT_16_7_0 : SevenSeg_LUT_16_7
port map(
address => Data_bus7,
data => Seven_seg_out);

Slow_Clk_0 : Slow_Clk          --complete
port map (
    Clk_in => Clk,
    Clk_out => SlowClk);
    
Program_Rom_0 :Program_Rom
    port map (
    address => Mem_Bus,     --complete
    data => Ins_Bus);

Program_Counter_0  : Program_Counter 
port map (
    D => count,
    EN => '1',
    Reset => Reset,
    Clk => SlowClk,
    Q => Mem_Bus);


Instuction_Decoder_0 : Instuction_Decoder
port map (
    Instruction => Ins_Bus,
    Reg_en => Reg_bus,
    Load_sel => Load_Sel,
    Imm_Val => imd_val,
    Reg_Sel_A => Reg_SelA,
    Reg_Sel_B => Reg_SelB,
    Add_Sub_Sel => Add_Sub_Sel,
    Jump_add => Jmp_Add,
    Jump_flag => Jmp_Flag,
    Reg_Chk_Jmp => Reg_Chk_Jmp);

Reg_Chk_Jmp <= Mux_A_out;

Reg_Bank_0 : Reg_Bank
port map (
      Reg_en => Reg_bus,
      Clk => SlowClk,
      Reset => Reset,
      Input_D => data,
      Q0 => Data_bus0,
      Q1 => Data_bus1,
      Q2 => Data_bus2,
      Q3 => Data_bus3,
      Q4 => Data_bus4,
      Q5 => Data_bus5,
      Q6 => Data_bus6,
      Q7 => Data_bus7 );
      
 Add_Sub_Unit_0 : Add_Sub_Unit
      port map( A => Mux_A_out, 
     B => Mux_B_out,  
     Sel => Add_Sub_Sel,  -- Add/Sub Selector --sel=0 ADD , sel=1 SUBSTRACT
     S =>  Add_Sub_Out,
     C_Out => carryFlag, -- Carry flag
     Z_Out => zeroFlag); -- Zero flag

Mux_2_way_4_Bit_0 : Mux_2_way_4_Bit
      port map (
      S => Load_Sel,
      Adder_Sub_Out => Add_Sub_Out,
      Imd_Value => imd_val,
      Q => data);
 

MUX_8_way_4_Bit_A :  MUX_8_way_4_Bit 
    port map (
           R0 => Data_bus0, 
           R1 => Data_bus1,
           R2 => Data_bus2,
           R3 => Data_bus3,
           R4 => Data_bus4,
           R5 => Data_bus5,
           R6 => Data_bus6,
           R7 => Data_bus7,
           S => Reg_SelA,
           Q => Mux_A_out ); 
 
 
 MUX_8_way_4_Bit_B :  MUX_8_way_4_Bit 
   port map (
          R0 => Data_bus0, 
          R1 => Data_bus1,
          R2 => Data_bus2,
          R3 => Data_bus3,
          R4 => Data_bus4,
          R5 => Data_bus5,
          R6 => Data_bus6,
          R7 => Data_bus7,
          S => Reg_SelB,
          Q => Mux_B_out );    
      
      
Adder_3_Bit_0  : Adder_3_Bit 
port map (
    A => Mem_Bus,
    C_in => '0',
    S => mem,
    C_out => C_out);

MUX_2_way_3_Bit_0 : MUX_2_way_3_Bit
port map (
    S => Jmp_Flag,
    I0 => mem,
    I1 => Jmp_Add,
    Q => count);


Overflow <= carryFlag; 
Zero <= zeroFlag;

R7 <= Data_bus7;

an <= "1110";

end Behavioral;
