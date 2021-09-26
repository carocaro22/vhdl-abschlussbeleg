library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ZAEHLER is
  Port ( en, clk: in std_ulogic;
         cnt: out integer
  );
end ZAEHLER;

architecture Behavioral of ZAEHLER is

begin
       
P1: process (clk, en)                             
    variable zaehler : integer range 0 to 1024 := 0; 
      begin
        if rising_edge (clk) and (en = '1') then               
          if zaehler = 1023 then                     
          zaehler := 0;        
          else
           zaehler := zaehler + 1;                       
          end if;
        end if;
          cnt <= zaehler;
          
    end process; 
    
       
end Behavioral;


