library ieee;
use ieee.std_logic_1164.all;

entity relojlento is
port(
clkl: in std_logic; -- La entrada CLK esta conectada directamente al PIN 17
led: buffer std_logic:= '0';
led2: buffer std_logic:= '0' ); -- La salida LED es una variable buffer que estara
-- cambiando acordemente cada 50,000,000 de pulsaciones y cuyo cambio a su vez nos
-- sirve como divisor de frecuencia
end relojlento;

--El comportamiento entoces del reloj es:
architecture arqrelojlento of relojlento is
-- se define una señal de tipo entero (una señal porque es 
-- manejable en un proceso)
TYPE state IS (st0, st1, st2);  
signal conteo: integer range 0 to 50000000;
signal conteo2: integer range 0 to 10;-- esta señal funcionara como un contador de eventos de de CLKL
SIGNAL current : state := st0;
begin
process(clkl) 
 begin
  if(clkl' event and clkl='1') then
     conteo<=conteo+1;
       if(conteo=25000000) then 
          conteo<=0;
          led<=not(led); -- -- se invierte el estado del divisor de frecuencia
       end if;      
   end if;
 end process;
 
--if de sseleccion entre manual y automatico 
process (led)
begin
	if rising_edge(led) then
		conteo2<=conteo2+1;
		if(conteo2 = 10) then
			conteo2<=0;
			led2<= not(led2);
		end if;
	end if;
end process;
end arqrelojlento;