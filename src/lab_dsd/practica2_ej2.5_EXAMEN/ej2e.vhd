LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ej2e IS
	PORT (a,b,c: IN std_logic; f: OUT std_logic);
END ENTITY ej2e;

ARCHITECTURE arqej2e OF ej2e IS
signal cable1, cable2, cable3: std_logic;
BEGIN
	u1:entity work.cand(arqcand) port map (a,b, cable1);
	u2:entity work.cand(arqcand) port map (b,c, cable2);
	u3:entity work.cand(arqcand) port map (a,c, cable3);
	u4:entity work.cor(arqcor) port map (cable1, cable2,cable3, f);
END ARCHITECTURE arqej2e;
