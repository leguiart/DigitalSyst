LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY examen IS
	PORT (a,b: IN std_logic; f: OUT std_logic);
END ENTITY examen;

ARCHITECTURE arqexamen OF examen IS
signal cable1, cable2: std_logic;
BEGIN
	u1:entity work.cnand(arqcnand) port map (a,b, cable1);
	u2:entity work.cnand(arqcnand) port map (a,b, cable2);
	u3:entity work.cnand(arqcnand) port map (cable1, cable2, f);
END ARCHITECTURE arqexamen;
