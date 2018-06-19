library ieee;
use ieee.std_logic_1164.all;

entity practica1 is
	port(
		a: in std_logic_vector(1 downto 0);
		f: out std_logic
		);
	end practica1;
	
	architecture arq_practica1 of practica1 is
	begin
		with a select
			f <= '1' when "11",
				'0' when others;
	end architecture arq_practica1;