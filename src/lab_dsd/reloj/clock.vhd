library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock is
	Port(A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		Q : out STD_LOGIC;
		
		CLK : in STD_LOGIC;
		OUTPUT : out STD_LOGIC_VECTOR( 3 downto 0));
end clock;

architecture arqclock of clock is
	signal COUNT_OUT : STD_LOGIC_VECTOR(29 downto 0):= (others => '0');
begin

Q <= A when C= '1' else
	 B when C= '0';
OUTPUT <= COUNT_OUT(29 downto 26);

process(CLK)
begin
	if rising_edge(CLK) then
		COUNT_OUT <= COUNT_OUT + 1;
	end if;
end process;

end arqclock;