library	IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MOVE_MEM is
	port(Y,N,P1,P2,RESET : in STD_LOGIC;
	G_OVER : in INTEGER;
	GIVE,END_GAME,TURN : out STD_LOGIC);
end MOVE_MEM;

architecture ARH of MOVE_MEM is
signal N_MEM : STD_LOGIC := '0';
signal T : STD_LOGIC := '0';
begin
	process(Y,N,RESET)
	begin
	if(RESET = '1') then
		END_GAME <= '0';
		T <= '0';
		N_MEM <= '0';
		GIVE <= '0';
	elsif P1 = '1' and P2 = '1' and G_OVER = 0 then
		if (N'event and N = '1' and N_MEM = '1') then
			END_GAME <= '1';
		elsif(N'event and N = '1') then
			if(T = '1') then T <= '0' after 2 ms;
			else T <= '1' after 2 ms;
			end if;
			N_MEM <= '1';
		elsif(Y'event and Y = '1' and N_MEM = '0') then
			GIVE <= '1','0' after 5 ms;
			if(T = '1') then T <= '0' after 2 ms;
			else T <= '1' after 2 ms;
			end if;
		elsif(Y'event and Y = '1' and N_MEM = '1') then GIVE <= '1','0' after 5 ms;
		end if;
	end if;
end process;
	TURN <= T;
  
end architecture ARH;