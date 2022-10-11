library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MUX is
end tb_MUX;

architecture Behavioral of tb_MUX is

    component Mux32Bit2to1
    port (X: in std_logic_vector(31 downto 0);
         Y: in std_logic_vector (31 downto 0);
         s: in std_logic;
         O: out std_logic_vector(31 downto 0));
    end component;
signal X: std_logic_vector(31 downto 0);
signal Y: std_logic_vector(31 downto 0);
signal s: std_logic :='1';

signal O: std_logic_vector(31 downto 0);

begin
uut: Mux32Bit2to1
port map(
            X=>X,
            Y=>Y,
            s=>s,
            O=>O);
Stimulus: 
process
begin

wait for 20 ns;
X<=x"00000056";
Y<=x"00000064";
s<='0';

wait for 20 ns;
X<=x"00000056";
Y<=x"00000064";
s<='1';

wait for 20 ns;
X<=x"00000056";
Y<=x"00000064";
s<='0';

wait for 20 ns;
X<=x"00000056";
Y<=x"00000064";
s<='0';

wait for 20 ns;
X<=x"00000056";
Y<=x"00000064";
s<='1';



end process;
end behavioral;