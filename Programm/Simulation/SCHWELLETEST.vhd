library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SCHWELLETEST is
Port ( btnup, btndown: in std_ulogic;
       stf: out integer );
end SCHWELLETEST;

architecture Behavioral of SCHWELLETEST is

begin

PRESSBUTTON: process (btnup, btndown)

variable zahl: integer range 1 to 16 := 5;

begin 

if (btnup = '1') then
zahl := zahl + 1;
if (zahl > 16) then 
zahl := 16;
end if;
end if; 

if (btndown = '1') then
zahl := zahl - 1;
if (zahl < 1) then 
zahl := 1;
end if; 
end if; 

stf <= zahl;
end process;

end Behavioral;
