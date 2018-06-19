LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ejemplo3 IS
	PORT (a,b,c: IN std_logic; f: OUT std_logic);
END ENTITY ejemplo3;

ARCHITECTURE arqejemplo3 OF ejemplo3 IS
signal cable1, cable2: std_logic;
BEGIN
	u1:entity work.cor(arqcor) port map (a,b, cable1);
	u2:entity work.cor(arqcor) port map (a,b, cable2);
	u3:entity work.cand(arqcand) port map (cable1, cable2, f);
END ARCHITECTURE arqejemplo3;
