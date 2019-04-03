---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : BL_design
-- Author      : arin
-- Company     : da
--
---------------------------------------------------------------------------------------------------
--
-- File        : C:\Users\USER\Desktop\BLACK_JACK\BL_design\compile\TEST.vhd
-- Generated   : Sun May 13 22:49:53 2018
-- From        : C:\Users\USER\Desktop\BLACK_JACK\BL_design\src\TEST.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity TEST is 
end TEST;

architecture TEST of TEST is

---- Component declarations -----

component black_jack
  port (
       E1 : in STD_LOGIC;
       E2 : in STD_LOGIC;
       N : in STD_LOGIC;
       Y : in STD_LOGIC;
       CC : out STD_LOGIC_VECTOR(0 to 3);
       GAME_RESULT : out INTEGER;
       S1 : out STD_LOGIC_VECTOR(0 to 4);
       S2 : out STD_LOGIC_VECTOR(0 to 4);
       TURN : out STD_LOGIC
  );
end component;
component card_mem
  port (
       CARD : in STD_LOGIC_VECTOR(0 to 3);
       ENABLE : in STD_LOGIC;
       RESET : in STD_LOGIC;
       GIVE_NEW : out STD_LOGIC;
       VER_CARD : out STD_LOGIC_VECTOR(0 to 4)
  );
end component;
component comp_unit
  port (
       EN : in STD_LOGIC;
       EN1 : in STD_LOGIC;
       END_GAME : in STD_LOGIC;
       RESET : in STD_LOGIC;
       S1 : in UNSIGNED(0 to 4);
       S2 : in UNSIGNED(0 to 4);
       END_RESULT : out NATURAL;
       MASTER_RESET : out STD_LOGIC;
       P1S : out STD_LOGIC;
       P2S : out STD_LOGIC
  );
end component;
component hands_mem
  port (
       ENABLE_1 : in STD_LOGIC;
       ENABLE_2 : in STD_LOGIC;
       IN_CARD : in UNSIGNED(0 to 4);
       P1 : in STD_LOGIC;
       P2 : in STD_LOGIC;
       RESET : in STD_LOGIC;
       TURN : in STD_LOGIC;
       GIVE_AGAIN : out STD_LOGIC;
       S1 : out UNSIGNED(0 to 4);
       S2 : out UNSIGNED(0 to 4)
  );
end component;
component move_mem
  port (
       G_OVER : in INTEGER;
       N : in STD_LOGIC;
       P1 : in STD_LOGIC;
       P2 : in STD_LOGIC;
       RESET : in STD_LOGIC;
       Y : in STD_LOGIC;
       END_GAME : out STD_LOGIC;
       GIVE : out STD_LOGIC;
       TURN : out STD_LOGIC
  );
end component;
component rcg
  port (
       ENABLE_1 : in STD_LOGIC;
       ENABLE_2 : in STD_LOGIC;
       GIVE_AGAIN : in STD_LOGIC;
       GIVE_CARD : in STD_LOGIC;
       GIVE_NEW_CARD : in STD_LOGIC;
       RESET : in STD_LOGIC;
       GEN_CARD : out STD_LOGIC_VECTOR(0 to 3)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;
signal Dangling_Input_Signal_UNSIGNED : UNSIGNED;
signal Dangling_Input_Signal_INTEGER : INTEGER;

begin

----  Component instantiations  ----

U1 : black_jack
  port map(
       E1 => Dangling_Input_Signal,
       E2 => Dangling_Input_Signal,
       N => Dangling_Input_Signal,
       Y => Dangling_Input_Signal
  );

U2 : card_mem
  port map(
       CARD(0) => Dangling_Input_Signal,
       CARD(1) => Dangling_Input_Signal,
       CARD(2) => Dangling_Input_Signal,
       CARD(3) => Dangling_Input_Signal,
       ENABLE => Dangling_Input_Signal,
       RESET => Dangling_Input_Signal
  );

U3 : comp_unit
  port map(
       EN => Dangling_Input_Signal,
       EN1 => Dangling_Input_Signal,
       END_GAME => Dangling_Input_Signal,
       RESET => Dangling_Input_Signal,
       S1(0) => Dangling_Input_Signal_UNSIGNED,
       S1(1) => Dangling_Input_Signal_UNSIGNED,
       S1(2) => Dangling_Input_Signal_UNSIGNED,
       S1(3) => Dangling_Input_Signal_UNSIGNED,
       S1(4) => Dangling_Input_Signal_UNSIGNED,
       S2(0) => Dangling_Input_Signal_UNSIGNED,
       S2(1) => Dangling_Input_Signal_UNSIGNED,
       S2(2) => Dangling_Input_Signal_UNSIGNED,
       S2(3) => Dangling_Input_Signal_UNSIGNED,
       S2(4) => Dangling_Input_Signal_UNSIGNED
  );

U4 : hands_mem
  port map(
       ENABLE_1 => Dangling_Input_Signal,
       ENABLE_2 => Dangling_Input_Signal,
       IN_CARD(0) => Dangling_Input_Signal_UNSIGNED,
       IN_CARD(1) => Dangling_Input_Signal_UNSIGNED,
       IN_CARD(2) => Dangling_Input_Signal_UNSIGNED,
       IN_CARD(3) => Dangling_Input_Signal_UNSIGNED,
       IN_CARD(4) => Dangling_Input_Signal_UNSIGNED,
       P1 => Dangling_Input_Signal,
       P2 => Dangling_Input_Signal,
       RESET => Dangling_Input_Signal,
       TURN => Dangling_Input_Signal
  );

U5 : move_mem
  port map(
       G_OVER => Dangling_Input_Signal_INTEGER,
       N => Dangling_Input_Signal,
       P1 => Dangling_Input_Signal,
       P2 => Dangling_Input_Signal,
       RESET => Dangling_Input_Signal,
       Y => Dangling_Input_Signal
  );

U6 : rcg
  port map(
       ENABLE_1 => Dangling_Input_Signal,
       ENABLE_2 => Dangling_Input_Signal,
       GIVE_AGAIN => Dangling_Input_Signal,
       GIVE_CARD => Dangling_Input_Signal,
       GIVE_NEW_CARD => Dangling_Input_Signal,
       RESET => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end TEST;
