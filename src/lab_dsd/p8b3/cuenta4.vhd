library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Contador de 4 Bits (4 bits por el hecho de que necesitamos representar 
-- valores del 0 al 9 y 4 bits nos proveen la capacidad de representar
-- 16 valores, del 0 al 15, como se hizo en el primer contador hecho en
-- la primera mitad de la practica
entity cuenta4 is
    Port ( divi : in  STD_LOGIC; -- nuestra variable divisor de frecuencia que estara conectada con
           -- la variable led del modulo de reloj lento
           reset : in  STD_LOGIC; -- variable reset que reiniciara ambos contadores
			  cyout: out std_logic; -- variable que se puede conectar a un led y verificar que se
			  -- prenda a los 10 segundos
           salida : out  STD_LOGIC_vector(3 downto 0); -- salida de cuatro bits del contador cuenta1
           salida2: out STD_LOGIC_vector(3 downto 0)); -- salida de cuatro bits del contador cuenta2
end cuenta4;

-- comportamiento del contador
architecture arqcuenta4 of cuenta4 is
begin
-- se declara todo lo que hara el contador dentro de un process
-- cuya lista sensitiva este compuesta ya sea del cambio de
-- nuestro divisor de frecuencia con lo que entonces nuestro
-- contador estara trabajando con nuestro ciclo de reloj 
-- de una duracion de un segundo, o de el cambio en el boton
-- de reset, el cual nos dara un estado ya sea donde
-- ambos contadores esten en 0 o un estado donde ambos esten
-- habilitados y el contador efectivamente cuente
	process (reset, divi)
	-- Se definen dentro del proceso variables de tipo standard logic vector
	-- una que manejara el conteo para el segundero
	-- y otra que manejara el conteo para las decenas de segundos
	variable cuenta: std_logic_vector ( 3 downto 0):= "0000";
	variable cuenta2: std_logic_vector ( 3 downto 0):= "0000";
	begin
	-- Si el divisor de frecuencia se encuentra en un estado alto entonces ejecuta
	-- este bloque de codigo
	if rising_edge (divi) then
		-- Si la cuenta de los segundos esta en 9 
		if cuenta= "1001" then
			-- Incrementa la cuenta de las decenas en 1
			cuenta2:= cuenta2+1;
			-- Si la cuenta de las decenas llega a 9
			if cuenta2= "1001" then
				cuenta2:="0000";
				-- Regresarla a 0 se accionara
				-- transcurridos los 100 segundos
			end if;
			cuenta:= "0000"; -- A su vez invariablemente
			-- cuando la cuenta de los segundos este en 9
			-- posteriormente se regresa a 0
			cyout<='1';
		else
			cuenta:= cuenta+1; -- Si la cuenta de segundos
			-- aun no llega a 9 sigue aumentandose 
		end if;
	end if;
	IF reset = '1' then -- Si el boton de reset se activa todo se regresa a 0 
		-- y se mantiene asi
		cuenta:= "0000";
		cuenta2:= "0000";
	end if;
		-- En cada ejecucion del process se copian los valores de los contadores a
		-- las salidas de el modulo de contador
		SALIDA <= cuenta;
		SALIDA2 <=cuenta2;
	end process;

end arqcuenta4;
