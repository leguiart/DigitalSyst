LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cand IS
    PORT(a, b: IN std_logic; c: OUT std_logic);
END ENTITY cand;

ARCHITECTURE arqcand OF cand IS
BEGIN
    c<= a and b;
END ARCHITECTURE arqcand;
