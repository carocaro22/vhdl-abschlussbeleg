library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SCHWELLE is
Port ( btnup, btndown, clk: in std_ulogic;
       stf: out integer );
end SCHWELLE;

architecture Behavioral of SCHWELLE is

begin

PRESSBUTTON: process (btnup, btndown, clk)
variable zahl: integer range 1 to 1024 := 200;
  begin 
  if rising_edge(clk) then
    if (btnup = '1') then
        if (zahl < 921) then 
            zahl := zahl + 102;
        end if;
    
    elsif (btndown = '1') then
        if (zahl > 102) then 
          zahl := zahl - 102;
        end if; 
    end if;
    stf <= zahl;     
    end if;
    

end process;

end Behavioral;
