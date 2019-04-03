library	 IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity HANDS_MEM is
	port(IN_CARD : in unsigned(0 to 4);
	RESET,TURN,P1,P2,ENABLE_1,ENABLE_2 : in STD_LOGIC;
	S1,S2 : out unsigned(0 to 4);
	GIVE_AGAIN : out STD_LOGIC);
end HANDS_MEM;

architecture ARH of HANDS_MEM is		

signal S1_SIG,S2_SIG : unsigned(0 to 4) := "00000";
signal RESTART,GIVE_AGAINS : STD_LOGIC := '0'; 

begin
	
process(IN_CARD,RESET)
	begin
		if(RESET = '1') then
			S1_SIG <= "00000";
			S2_SIG <= "00000";
			S1 <= "00000";
			S2 <= "00000";
		elsif (ENABLE_1 = '1' and ENABLE_2 = '1') then 
			if(P1 = '0' or P2 = '0') then
				if(RESTART = '0') then
					S1 <= S1_SIG + IN_CARD;
					S1_SIG <= S1_SIG + IN_CARD;
				else S2 <= S2_SIG + IN_CARD;
					S2_SIG <= S2_SIG + IN_CARD;
				end if;
			elsif(TURN = '0') then
				S1 <= S1_SIG + IN_CARD;
				S1_SIG <= S1_SIG + IN_CARD;
			else S2 <= S2_SIG + IN_CARD;
				S2_SIG <= S2_SIG + IN_CARD;
			end if;
		end if;
end process;

process(ENABLE_1,ENABLE_2,RESTART)
begin
	if(ENABLE_1 = '1' and ENABLE_2 = '1') then
		if(P1 = '0' or P2 = '0' or P1 = 'U' OR P2 = 'U') then
			case RESTART is
				when '0' => if(P1 = '0') then
							GIVE_AGAINS <= '1','0' after 1000 ms;
							RESTART <= '1' after 3000 ms;
							else
							RESTART <= '1' after 5 ms;
							end if;
				when '1' => if(P2 = '0') then
							GIVE_AGAINS <= '1','0' after 1000 ms;
							RESTART <= '0' after 3000 ms;
							else
							RESTART <= '0' after 5 ms;
							end if;
				when others => RESTART <= '0';
			end case;				
		end if;
	end if;								  	
end process;

	GIVE_AGAIN <= GIVE_AGAINS;


end architecture ARH;
	
		