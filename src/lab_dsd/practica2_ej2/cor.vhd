LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cor IS
    PORT(a, b: IN std_logic; c: OUT std_logic);
END ENTITY cor;

ARCHITECTURE arqcor OF cor IS
BEGIN
    c<= a or b;
END ARCHITECTURE arqcor;
