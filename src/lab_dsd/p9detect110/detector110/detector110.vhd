library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY detector110 IS
	PORT (a, reset, clkl : IN std_logic; w : OUT std_logic);
END ENTITY;
--
ARCHITECTURE procedural OF detector110 IS
	TYPE state IS (S0, S1, S2, S3);
	SIGNAL current : state := S0;
BEGIN
	PROCESS (clkl) BEGIN
		IF (clkl = '0' AND clkl'EVENT) THEN
			IF reset = '1' THEN current <= S0;
			ELSE
				CASE current IS
					WHEN S0 =>
						IF a='1' THEN current <= S1;
						ELSE current <= S0; END IF;
					WHEN S1 =>
						IF a='1' THEN current <= S2;
						ELSE current <= S0; END IF;
					
					WHEN S2 =>
						IF a='1' THEN current <= S2;
						ELSE current <= S3; END IF;
					WHEN S3 =>
						IF a='1' THEN current <= S1;
						ELSE current <= S0; END IF;
					WHEN OTHERS => current <= S0; 
				END CASE;
			END IF;
		END IF;
	END PROCESS;
	w <= '0' WHEN current = S3 ELSE '1';
END ARCHITECTURE procedural;