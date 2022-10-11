library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Data_Path_tb is
--  Port ( );
end Data_Path_tb;

architecture Behavioral of Data_Path_tb is
component DataPath is 
Port (clk: in std_logic;
          rst: in std_logic;
          output: inout std_logic_vector(31 downto 0)
          );
end component;

signal clk: STD_LOGIC;
signal rst: STD_LOGIC := '0';
signal output: std_logic_vector(31 downto 0);

begin

uut: DataPath

port map(
clk => clk,
rst => rst,
output => output);

clock: process
begin
clk <= '0';
wait for 15 ns;
clk <= '1';
wait for 15 ns;
end process;

Force: process
begin
  
rst <= '1';
wait for 19 ns;
rst <= '0';

wait ;
end process;
end Behavioral;
