library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
	Port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
			C  : out STD_LOGIC);
end mux2;

architecture arqmux2 of mux2 is
begin
with SEL select
	C <= '0' when "000",
		 '0' when "001",
		 '0' when "010",
		 '1' when "011",
		 '0'  when "100",
		 '1' when "101",
		 '1' when "110",
		 '1' when "111";
end arqmux2;