library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
entity BLACK_JACK is
	port(Y,N,E1,E2 : in STD_LOGIC;
	S1,S2 : out STD_LOGIC_VECTOR(0 to 4);
	CC : out STD_LOGIC_VECTOR(0 to 3);
	GAME_RESULT : out INTEGER;
	TURN : out STD_LOGIC);
end BLACK_JACK;

architecture ARH of BLACK_JACK is

component CARD_MEM is
	port(CARD : in STD_LOGIC_VECTOR(0 to 3);
		RESET,ENABLE : in STD_LOGIC;
		VER_CARD: out STD_LOGIC_VECTOR(0 to 4);
		GIVE_NEW : out STD_LOGIC);
end component CARD_MEM;

component HANDS_MEM is
	port(IN_CARD : in unsigned(0 to 4);
	RESET,TURN,P1,P2,ENABLE_1,ENABLE_2 : in STD_LOGIC;
	S1,S2 : out unsigned(0 to 4);
	GIVE_AGAIN : out STD_LOGIC);
end component HANDS_MEM;	  

component COMP_UNIT is
	port(S1,S2 : in unsigned(0 to 4);
	RESET,END_GAME,EN,EN1: in STD_LOGIC;
	P1S,P2S,MASTER_RESET : out STD_LOGIC;
	END_RESULT : out NATURAL);
end component COMP_UNIT;

component RCG is
	port(GIVE_CARD, GIVE_NEW_CARD, ENABLE_1,ENABLE_2,RESET,GIVE_AGAIN: in STD_LOGIC;
	GEN_CARD : out STD_LOGIC_VECTOR(0 to 3));
end component RCG;

component MOVE_MEM is
	port(Y,N,P1,P2,RESET : in STD_LOGIC;
	G_OVER : in INTEGER;
	GIVE,END_GAME,TURN : out STD_LOGIC);
end component MOVE_MEM;

	signal END_GAME,P1S,P2S,T,GIVE_C,GIVE_NC,GIVE_AGAIN : STD_LOGIC := '0';
	signal R : STD_LOGIC := '0';
	signal RG_CARD : STD_LOGIC_VECTOR(0 to 3) := "0000";
	signal CURENT_CARD : STD_LOGIC_VECTOR(0 to 4) := "00000";
	signal SUM1,SUM2 : unsigned(0 to 4) := "00000";
	signal G_OVER : INTEGER := 0;
begin
RCG1 : RCG port map(GIVE_C,GIVE_NC,E1,E2,R,GIVE_AGAIN,RG_CARD);
CARD_MEM1 : CARD_MEM port map(RG_CARD,R,E2,CURENT_CARD,GIVE_NC);
HANDS_MEM1 : HANDS_MEM port map(unsigned(CURENT_CARD),R,T,P1S,P2S,E1,E2,SUM1,SUM2,GIVE_AGAIN);
COMP_UNIT1 : COMP_UNIT port map(SUM1,SUM2,R,END_GAME,E2,E1,P1S,P2S,R,G_OVER);
MOVE_MEM1 :	MOVE_MEM port map(Y,N,P1S,P2S,R,G_OVER,GIVE_C,END_GAME,T);

CC <= RG_CARD,"0000" after 3000 ms;
GAME_RESULT <= G_OVER;
S1 <= STD_LOGIC_VECTOR(SUM1);
S2 <= STD_LOGIC_VECTOR(SUM2);
TURN <= T;

end architecture ARH;