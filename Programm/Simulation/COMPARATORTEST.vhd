library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATORTEST is
  Port ( cnt, stf: in integer;
         clk: in std_ulogic;
         led: out std_ulogic );
end COMPARATORTEST;

architecture Behavioral of COMPARATORTEST is

begin
setres: process (clk, cnt, stf)
  begin
  if rising_edge(clk) then
    if cnt = 0 then
    led <= '1';
    elsif cnt = stf then 
    led <= '0';
    end if;
  end if;  
end process;

end Behavioral;
