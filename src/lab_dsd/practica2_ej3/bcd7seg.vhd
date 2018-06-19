library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd7seg is
port(
	bcd: in bit_vector (3 downto 0);
	led: out bit_vector (6 downto 0));
end bcd7seg;

architecture arqbcd7seg of bcd7seg is
begin
	with bcd select
	LED <= "1000000" when "0000",
	"1111001" when "0001",
	"0100100" when "0010",
	"0110000" when "0011",
	"0011001" when "0100",
	"0010010" when "0101",
	"0000010" when "0110",
	"1111000" when "0111",
	"0000000" when "1000",
	"0011000" when "1001",
	"0000110" when others;
end arqbcd7seg;