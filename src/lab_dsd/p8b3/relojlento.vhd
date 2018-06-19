-- Modulo que toma el pulso de reloj directamente de la Cyclone y regresa un 
-- pulso con mucha mayor duracion, o dicho de otra forma, un divisor de frecuencia
library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity relojlento is
port(
clkl: in std_logic; -- La entrada CLK esta conectada directamente al PIN 17
led: buffer std_logic:= '0' ); -- La salida LED es una variable buffer que estara
-- cambiando acordemente cada 25,000,000 de pulsaciones y cuyo cambio a su vez nos
-- sirve como divisor de frecuencia
end relojlento;

--El comportamiento entoces del reloj es:
architecture arqrelojlento of relojlento is
-- se define una señal de tipo entero (una señal porque es 
-- manejable en un proceso)  
signal conteo: integer range 0 to 25000000;-- esta señal funcionara como un contador de eventos de de CLKL
begin
process(clkl) -- Se declara dentro de la lista sensitiva del proceso a CLKL
 -- lo que quiere decir que el bloque de instrucciones que este entre el begin
 -- y el end process se ejecutara concurrentemente en funcion del cambio que suceda
 -- con esa variable 
 begin
 -- Se indica con el bloque if que si hay un evento clkl y este pulso de 
 -- reloj se encuentra en su estado de alto voltaje entonces:
  if(clkl' event and clkl='1') then
     conteo<=conteo+1;-- se incremente el contador entero declarado arriba
       if(conteo=25000000) then -- si a su vez el conteo entero llega a 25000000
          conteo<=0; -- el conteo se regresa a 0 para iniciar otro ciclo de reloj
          led<=not(led); -- -- se invierte el estado del divisor de frecuencia
       end if;
   end if;
 end process;
end arqrelojlento;
