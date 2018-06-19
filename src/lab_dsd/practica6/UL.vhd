library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UL is
	Port(A, B : in STD_LOGIC_VECTOR(7 downto 0);
		salUL : out STD_LOGIC_VECTOR(7 downto 0);
		S : in STD_LOGIC_VECTOR (1 downto 0));
end UL;

architecture arqUL of UL is
	signal SAND, SOR, SXOR, SNOT : STD_LOGIC_VECTOR(7 downto 0);
BEGIN 
	SAND <= A and B;
	SOR <= A or B;
	SXOR <= A xor B;
	SNOT <= not A;
	WITH S SELECT
		salUL <= not SAND when "00",
				 not SOR when "01",
				 not SXOR when "10",
				 not SNOT when "11",
				  "00000000" when others;
end arqUL;
