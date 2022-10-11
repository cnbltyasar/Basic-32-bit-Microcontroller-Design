
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtension is
    Port (
    input: in std_logic_vector(15 downto 0);
    output: out std_logic_vector(31 downto 0));
end SignExtension;

architecture Behavioral of SignExtension is

begin
    process(input)
    begin
        if(input(15) = '0') then
            output(15 downto 0) <= input(15 downto 0);
            output(31 downto 16) <= "0000000000000000";
        else
            output(15 downto 0) <= input(15 downto 0);
            output(31 downto 16) <= "1111111111111111";
        end if;
    end process;
end Behavioral;
