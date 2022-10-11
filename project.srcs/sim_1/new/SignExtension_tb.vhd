
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtension_tb is
--  Port ( );
end;

architecture Behavioral of SignExtension_tb is

component SignExtension 
Port( input: in std_logic_vector(15 downto 0);
    output: out std_logic_vector(31 downto 0));
end component;

signal input: std_logic_vector(15 downto 0);
signal output: std_logic_vector(31 downto 0);

begin
uut: SignExtension
port map(
input => input,
output => output);


stim_proc: process
begin
  
input(15 downto 0) <= "1011011111111010";
wait for 20 ns;

input(15 downto 0) <= "0000000000000000";
wait for 40 ns;

input(15 downto 0) <= "1011011011010000";
wait for 30 ns;

input(15 downto 0) <= "0011011011010000";
wait for 20 ns;

input(15 downto 0) <= "1111111011010000";
wait for 20 ns;

end process;

end Behavioral;
