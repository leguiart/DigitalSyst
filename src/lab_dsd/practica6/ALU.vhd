library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	Port(
		 S: in STD_LOGIC_VECTOR(1 downto 0);
		 A, B: in STD_LOGIC_VECTOR (7 downto 0);
		 cin : in STD_LOGIC;
		 S2: in STD_LOGIC;
		 salmux: out std_logic_vector(7 downto 0);
		 cout : out STD_LOGIC;
		 OUTPUT : out STD_LOGIC_VECTOR(7 downto 0)
		 );
end ALU;

architecture arqALU of ALU is
signal ulsignal, uasignal, muxsignal : STD_LOGIC_VECTOR(7 downto 0);

begin
	u1: entity work.UL(arqUL) port map (A=>A, B=>B, S=>S, salUL=>ulsignal);
	u2: entity work.mux4x1(arq_mux4x1)port map(B, S, salmux=> muxsignal);
	u3: entity work.UA(arqUA) port map (A=>A,B=> muxsignal, cin=>cin, SUM=>uasignal, cout => cout);
	u4: entity work.mux2x1(arqmux) port map (ulOut => ulsignal, uaout => uasignal, S2=>S2, output=>output);
end arqALU;
