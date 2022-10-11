LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY Instruction_memory IS
	PORT (
		readAddress : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Instruction_memory;
ARCHITECTURE Behavioral OF Instruction_memory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL IM : RAM_16_x_32 := (
		x"2010000e",
		x"2011000f", 
		x"2012001d", 
		x"2013fff1",
		x"02324020", 
		x"02504024",
		x"72114002",
		x"02504025", 
		x"36080010",
		x"02124022", 
		x"72604021", 
		x"72404020", 
		x"0211402a",
		x"0230402a",
		x"02204080",
		x"024040C2"
	);
BEGIN
	instruction <=
		IM(( to_integer(unsigned(readAddress))) /4);
END Behavioral;