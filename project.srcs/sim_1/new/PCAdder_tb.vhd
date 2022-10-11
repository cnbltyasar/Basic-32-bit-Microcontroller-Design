library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCAdder_tb is
end PCAdder_tb;

architecture Behavioral of PCAdder_tb is

    component PCAdder
    port (input: in std_logic_vector(31 downto 0);
         output: out std_logic_vector(31 downto 0));
    end component;
    
signal input: std_logic_vector(31 downto 0);
signal output: std_logic_vector(31 downto 0);

begin
uut: PCAdder
port map(input=>input,
         output=>output);
Stimulus: 
process
begin


input<=x"FFFFFFFC";
wait for 20 ns;

input<=x"0000000F";

wait for 20 ns;
input<=x"00000056";

wait for 20 ns;
input<=x"FFFFFFFF";

wait for 20 ns;
input<=x"00007005";
wait for 20 ns;

end process;
end Behavioral;
