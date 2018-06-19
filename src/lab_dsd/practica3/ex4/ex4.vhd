library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex4 is
	Port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
			S  : out STD_LOGIC_VECTOR(1 downto 0)
			);
end ex4;

architecture arqex4 of ex4 is
begin
with SEL select
	S <= "00" when "000",
		 "10" when "001",
		 "10" when "010",
		 "01" when "011",
		 "10"  when "100",
		 "01" when "101",
		 "01" when "110",
		 "11" when "111";
		 

end arqex4;