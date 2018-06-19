library ieee;
use ieee.std_logic_1164.all;

entity ejercicio4 is
	port(
		a: in std_logic_vector(1 downto 0);
		f: out std_logic
		);
	end ejercicio4;
	
	architecture arq_ejercicio4 of ejercicio4 is
	begin
		with a select
			f <= '0' when "00",
				'1' when others;
	end architecture arq_ejercicio4;