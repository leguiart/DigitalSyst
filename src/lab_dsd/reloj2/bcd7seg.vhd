-- Archivo para BCD a NUM-CUENTA
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd7seg is
port(
	bcd: in STD_LOGIC_VECTOR (3 downto 0);
	led: out STD_LOGIC_VECTOR (6 downto 0));
end bcd7seg;

architecture arqbcd7seg of bcd7seg is
begin
	with bcd select
	LED <= "0110000" when "0000",
	"1111001" when "0001",
	"1000000" when "0010",
	"1111000" when "0011", 
	"1000000" when "0100",
	"0011000" when "0101",
	"0000010" when "0110",
	"0110000" when "0111",
	"1111000" when "1000",
	"0011000" when "1001",
	"0000110" when others;
end arqbcd7seg;