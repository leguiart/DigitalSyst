library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contador4 is
    Port ( clkl: in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  cyout: out std_logic;
			  salida : out  STD_LOGIC_vector(3 downto 0));
end contador4;

architecture arqcontador4 of contador4 is
signal conector: std_logic;
begin
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl,conector);
u2: entity work.cuenta4(arqcuenta4) port map(conector, reset,cyout, salida);


end arqcontador4;
