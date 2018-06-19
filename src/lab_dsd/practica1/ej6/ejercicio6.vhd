library ieee;
use ieee.std_logic_1164.all;

entity ejercicio6 is
	port(
		a: in std_logic_vector(4 downto 0);
		f: out std_logic
		);
	end ejercicio6;
	
	architecture arq_ejercicio6 of ejercicio6 is
	begin
		with a select
			f <= '1' when "11000", 
				'1'	when "11110",
				'0' when "11100", 
				'0'	when "11111",
				'1' when others;
	end architecture arq_ejercicio6;