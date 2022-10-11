
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF is 
   port(
      Q : out std_logic;    
      clk :in std_logic;  
      rst: in std_logic;  
      D :in  std_logic );
end DFF;
architecture Behavioral of DFF is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
    if(rst='1') then 
     Q <= '0';
    else 
    Q <= D; 
    end if;
    end if;       
 end process;  
end Behavioral;