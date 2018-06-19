--Codigo del contador de 2 bits que trabaja con el tiempo de reloj 
-- establecido con el divisor de frecuencia
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity cuenta is
    Port ( divi : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_vector(1 downto 0));
end cuenta;

architecture arqcuenta of cuenta is

begin
process (reset, divi)
variable cuenta: std_logic_vector ( 1 downto 0):= "00";
begin
if rising_edge (divi) then
if cuenta= "11" then
cuenta:= "00";
else
cuenta:= cuenta+1;
end if;
end if;
IF reset = '1' then
cuenta:= "00";
end if;
SALIDA <= cuenta;
end process;

end arqcuenta;

