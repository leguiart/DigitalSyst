-- Top entity donde se conectan los modulos del reloj lento donde que
--  da el divisor de frecuencia y por lo tanto el ciclo de reloj
-- con el cual cambiara el contador de dos bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contador is
    Port ( clkl: in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_vector(1 downto 0));
end contador;

architecture arqcontador of contador is
signal conector: std_logic;
begin
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl,conector);
u2: entity work.cuenta(arqcuenta) port map(conector, reset,salida);
end arqcontador;

