library ieee; -- library to use
use ieee.std_logic_1164.all; -- logic to use apply to all components

entity prueba_led is -- defining entity practica0
	port (
		c: out std_logic -- defining input and output variables
		);
end prueba_led;

architecture arqprueba_led of prueba_led is -- assigning an architecture to the entity (a very basic one in this case)
	begin
	c<= '0' and '1'; -- just apply not gate to a and assign it to b (our output)
end architecture arqprueba_led;`