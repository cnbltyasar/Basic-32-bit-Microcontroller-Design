

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter_tb is
--  Port ( );
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is
component ProgramCounter is 
  Port (
    clk: in std_logic;
    rst: in std_logic;
    PC_in: in std_logic_vector(31 downto 0);
    PC_out: out std_logic_vector(31 downto 0));
end component;
signal clk: std_logic;
signal rst: std_logic;
signal PC_in: std_logic_vector(31 downto 0);
signal PC_out: std_logic_vector(31 downto 0);

begin
uut: ProgramCounter
port map(
        clk => clk,
        rst => rst,
        PC_in => PC_in,
        PC_out => PC_out);

clock: process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;

Force: process
begin

rst <= '1' ;
PC_in <= x"01010001"; 
wait for 20 ns; 

rst <= '0' ;
PC_in <= x"01010001"; 
wait for 20 ns; 

rst <= '0' ;
PC_in <= x"00100001"; 
wait for 20 ns; 
rst <= '1' ;
PC_in <= x"01000111"; 
wait for 20 ns; 

rst <= '0' ;
PC_in <= x"01010000"; 
wait for 20 ns;

rst <= '0' ;
PC_in <= x"11010001"; 
wait for 20 ns;

end process;
end Behavioral;
