library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
entity COMP_UNIT is
	port(S1,S2 : in unsigned(0 to 4);
	RESET,END_GAME,EN,EN1: in STD_LOGIC;
	P1S,P2S,MASTER_RESET : out STD_LOGIC;
	END_RESULT : out NATURAL);
end COMP_UNIT;

architecture ARH of COMP_UNIT is
signal MR : STD_LOGIC := '0';
signal END_RES : INTEGER := 0;
signal REFRESH : STD_LOGIC := '0';
begin
	
C_PLAY: process(S1,S2,END_GAME,RESET,EN)
begin
	if(S1 > "01000") then P1S <= '1';
	end if;
	if(S2 > "01000") then P2S <= '1';
	end if;	 
	if(RESET = '1') then
		P1S <= '0';
		P2S <= '0';
		MR <= '0';
		END_RESULT <= 0;
		REFRESH <= '0';
	elsif(EN = '1' and EN'event) then
		REFRESH <= '1';
	elsif(END_GAME = '1') then
		if(S1 > S2) then END_RESULT <= 1; MR <= '1';
		end if;
		if(S2 > S1) then END_RESULT <= 2; MR <= '1';
		end if;
		if(S1 = S2) then END_RESULT <= 3; MR <= '1';
		end if;
	else
		if(S1 = "10101") then END_RESULT <= 1; MR <= '1';
		end if;
		if(S1 > "10101") then END_RESULT <= 2; MR <= '1';
		end if;
		if(S2 = "10101") then END_RESULT <= 2; MR <= '1';
		end if;
		if(S2 > "10101") then END_RESULT <= 1; MR <= '1';
		end if;
	end if;
end process C_PLAY;
process(MR,REFRESH)
begin
	if(REFRESH'event) then MASTER_RESET <= REFRESH;
	elsif(MR'event) then MASTER_RESET <= MR after 15000 ms; 
	end if;
end process;
end architecture ARH;