LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    COMPONENT ALU
    PORT(
         A, B     : in  STD_LOGIC_VECTOR(31 downto 0);  -- 2 inputs 32-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(31 downto 0); -- 1 output 32-bit 
    Carryout : out std_logic        -- Carryout flag
    );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal ALU_Out : std_logic_vector(31 downto 0);
   signal Carryout : std_logic;
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );

Stimulus: 
process
begin

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0000";

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0001";

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0010";



wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0011";


wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0100";

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0101";

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0110";

wait for 20 ns;
A<=x"00000064";
B<=x"00000056";
ALU_Sel<="0111";

-------------------

wait for 20 ns;
A<=x"FFFF0000";
B<=x"0000000F";
ALU_Sel<="0000";

wait for 20 ns;
A<=x"FFFF0000";
B<=x"0000000F";
ALU_Sel<="0001";

wait for 20 ns;
A<=x"FFFF0000";
B<=x"0000000F";
ALU_Sel<="0010";

wait for 20 ns;
A<=x"FFFF0000";
B<=x"0000000F";
ALU_Sel<="0011";

wait for 20 ns;
A<=x"FFFF0000";
B<=x"0000000F";
ALU_Sel<="0100";

--------------------------

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"00000001";
ALU_Sel<="0000";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"00000001";
ALU_Sel<="0001";


------------------
wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0000";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0001";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0010";


wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0011";


wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0100";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0101";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0110";

wait for 20 ns;
A<=x"FFFFFFFF";
B<=x"FFFFFFFF";
ALU_Sel<="0111";

-------------------

wait for 20 ns;
A<=x"00000FED";
B<=x"00000005";
ALU_Sel<="1000";

wait for 20 ns;
A<=x"00000FED";
B<=x"00000005";
ALU_Sel<="1001";

wait for 20 ns;
A<=x"00000FED";
B<=x"00000005";
ALU_Sel<="1010";


wait for 20 ns;
A<=x"00000056";
B<=x"00000056";
ALU_Sel<="1011";

--------------

wait for 20 ns;
A<=x"00000056";
B<=x"00000056";
ALU_Sel<="1011";


wait for 20 ns;
A<=x"00000096";
B<=x"00000056";
ALU_Sel<="1100";

end process;

END;