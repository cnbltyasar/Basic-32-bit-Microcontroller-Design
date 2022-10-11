LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Controller IS
	PORT (
		opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
		func          : IN std_logic_vector(5 DOWNTO 0); -- instruction 5-0
		regDst        : OUT std_logic;
		PCSrc         : OUT std_logic;
		MemRead       : OUT std_logic;
		memToReg      : OUT std_logic;
		ALUop         : OUT std_logic_vector(3 DOWNTO 0);
		memWrite      : OUT std_logic;
		ALUsrc        : OUT std_logic;
		regWrite      : OUT std_logic
	);
END Controller;
ARCHITECTURE Behavioral OF Controller IS
BEGIN
	PROCESS (opcode,func)
	BEGIN
		regWrite <= '0'; --Deassert for next command
		CASE opcode IS
			WHEN "000000" => -- and, or, add, sub: 0x00				
			   if (func = "100000") then  ALUop  <= "0000";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1';
			   elsif (func = "100010") then ALUop     <= "0001";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1';
			   elsif (func = "100100") then ALUop     <= "0011";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1';
			   elsif (func = "100101") then --or
			     ALUop     <= "0100";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1';
			   
			   elsif (func = "101010") then 
			     ALUop     <= "0101";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1';
			   elsif (func = "000000") then --shift left
			     ALUop     <= "1000";
			     ALUsrc        <= '1';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '0';
			   elsif (func = "000010") then --shift right
			     ALUop     <= "1001";
			     ALUsrc        <= '1';	
			     regDst        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '1';
				 regWrite      <= '0';	   
			   elsif (func = "000110") then --rotate
			     ALUop     <= "1010";
			     ALUsrc        <= '0';
			     PCSrc         <= '0';
				 MemRead       <= '0';
				 memToReg      <= '0';
				 memWrite      <= '0';
				 regWrite      <= '1';
			     regDst        <= '1'; 
			   end if ;

			WHEN "011100" => -- clo , clz, mul
			if 	func = "100001" then --clo
			    regDst        <= '1';
				PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '1';
			    ALUop        <= "1011";
			elsif func = "100000" then --clz
			regDst        <= '1';
				PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '1';
			    ALUop     <= "1100";
			elsif func = "000010" then --mul
			    regDst        <= '1';
				PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '1';
			   ALUop     <= "0010";
			end if;
				 
			when "001000" =>  -- add immediate
			    regDst        <= '0';
				PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				ALUop         <= "0000";
				memWrite      <= '0';
				ALUsrc        <= '1';
				regWrite      <= '1';
			when "001101" =>  -- or immediate
			    regDst        <= '0';
				PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				ALUop         <= "0100";
				memWrite      <= '0';
				ALUsrc        <= '1';
				regWrite      <= '1';
				
			when others => 
			    PCSrc         <= '0';
				MemRead       <= '0';
				memToReg      <= '0';
				memWrite      <= '0';
				regWrite      <= '1' ;
			    ALUop        <= "0010";
			    ALUsrc        <= '0';
			    regDst        <= '1';
				
		END CASE;
	END PROCESS;
END Behavioral;