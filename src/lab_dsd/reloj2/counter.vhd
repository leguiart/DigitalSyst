-- Archivo del CONTADOR
library IEEE; -- incluye libreria con la cual trabajaremos
use IEEE.STD_LOGIC_1164.ALL; -- usaremos logica estandarizada de la IEEE 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity counter is -- definimos entradas y salidas, asi como señales genericas para usar como constantes (es como un define en C)
	generic (TCOUNT : natural := 60; 
			N_BITS : natural := 6);		
			
	Port(
		CLK : in STD_LOGIC; -- Valor directo del evento reloj 
		EN : in STD_LOGIC; -- Habilitador del contador
		SRST : in STD_LOGIC; -- Boton de RESET
		TC : out STD_LOGIC; -- Valor actual del Reloj 0 en baja 1 en alta
		OUTPUT : out STD_LOGIC_VECTOR(N_BITS-1 downto 0)); -- Definimos el vector de salida del contador en N_BITS porque puede conflictuar el hecho de que usamos 26 bits en el escalamiento frecuencial y posteriormente 4 para el contador en segundos
end counter;

architecture arqcounter of counter is
	signal COUNT_OUT : STD_LOGIC_VECTOR (N_BITS -1 downto 0) := (others => '0'); -- Se utiliza esta señal como contador principal para poder manipularlo lo que se quiera dentro del modulo y dar una salida definida para la top entity
	signal I : STD_LOGIC_VECTOR (N_BITS -1 downto 0) := (others => '0') ; -- pivote para el patron, se aumentara cada vez que llegue al valor TCOUNT
begin
OUTPUT <= COUNT_OUT; -- Se conecta la salida del contador al contador en BCD


process (CLK)
begin
	if rising_edge(CLK) then
		TC <= '0'; 
		if SRST = '1' then
			COUNT_OUT <= (others => '0'); -- Boton de reset pone todo en 0
		elsif COUNT_OUT = (TCOUNT -1) and EN ='1' then --si el contador llega a la cuenta limite (para los segundos serian 9 segundos) y esta habilitado
			I <= I + '1'; -- aumenta el pivote por uno para que en la siguiente pasada inicie desde ahi el contador
			if I < "1000" then -- si el pivote no ha llegado a 8 quiere decir que no todos los valores del numero de cuenta han sido recorridos
				COUNT_OUT <= I; -- por lo tanto se le asigna al contador el pivote para que inicie desde ahi
			else -- si ya llego a 8  el contador se reinicia a su posicion inicial y el pivote sera la posicion inicial
				COUNT_OUT <= (others => '0');
				I <= (others => '0');
			end if;
			TC <= '1';
		elsif EN = '1' then -- el contador no ha llegado a la cuenta limite y aumenta su valor en 1
			COUNT_OUT <= COUNT_OUT + '1';
		end if;
	end if;
end process;

end arqcounter;