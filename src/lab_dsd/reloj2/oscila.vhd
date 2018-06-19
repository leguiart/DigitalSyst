-- Archivo TOP-LEVEL ENTITY
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity oscila is -- la entidad principal oscila... por oscilador
	Port(		
		CLK : in STD_LOGIC; -- se definen entradas y salidas, en este caso se copia el nombre de CLK y SRST para facilidad en la comprension a la hora de hacer las conexiones
		SRST : in STD_LOGIC;
		DISPLAY0 : out STD_LOGIC_VECTOR( 6 downto 0));
end oscila;

architecture arqoscila of  oscila is
	signal NOT_SRST_TO_COUNTER : STD_LOGIC := '1'; -- se definen señales para manejar los datos provenientes de los otros modulos
	signal TC_PRE_TO_S_COUNTER : STD_LOGIC := '0';
	signal TC_1S_TO_10S_COUNTER : STD_LOGIC := '0';
	signal COUNT_OUT_TO_BCD_1S : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
begin
	NOT_SRST_TO_COUNTER <= not SRST; -- copia de SRST negado	
	Prescaler: entity work.counter -- se efectua un escalamiento ya que 50 millones de pulsaciones son demasiadas como para poder ver algo
		GENERIC MAP ( TCOUNT => 50000000, -- 50 millones de herz (pulsaciones por segundo) o 50 MHz
						N_BITS => 26) 
		PORT MAP ( CLK =>CLK, -- CLK de este modulo se conecta con CLK del modulo del contador, esta entrada sera directamente la del reloj en su frecuencia normal
					SRST => NOT_SRST_TO_COUNTER,
					EN => '1', -- Se habilita el contador, se le dice que siempre comenzara en 1 para asegurarse de que siempre este contando las pulsaciones
					TC => TC_PRE_TO_S_COUNTER, -- se conecta a TC_PRE_TO_S_COUNTER TC para hacer la conversion a segundos posteriormente y que nuestro conteo base ya no sea las 50 millones de pulsaciones sino una pulsacion por segundo
					OUTPUT => open -- el escalamiento no tendra ninguna salida
					);
	Counter_1s: entity work.counter -- El contador en segundos queda
		GENERIC MAP (	TCOUNT => 9,-- se quiere que solo se llegue hasta nueve valores para el numero de cuenta
						N_BITS => 4 -- numero de bits de entrada 
						)
		PORT MAP ( CLK => CLK, 
					SRST => NOT_SRST_TO_COUNTER, 
					EN => TC_PRE_TO_S_COUNTER, -- el habilitador ahora se conecta con el contador de tiempo pero para que cuando llegue a las 50 millones de pulsaciones esa sea una pulsacion en nuestro contador para segundos
					TC => TC_1S_TO_10S_COUNTER, -- esta asignacion se utilizaria si se quisiera contar mas de diez 
					OUTPUT => COUNT_OUT_TO_BCD_1S); -- La salida se conecta a la señal que se utilizara para darle los 4 bits correspondientes al modulo bcd7seg
						
		
	BCD7SEG : entity work.bcd7seg
		PORT MAP (BCD => COUNT_OUT_TO_BCD_1S, -- finalmente se conecta la entrada del modulo bcd7seg a la salida serial y sincronica que resulta del contador en segundos en cuatro bits
					LED => DISPLAY0); -- La salida del modulo bcd7seg se conecta a la salida display0 que tiene asignados los pines en la fpga

end arqoscila;