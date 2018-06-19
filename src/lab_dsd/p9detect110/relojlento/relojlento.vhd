library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity relojlento is
port(
	clkl: in std_logic;
	led: out std_logic:= '0' );
end relojlento;

architecture arqrelojlento of relojlento is
	signal conteo: integer range 0 to 25000000;
	signal pled: std_logic:= '0';
begin
	process(clkl)
	 begin
	  if(clkl' event and clkl='1') then
		 conteo<=conteo+1;
		   if(conteo=25000000) then
			  conteo<=0;
			  pled<=not(pled);
		   end if;
	   end if;
	 end process;
	 led<=pled;
end arqrelojlento;
