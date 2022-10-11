library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataPath is
    Port (clk: in std_logic;
          rst: in std_logic;
          output: inout std_logic_vector(31 downto 0)
          );
end DataPath;
architecture Behavioral of DataPath is

component ALU is 
Port (
    A, B     : in  STD_LOGIC_VECTOR(31 downto 0);  -- 2 inputs 32-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(31 downto 0); -- 1 output 32-bit 
    Carryout : out std_logic        -- Carryout flag
    );
end component;

component ALUADD is
Port (input1: in std_logic_vector(31 downto 0);
          input2: in std_logic_vector(31 downto 0);
          output: out std_logic_vector(31 downto 0));
end component;
component RegisterFile is 
port ( ReadRegister1 : in STD_LOGIC_VECTOR (4 downto 0);
           ReadRegister2 : in STD_LOGIC_VECTOR (4 downto 0);
           WriteRegister : in STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in STD_LOGIC;
           clk : in STD_LOGIC;
           ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0));
end component;
component DataMemory is
port (  address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead,clk: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0));
end component;
component Instruction_memory is
PORT (  readAddress : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component; 
component Mux32Bit2to1 is
Port (
    X: in std_logic_vector(31 downto 0);
    Y: in std_logic_vector(31 downto 0 );
    s: in std_logic;
    O: out std_logic_vector(31 downto 0));
end component;
component Mux5bit2to1 is
Port (
    X: in std_logic_vector(4 downto 0);
    Y: in std_logic_vector(4 downto 0 );
    s: in std_logic;
    O: out std_logic_vector(4 downto 0));
end component;
component PCAdder is
Port (input: in std_logic_vector(31 downto 0);
      output: out std_logic_vector(31 downto 0));
end component; 
component ShiftLeft is 
GENERIC (
		N : INTEGER := 2;
		W : INTEGER := 32
	);
	PORT (
		input  : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0));
end component;
component SignExtension is 
Port ( input: in std_logic_vector(15 downto 0);
       output: out std_logic_vector(31 downto 0));
end component;
component Controller is 
PORT (  opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
		func          : IN std_logic_vector(5 DOWNTO 0); -- instruction 5-0
		regDst        : OUT std_logic;
		PCSrc          : OUT std_logic;
		MemRead       : OUT std_logic;
		memToReg : OUT std_logic;
		ALUop         : OUT std_logic_vector(3 DOWNTO 0);
		memWrite      : OUT std_logic;
		ALUsrc        : OUT std_logic;
		regWrite      : OUT std_logic);
end component;
component ProgramCounter is 
Port (  clk: in std_logic;
        rst: in std_logic;
        PC_in: in std_logic_vector(31 downto 0);
        PC_out: out std_logic_vector(31 downto 0));
end component;
--Program Counter signals
signal PCin : std_logic_vector(31 downto 0);
signal PCout : std_logic_vector(31 downto 0);
-- Instruction memory
signal instruction: std_logic_vector(31 downto 0);

--Controller Signals
signal RegDst: std_logic;
signal ALUSrc: std_logic;
signal RegWrite: std_logic;
signal ALUOp: std_logic_vector(3 downto 0);
signal MemWrite: std_logic;
signal MemRead: std_logic;
signal PCSrc: std_logic;
signal MemToReg: std_logic;
-- MUX 5
signal mux5: std_logic_vector(4 downto 0);

-- Register File 
signal Read1: std_logic_vector(31 downto 0); 
signal Read2: std_logic_vector(31 downto 0); 
-- Sign Extension
signal extended: std_logic_vector(31 downto 0); 
-- output of mux
signal mux1: std_logic_vector(31 downto 0); 

--- ALU input and outputs 
signal ALU_out: std_logic_vector(31 downto 0); 
signal Zero: std_logic;
-- Shift left  
signal SL: std_logic_vector(31 downto 0); 
-- added 4 
signal Added: std_logic_vector(31 downto 0); 
-- output of ALU ADD
signal Sum: std_logic_vector(31 downto 0); 
-- ReadData out
signal ReadData:std_logic_vector(31 downto 0); 

begin

PC1: ProgramCounter port map(clk,rst,PCin,PCout);
Inst: Instruction_memory port map(PCout,instruction);
cont: Controller port map(instruction(31 downto 26),instruction(5 downto 0),RegDst,PCSrc,MemRead,MemToReg,ALUOp,MemWrite,ALUSrc,RegWrite);
M5: Mux5bit2to1 port map(instruction(15 downto 11),instruction(20 downto 16),RegDst,mux5);
REG: RegisterFile port map(instruction(25 downto 21),instruction(20 downto 16),mux5,output,RegWrite,clk,Read1,Read2);
EXt: SignExtension port map(instruction(15 downto 0),extended);
mux32: Mux32Bit2to1 port map(extended,Read2,ALUSrc,mux1);
ALUYC: ALU port map(Read1,mux1,ALUOp,ALU_out,Zero);
Shift: ShiftLeft port map(extended,SL);
Ad: ALUADD port map(SL,Added,Sum);
ADDER4: PCAdder port map(PCout,Added);
MUX2: Mux32Bit2to1 port map(Sum,Added,PCSrc,PCin);
Memory: DataMemory port map(ALU_out,Read2,MemWrite,MemRead,clk,ReadData);
MUX3: Mux32Bit2to1 port map(ReadData,ALU_out,MemToReg,output);

end Behavioral;
