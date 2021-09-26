library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VORTEILER is
  port (clk: in std_ulogic;
        en: out std_ulogic);
end VORTEILER;


architecture Behavioral of VORTEILER is
 
begin  
  P1: process (clk)                             -- Deklaration von Prozesse P1 mit Sensitive Liste
    variable cnt : integer range 0 to 100 := 0; --Deklaration der Variablen / cnt = counter
      begin
        if rising_edge (clk) then               -- bei Aufsteigende flanke von Clocksignal 
          if cnt = 99 then                      -- Wenn cnt gleich 99, 
          cnt := 0; 
          en <= '1';       
          else
          en <= '0';
          cnt := cnt + 1;                       -- Wenn "cnt" nicht 99 ist, wird "cnt" um 1 erh�ht.
          end if;
        end if;
    end process;
    
end Behavioral;


