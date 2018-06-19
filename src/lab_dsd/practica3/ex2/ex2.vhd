library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex2 is
	Port ( SEL : in STD_LOGIC;
			A  : in STD_LOGIC_VECTOR (3 downto 0);
			B  : in STD_LOGIC_VECTOR (3 downto 0);
			X  : out STD_LOGIC_VECTOR (3 downto 0));
end ex2;

architecture arqmux of ex2 is
begin 
	X <= A when (SEL = '1') else B;
end arqmux;