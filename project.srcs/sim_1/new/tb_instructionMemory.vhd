LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY tb_instructionMemory IS
END tb_instructionMemory;
ARCHITECTURE behavior OF tb_instructionMemory IS
	--Inputs
	SIGNAL tb_readAddress : std_logic_vector(31 DOWNTO 0) := x"00000000";
	--Outputs
	SIGNAL tb_instruction : std_logic_vector(31 DOWNTO 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	U1_Test : ENTITY work.Instruction_memory(Behavioral)
		PORT MAP(
			readAddress => tb_readAddress,
			instruction => tb_instruction
		);
-- Stimulus process
stim_proc : PROCESS
BEGIN
	-- read 12 commands
	FOR I IN 0 TO 11 LOOP
		tb_readAddress <= x"00000000" OR std_logic_vector(to_unsigned(I * 4, 32));
		WAIT FOR 25 ns;
	END LOOP;
END PROCESS;
END;