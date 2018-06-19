LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cnand IS
    PORT(a, b: IN std_logic; c: OUT std_logic);
END ENTITY cnand;

ARCHITECTURE arqcnand OF cnand IS
BEGIN
    c<= a nand b;
END ARCHITECTURE arqcnand;
