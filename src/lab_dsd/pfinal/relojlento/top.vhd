library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	Port( clkl, clk, x: in std_logic;
			led: buffer std_logic:= '0';
			led2: buffer std_logic:= '0';
			z: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
end top; 

architecture arqtop of top is
signal conector, conector2: std_logic;
begin
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl=>clkl,led=>conector, led2=>conector2);
u2: entity work.lavadora(arqlavadora) port map (clk=>conector, x=>conector2,z=>z);
end arqtop;



		  