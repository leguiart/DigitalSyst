library ieee;
use ieee.std_logic_1164.all;

entity Cand is
port(
	f1:out std_logic;
	f2: out std_logic;
	f3: out std_logic);
end Cand;

architecture arq_Cand of Cand is
begin
	f1<= '0' and '0'
	f2<= '0' and '1';
	f3 <= '1' and '1';
end architecture arq_Cand;