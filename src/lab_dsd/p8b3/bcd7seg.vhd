-- Codigo de "combinacional" que forma un decodificador de codigo BCD a codigo de 7 segmentos
library ieee; -- Se declara la libreria 
use ieee.std_logic_1164.all; -- Y la serie de funciones asociadas a esta libreria
-- BCD a 7 segmentos: este modulo recibira de entrada una palabra binaria de 4 bits
-- Y regresara una palabra binaria de 7 Bits codificada de tal forma que concuerde con el
-- numero que se esta tratando de representar en esos siete bits ya que cada uno correspondera
-- de derecha a izquierda a los segmentos A hasta G dentro del display de siete segmentos
-- a partir de esa entrada en formato binario de 4 bits que vendra dada por un contador de 
-- cuatro bits que cambie entonces de valor en un intervalo regular de tiempo.
entity bcd7seg is
port(
-- Por ello necesitamos declarar dos variables de tipo vector standard logic un vector de 4 lugares
-- y otro de 7 lugares correspondientes cada uno a la entrada y a la salida respectivamente del
-- "combinacional"
bcd: in  std_logic_vector(3 downto 0);-- Variable que estara directamente conectada a, ya sea la salida
-- de otro modulo o a la entrada directamente en la tarjeta
led: out std_logic_vector(6 downto 0) -- Variable que ira directamente a la salida de la FPGA
);
end bcd7seg ;
-- Se define el comportamiento de las variables a ser manejadas
architecture arqbcd7seg  of bcd7seg  is
begin
with bcd select -- se utiliza una secuencia de instruccion whith-select-when para dar una
-- salida deseada correspondiente a la entrada que se tiene
 LED <= "1000000" when "0000",
  "1111001" when "0001",
  "0100100" when "0010",
  "0110000" when "0011",
  "0011001" when "0100" ,
  "0010010" when "0101" ,
  "0000010" when "0110" ,
  "1111000" when "0111",
  "0000000" when "1000" ,
  "0011000" when "1001",
  "1111111"  when others;

end arqbcd7seg ;
