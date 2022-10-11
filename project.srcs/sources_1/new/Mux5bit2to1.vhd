library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux5bit2to1 is
  Port (
    X: in std_logic_vector(4 downto 0);
    Y: in std_logic_vector(4 downto 0 );
    s: in std_logic;
    O: out std_logic_vector(4 downto 0));
end Mux5bit2to1;

architecture Behavioral of Mux5bit2to1 is
begin
    process (s,X,Y)
    begin 
        if (s = '0') then 
            O <= Y;
        else
            O <= X;
        end if;
    end process;

end Behavioral;