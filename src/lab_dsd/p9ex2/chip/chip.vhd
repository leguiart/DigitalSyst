library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity chip is
    Port ( clkl: in  STD_LOGIC;
			adata: in STD_LOGIC;
            synched : OUT std_logic);
end chip;

architecture arqchip of chip is
signal conector: std_logic;
begin
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl,conector);
u2: entity work.synchronizer(procedural) port map(adata=>adata,  clk=>conector, synched=>synched);

end arqchip;
