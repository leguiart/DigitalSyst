entity ff is
port (reset,din,clk:in bit; qout: out bit);
end entity;

architecture arqff of ff is
begin 
 reg: process(clk) begin
   if (clk='1') then 
     if reset= '1' then qout<='0';
      else qout<=din;
     end if;
   end if;
 end process reg;
 end architecture arqff;
