library ieee;
use ieee.std_logic_1164.all;
entity mux4x1 is
	Port(B: in std_logic_vector(7 downto 0);
		s: in std_logic_vector(1 downto 0);
		salmux: out std_logic_vector(7 downto 0));
end mux4x1;

architecture arq_mux4x1 of mux4x1 is
	begin
	with S select
		salmux <= "00000000" when "00",
			(not B) when "01",
			B when "10",
			"11111111" when "11",
			"00000000" when others;
end arq_mux4x1;