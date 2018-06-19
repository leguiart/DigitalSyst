library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY synchronizer IS
PORT (clk, adata : IN std_logic;
synched : OUT std_logic);
END ENTITY;
--
ARCHITECTURE procedural OF synchronizer IS
TYPE state IS (S0, S1);
SIGNAL current : state;
BEGIN
PROCESS (clk) BEGIN
IF (rising_edge(clk)) THEN  --checate que es lógica positiva
IF current = S0 THEN
IF adata = '0' THEN
current <= S0;
ELSE
current <= S1;
END IF;
ELSE -- current = S1
current <= S0;
END IF;
END IF;
END PROCESS;
synched <= '1' WHEN current = S1 ELSE '0';
END ARCHITECTURE procedural;
