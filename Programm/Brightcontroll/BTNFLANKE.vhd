library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity BTNFLANKE is
  Port ( clk, btnin: in std_ulogic;
         btnout: out std_ulogic);
end BTNFLANKE;

architecture Behavioral of BTNFLANKE is

signal Q1: std_ulogic;
signal Q2: std_ulogic;

begin

PRESSBTN: process (clk, btnin, Q1, Q2)
begin
  if rising_edge (clk) then
    Q1 <= btnin;
    Q2 <= Q1;
    if Q1 = '1' and Q2 = '0' then
      btnout <= '1';
    else 
      btnout <= '0';
    end if;  
  end if;
end process;

end Behavioral;
