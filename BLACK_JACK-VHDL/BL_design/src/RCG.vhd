library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
entity RCG is
	port(GIVE_CARD, GIVE_NEW_CARD, ENABLE_1,ENABLE_2,RESET,GIVE_AGAIN: in STD_LOGIC;
	GEN_CARD : out STD_LOGIC_VECTOR(0 to 3));
end RCG;

architecture ARH of RCG is
signal CC : STD_LOGIC_VECTOR(0 to 3) := "0000";
signal COUNT_AGAIN,RESTART : STD_LOGIC := '0';
signal PARITY : STD_LOGIC := '0';
begin
process(GIVE_CARD,GIVE_NEW_CARD,ENABLE_1,ENABLE_2,COUNT_AGAIN,RESET,GIVE_AGAIN)
	begin
	if(RESET = '0' or RESET = 'U') then
		if(ENABLE_1 = '1') then
			if(ENABLE_2 = '0') then
				case CC is--2-14-3-13-4-12-5-11-6-10-7-9-8<->
					when "0010" => CC <= "1110";
					when "0011" => CC <= "1101";
					when "0100" => CC <= "1100";
					when "0101" => CC <= "1011";
					when "0110" => CC <= "1010";
					when "0111" => CC <= "1001";
					when "1000" => CC <= "0010";
					when "1001" => CC <= "1000";
					when "1010" => CC <= "0111";
					when "1011" => CC <= "0110";
					when "1100" => CC <= "0101";
					when "1101" => CC <= "0100";
					when "1110" => CC <= "0011";
					when others => CC <= "0010";
				end case;
				COUNT_AGAIN <= not(COUNT_AGAIN) after 100 ms;
			else
				if((GIVE_CARD or GIVE_NEW_CARD or GIVE_AGAIN) = '1') then	
					if(PARITY = '0') then
						case CC is
							when "0010" => CC <= "1000";
							when "0011" => CC <= "1100";
							when "0100" => CC <= "1110";
							when "0101" => CC <= "0010";
							when "0110" => CC <= "1011";
							when "0111" => CC <= "1010";
							when "1000" => CC <= "1101";
							when "1001" => CC <= "0011";
							when "1010" => CC <= "0101";
							when "1011" => CC <= "0100";
							when "1100" => CC <= "1001";
							when "1101" => CC <= "0111";
							when "1110" => CC <= "0110";
							when others => CC <= "0010";
						end case;
					else
						case CC is
							when "0010" => CC <= "1101";
							when "0011" => CC <= "0111";
							when "0100" => CC <= "0110";
							when "0101" => CC <= "0011";
							when "0110" => CC <= "1000";
							when "0111" => CC <= "0100";
							when "1000" => CC <= "1110";
							when "1001" => CC <= "1011";
							when "1010" => CC <= "1100";
							when "1011" => CC <= "1010";
							when "1100" => CC <= "0010";
							when "1101" => CC <= "0101";
							when "1110" => CC <= "1001";
							when others => CC <= "0010";
						end case;
					end if;
					PARITY <= not(PARITY);
				end if;
			end if;
		end if;
	end if;
end process;
process(GIVE_CARD,GIVE_NEW_CARD,GIVE_AGAIN)
begin
		 
	if(ENABLE_1 and ENABLE_2 and not(RESET)) = '1' then
		if((GIVE_CARD or GIVE_NEW_CARD or GIVE_AGAIN) = '1') then
				GEN_CARD <= CC;
		end if;							
	end if;
end process;
end architecture ARH;