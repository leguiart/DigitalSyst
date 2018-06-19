library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1 is
	port( SEL: in STD_LOGIC;
			A: in STD_LOGIC;
			B: in STD_LOGIC;
			F: out 	STD_LOGIC);
end mux1;

architecture arqmux1 of mux1 is
begin
	F<= A when (SEL = '1') else B;
end arqmux1;