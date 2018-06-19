library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity conta7seg is
    Port ( clkl: in  STD_LOGIC; -- Entrada del tren de pulsos a 50 mHz 
           reset : in  STD_LOGIC;  -- Boton o interruptor que regresa todo a cero
			  cyout: out std_logic; -- variable que unicamente se declara
			  -- porque se estan haciendo las conexiones en el portmap de
			  -- cuenta4 en un formato directo
			  seg7 : out  STD_LOGIC_vector(6 downto 0);-- Salida del display de
			  -- 7 segmentos correspondiente al contador de segundos
			  seg7_2: out  STD_LOGIC_vector(6 downto 0)); -- Salida del display
			  -- de 7 segmentos correspondiente al contador de decenas de segundos
end conta7seg;

architecture arq_conta7seg of conta7seg is
signal conector: std_logic; -- señal que servira como conexion entre el modulo
-- de relojlento y el modulo cuenta4
signal sal4sal7: std_logic_vector(3 downto 0); -- Señal que llevara el valor de
-- del contador de 4 bits de segundos a una instancia de bcd7seg
signal sal4sal7_2: std_logic_vector(3 downto 0); -- Señal que llevara el valor de
--el contador de 4 bits de decenas de segundos a otra instancia de bcd7seg
begin
-- Conexiones hechas entre los tres modulos con auxilio de las signals declaradas
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl,conector);
u3: entity work.bcd7seg(arqbcd7seg) port map(sal4sal7, seg7);
u4: entity work.bcd7seg(arqbcd7seg) port map(sal4sal7_2, seg7_2);
u2: entity work.cuenta4(arqcuenta4) port map(reset=>reset ,cyout=>cyout, salida=> sal4sal7, salida2=>sal4sal7_2, divi=>conector);


end arq_conta7seg;
