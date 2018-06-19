library IEEE;
use ieee.std_logic_1164.all;

ENTITY lavadora IS
PORT (clk, x: IN std_logic; z : OUT std_logic_vector (1 downto 0));
END ENTITY lavadora;
--
ARCHITECTURE arqlavadora OF lavadora IS
TYPE state IS (st0, st1, st2);
SIGNAL current : state := st0;
BEGIN
PROCESS (clk)
variable zsignal : std_logic_vector (1 downto 0); 
BEGIN
--IF rst = '1' THEN
--current <= st0;
IF rising_edge(clk) THEN
CASE current IS
WHEN st0 =>
zsignal := "00";
IF x = '1' THEN current <= st1;    
ELSE current <= st0; END IF;
WHEN st1 =>
zsignal := "01";
IF x = '1' THEN current <= st0;
ELSE current <= st1; END IF;
--WHEN got10 =>
--IF x = '1' THEN current <= got1;
--ELSE current <= reset; END IF;
WHEN OTHERS => current <= st0;
END CASE;
END IF;
z<= zsignal;
END PROCESS;
END ARCHITECTURE;