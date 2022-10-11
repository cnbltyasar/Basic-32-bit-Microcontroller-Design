
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity ALUADD is
    Port (input1: in std_logic_vector(31 downto 0);
          input2: in std_logic_vector(31 downto 0);
          output: out std_logic_vector(31 downto 0));
end ALUADD;

architecture Behavioral of ALUADD is
begin

    output <= input1 + input2; 
     
end Behavioral;
