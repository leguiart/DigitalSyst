-- Top entity donde se conecta la salida del contador de dos bits
-- con la entrada del bus de direcciones de la ROM
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contarom is
    Port ( clkl: in  STD_LOGIC;
           reset,cs : in  STD_LOGIC;
           bus_datos : out  STD_LOGIC_vector(6 downto 0));
end contarom;

architecture arqcontarom of contarom is
signal conector1: STD_LOGIC_vector(1 downto 0);
begin
u3: entity work.contador(arqcontador) port map(clkl,reset,conector1);
u4: entity work.romlcd(arqromlcd) port map(conector1,cs,bus_datos);


end arqcontarom;
