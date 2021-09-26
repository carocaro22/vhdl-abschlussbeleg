
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BRIGHTCONTROL is
Port (clk: in std_ulogic;
      btn1: in std_ulogic;
      btn2: in std_ulogic;
      led: out std_ulogic );
end BRIGHTCONTROL;

architecture Behavioral of BRIGHTCONTROL is

component VORTEILER is
port( clk : in std_ulogic;
      en: out std_ulogic );
end component;

component ZAEHLER is 
port ( en, clk : in std_ulogic;
       cnt: out integer );
end component;

component SCHWELLE is 
port ( btnup, btndown, clk: in std_ulogic;
       stf: out integer );
end component;

component COMPARATOR is
  Port ( cnt, stf: in integer;
         clk: in std_ulogic;
         led: out std_ulogic );
end component;

component BTNFLANKE is
    Port ( clk, btnin: in std_ulogic;
         btnout: out std_ulogic);
end component;

signal en: std_ulogic;
signal cnt: integer;
signal stf: integer;
signal btnup: std_ulogic;
signal btndown: std_ulogic;

begin
DUT: VORTEILER port map (clk => clk, en => en); 
ZAH: ZAEHLER port map (en => en, clk => clk, cnt => cnt);
COM: COMPARATOR port map (cnt => cnt, stf => stf, clk => clk, led => led);
BT1: BTNFLANKE port map (clk => clk, btnin => btn1, btnout => btnup);
BT2: BTNFLANKE port map ( clk => clk, btnin => btn2, btnout => btndown);
SCW: SCHWELLE port map (btnup => btnup, btndown => btndown, stf => stf, clk => clk);


end Behavioral;
