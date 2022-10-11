library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port (
    clk: in std_logic;
    rst: in std_logic;
    PC_in: in std_logic_vector(31 downto 0);
    PC_out: out std_logic_vector(31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
component DFF
port( Q : out std_logic;    
      clk :in std_logic;  
      rst: in std_logic;  
      D :in  std_logic );
end component;

begin
    PC: for i in 0 to 31 generate
        PC: DFF port map(PC_out(i), clk, rst, PC_in(i));
    end generate;
end Behavioral;
