
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RegisterFile is
    port ( ReadRegister1 : in STD_LOGIC_VECTOR (4 downto 0);
           ReadRegister2 : in STD_LOGIC_VECTOR (4 downto 0);
           WriteRegister : in STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in STD_LOGIC;
           clk : in STD_LOGIC;
           ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture behaviour of RegisterFile is

    type ram is array (0 to 31) of std_logic_vector(31 downto 0);
    signal rf : ram := (others => x"00000000");
    
begin

ReadData1 <= rf(conv_integer(ReadRegister1));
ReadData2 <= rf(conv_integer(ReadRegister2));
    
    write : process(clk)
    begin
        if (rising_edge(clk) and RegWrite = '1') then
            rf(conv_integer(WriteRegister)) <= WriteData; 
        end if;
    end process write;
    
end behaviour;