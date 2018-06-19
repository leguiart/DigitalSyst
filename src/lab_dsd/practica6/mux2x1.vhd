library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2x1 is
	Port(S2: in STD_LOGIC;
		 uaOut, ulOut: in STD_LOGIC_VECTOR (7 downto 0);
		 output: out STD_LOGIC_VECTOR (7 downto 0));
end mux2x1;

architecture arqmux of mux2x1 is
begin
	with S2 select
		output <=  uaOut when '1',
				   ulOut when '0';
end arqmux;