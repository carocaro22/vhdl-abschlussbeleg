library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TESTBENCH is
--  Port ( );
end TESTBENCH;

architecture Behavioral of TESTBENCH is

component VORTEILERTEST is
port( clk : in std_ulogic;
      en: out std_ulogic );
end component;

component ZAEHLERTEST is 
port ( en, clk : in std_ulogic;
       cnt: out integer );
end component;

component SCHWELLETEST is 
port ( btnup, btndown: in std_ulogic;
       stf: out integer );
end component;

component COMPARATORTEST is
  Port ( cnt, stf: in integer;
         clk: in std_ulogic;
         led: out std_ulogic );
end component;

component BTNFLANKETEST is
    Port ( clk, btnin: in std_ulogic;
         btnout: out std_ulogic);
end component;

signal clk: std_ulogic;
signal btnup: std_ulogic;
signal btndown: std_ulogic;
signal led: std_ulogic;
signal en: std_ulogic;
signal cnt: integer;
signal stf: integer;
signal btn1: std_ulogic; 
signal btn2: std_ulogic;

begin
DUT: VORTEILERTEST port map (clk => clk, en => en); 
ZAH: ZAEHLERTEST port map (en => en, clk => clk, cnt => cnt);
COM: COMPARATORTEST port map (cnt => cnt, stf => stf, clk => clk, led => led);
BT1: BTNFLANKETEST port map (clk => clk, btnin => btn1, btnout => btnup);
BT2: BTNFLANKETEST port map ( clk => clk, btnin => btn2, btnout => btndown);
SCW: SCHWELLETEST port map (btnup => btnup, btndown => btndown, stf => stf);


CLOCK: process
begin
clk <= '0';
wait for 1ms;
clk <= '1';
wait for 1ms;

end process;

btn1 <= '0',
  '1' after 3ms,
  '0' after 50ms, 
  '1' after 94ms,
  '0' after 146ms;


--btnup<= '0',
--  '1' after 3400ms,
-- '0' after 3451ms,
--  '1' after 5000ms,
-- '0' after 5051ms,
--  '1' after 6700ms,
-- '0' after 6751ms,
--  '1' after 8050ms,
-- '0' after 8201ms;
---------------
--btndown <= '0',
-- '1' after 200ms,
-- '0' after 250ms, 
-- '1' after 1500ms,
-- '0' after 1550ms,
-- '1' after 2000ms,
-- '0' after 2051ms,
--  '1' after 3000ms,
-- '0' after  3051ms,
--  '1' after 9000ms,
-- '0' after 9073ms,
--  '1' after 12000ms,
-- '0' after 12710ms,
--  '1' after 15007ms,
-- '0' after 15710ms,
--   '1' after 16007ms,
-- '0' after 16070ms,
--   '1' after 17507ms,
-- '0' after 18010ms;
 

end Behavioral;
