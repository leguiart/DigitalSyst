library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

entity UA is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end UA;

architecture arqUA of UA is
signal SUM_CARRY : STD_LOGIC_VECTOR (8 downto 0);
begin
		
    SUM_CARRY <= ('0' & A) + ('0' & B) + cin;
    SUM <= NOT SUM_CARRY(7 downto 0);
    cout <= NOT SUM_CARRY(8);

end arqUA;
