library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity chip is
    Port ( clkl: in  STD_LOGIC;
			reset: in STD_LOGIC;
            count: out std_logic_vector(1 downto 0));
end chip;

architecture arqchip of chip is
signal conector: std_logic;
begin
u1: entity work.RELOJLENTO(ARQRELOJLENTO) port map(clkl,conector);
u2: entity work.cnt2bitc(behavior) port map(reset=>reset,  clk=>conector, count=>count);

end arqchip;
