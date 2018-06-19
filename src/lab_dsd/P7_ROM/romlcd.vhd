-- Este modulo corresponde a la rom, las entradas del bus de datos
-- estaran dadas por las direcciones secuenciales dadas por el contador
-- de dos bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity romlcd is
port(
bus_dir: in std_logic_vector(1 downto 0);
cs: in std_logic;
bus_datos: out std_logic_vector (6 downto 0));
end romlcd;


architecture arqromlcd of romlcd is

constant LL: std_logic_vector(6 downto 0):="1000111"; --1000111 0111000
constant LA: std_logic_vector(6 downto 0):="0001000"; --0001000 1110111
constant LE: std_logic_vector(6 downto 0):="0000110"; --0000110 1111001
constant L3: std_logic_vector(6 downto 0):="0110000"; --0000000 1111111


type memoria is array (3 downto 0) of std_logic_vector(6 downto 0);
constant mem_rom: memoria:=(L3, LE, LA, LL);

signal dato: std_logic_vector(6 downto 0);

begin
  prom: process(bus_dir)
  begin
    dato <= mem_rom(conv_integer(bus_dir));
		 end process prom;
pbuf: process (dato,cs)
begin
 if(cs='1') then
 bus_datos<=dato;
 else
 bus_datos <= (others=>'Z');
 end if;
 end process pbuf;
 end arqromlcd;

