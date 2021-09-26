library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ZAEHLERTEST is
  Port ( en, clk: in std_ulogic;
         cnt: out integer
  );
end ZAEHLERTEST;

architecture Behavioral of ZAEHLERTEST is

signal x : std_logic_vector(3 downto 0) := "0000";

begin
       
process (clk, en)
 begin
    if rising_edge(clk) and en = '1' then
        case x (1 downto 0) is
            when "00" => x (1 downto 0) <= "01";
            when "01" => x (1 downto 0) <= "10";
            when "10" => x (1 downto 0) <= "11";
            when "11" => x (1 downto 0) <= "00";
            when others => x (1 downto 0) <= "00";
        end case;    
          
      if x(1 downto 0)  = "11"          then x (2 downto 0)  <= "100";         end if;
      if x(2 downto 0)  = "111"         then x (3 downto 0)  <= "1000";        end if;
      if x(3 downto 0)  = "1111"        then x (3 downto 0)  <= "0000";       end if;
    end if;         
end process;   

cnt <= to_integer(unsigned(x));
       
end Behavioral;


