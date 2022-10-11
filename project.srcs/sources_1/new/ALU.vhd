library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;


entity ALU is
    Port (
    A, B     : in  STD_LOGIC_VECTOR(31 downto 0);  -- 2 inputs 32-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(31 downto 0); -- 1 output 32-bit 
    Carryout : out std_logic        -- Carryout flag
    );
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (31 downto 0);
signal tmp: std_logic_vector (32 downto 0);

begin
   process(A,B,ALU_Sel)
   
variable count : unsigned(31 downto 0) := x"00000000";
 begin
  case(ALU_Sel) is
  when "0000" => -- Addition
   ALU_Result <= A + B ; 
  when "0001" => -- Subtraction
   ALU_Result <= B - A  ;
  when "0010" => -- Multiplication
   ALU_Result <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),32)) ;
  when "0011" => -- Logical and 
   ALU_Result <= A and B;
  when "0100" => -- Logical or
   ALU_Result <= A or B;
  
  when "0101" => -- less comparison
   if(A<B) then
    ALU_Result <= x"00000001" ;
   else
    ALU_Result <= x"00000000" ;
   end if;  
  
  when "0110" => -- Equal comparison   
   if(A=B) then
    ALU_Result <= x"00000001" ;
   else
    ALU_Result <= x"00000000" ;
   end if;
   
   
  when "0111" => --NOT Equal comparison   
   if(A=B) then
    ALU_Result <= x"00000000" ;
   else
    ALU_Result <= x"00000001" ;
   end if;
   ----------------------------------------------
   -- Logical shift left
  when "1000" => 
   
   ALU_Result(TO_INTEGER(unsigned(B(10 downto 6)))-1 downto 0) <= (others => '0');
   ALU_Result(31 downto TO_INTEGER(unsigned(B(10 downto 6)))) <= A(31-TO_INTEGER(unsigned(B(10 downto 6))) downto 0);
   ---------------------------------------------
   -- Logical shift right
  when "1001" => 
   ALU_Result(31 downto 32 - TO_INTEGER(unsigned(B(10 downto 6)))) <= (others => '0');
   ALU_Result(31 - TO_INTEGER(unsigned(B(10 downto 6))) downto 0) <= A(31 downto TO_INTEGER(unsigned(B(10 downto 6))));
   
  when "1010" => -- Rotate right
   ALU_Result <= std_logic_vector(unsigned(A) ror to_integer(unsigned(B)));
 ------------        
  when "1011" =>--counting ones
  count := x"00000000";   --initialize count variable.
    for i in 0 to 31 loop   --check for all the bits.
        if(A(i) = '1') then --check if the bit is '1'
            count := count + 1; --if its one, increment the count.
        end if;
    end loop;
    ALU_Result <= std_logic_vector(count);
 -----------
  when "1100" =>--counting zeros
  count := x"00000000";   --initialize count variable.
    for i in 0 to 31 loop   --check for all the bits.
        if(A(i) = '0') then --check if the bit is '1'
            count := count + 1; --if its one, increment the count.
        end if;
    end loop;
    ALU_Result <= std_logic_vector(count);
 -----------
  
 
  when others => ALU_Result <= A + B ; 
  end case;
 end process;
 
 
 
 ALU_Out <= ALU_Result; -- ALU out
 tmp <= ('0' & A) + ('0' & B);
 Carryout <= tmp(32); -- Carryout flag
end Behavioral;