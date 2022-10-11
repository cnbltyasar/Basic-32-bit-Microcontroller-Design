
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile_tb is
--  Port ( );
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is
component RegisterFile is 
port (
        clk: in std_logic;
		RegWrite: in std_logic;
		ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
		WriteData: in std_logic_vector(31 downto 0);
		ReadData1, ReadData2: out std_logic_vector(31 downto 0)
	);
end component;

signal clk: std_logic;
signal RegWrite: std_logic;
signal ReadRegister1, ReadRegister2, WriteRegister: std_logic_vector(4 downto 0);
signal WriteData: std_logic_vector(31 downto 0);
signal ReadData1, ReadData2: std_logic_vector(31 downto 0);


begin
uut: RegisterFile
port map(
        clk => clk,
		RegWrite => RegWrite,
		ReadRegister1 => ReadRegister1,
		ReadRegister2 =>ReadRegister2 , 
		WriteRegister => WriteRegister,
		WriteData => WriteData,
		ReadData1  => ReadData1 ,
		ReadData2  => ReadData2);

clock: process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;

stimulus: process
begin


ReadRegister1 <= "00000"; 
ReadRegister2 <= "00000";
WriteRegister <= "00000";
WriteData <= x"321654aa";
RegWrite <= '0' ;
wait for 20 ns;
RegWrite <= '1';
ReadRegister1 <= "00000"; 
ReadRegister2 <= "00001";
WriteRegister <= "00001";
WriteData <= x"321654aa";
wait for 40 ns; 

WriteRegister <= "00101";
WriteData <= x"facbde21";
ReadRegister1 <= "00001"; 
ReadRegister2 <= "00001";
wait for 40 ns; 

WriteRegister <= "01001";
WriteData <= x"11111111";
ReadRegister1 <= "00001"; 
ReadRegister2 <= "00101";
wait for 40 ns; 

WriteRegister <= "00011";
WriteData <= x"fffffff1";
ReadRegister1 <= "00000"; 
ReadRegister2 <= "01001";
wait for 40 ns; 

RegWrite <= '0' ;
wait for 40 ns; 

ReadRegister1 <= "00011"; 
ReadRegister2 <= "00000";
wait for 20 ns;
RegWrite <= '1' ;
ReadRegister1 <= "00001"; 
ReadRegister2 <= "00101";
wait for 20 ns;
  
  
end process;
end Behavioral;
