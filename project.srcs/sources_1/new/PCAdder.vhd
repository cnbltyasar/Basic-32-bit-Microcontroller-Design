
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity PCAdder is
    Port (input: in std_logic_vector(31 downto 0);
          output: out std_logic_vector(31 downto 0));
end PCAdder;

architecture Behavioral of PCAdder is
begin

    output <= input + 4; 
     
end Behavioral;
