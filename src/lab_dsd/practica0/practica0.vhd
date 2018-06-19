library ieee; -- library to use
use ieee.std_logic_1164.all; -- logic to use apply to all components

entity practica0 is -- defining entity practica0
	port (
		a: in std_logic; -- defining input and output variables
		b: out std_logic
		);
end practica0;

architecture arqpractica0 of practica0 is -- assigning an architecture to the entity (a very basic one in this case)
	begin
	b<= not a; -- just apply not gate to a and assign it to b (our output)
end architecture arqpractica0;

