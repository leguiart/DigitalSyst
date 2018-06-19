LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cor IS
    PORT(a, b, c: IN std_logic; d: OUT std_logic);
END ENTITY cor;

ARCHITECTURE arqcor OF cor IS
BEGIN
    d<= a or b or c;
END ARCHITECTURE arqcor;
