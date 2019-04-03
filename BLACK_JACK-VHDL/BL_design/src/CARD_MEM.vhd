library	IEEE;
use IEEE.STD_LOGIC_1164.all;


entity CARD_MEM is
	port(CARD : in STD_LOGIC_VECTOR(0 to 3);
		RESET,ENABLE : in STD_LOGIC;
		VER_CARD: out STD_LOGIC_VECTOR(0 to 4);
		GIVE_NEW : out STD_LOGIC);
end CARD_MEM;

architecture ARH1 of CARD_MEM is
	type C_MEM is array(2 to 14) of INTEGER;
	signal MEM : C_MEM := (4,4,4,4,4,4,4,4,4,4,4,4,4);
begin
	process(CARD,RESET,ENABLE) 
	begin
		if(RESET = '1') then
		MEM <= (4,4,4,4,4,4,4,4,4,4,4,4,4);
		VER_CARD <= "00000";
		GIVE_NEW <= '0';
		elsif(ENABLE = '1' and not(RESET'event)) then	
			case CARD is
			when "0010" => if (MEM(2) > 0) then 
								VER_CARD <= "00010","00000" after 1 ms;
								MEM(2) <= MEM(2) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;
			when "0011" => if (MEM(3) > 0) then 
								VER_CARD <= "00011","00000" after 1 ms;
								MEM(3) <= MEM(3) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;
			when "0100" => if (MEM(4) > 0) then 
								VER_CARD <= "00100","00000" after 1 ms;
								MEM(4) <= MEM(4) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;
			when "0101" => if (MEM(5) > 0) then 
								VER_CARD <= "00101","00000" after 1 ms;
								MEM(5) <= MEM(5) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;				 
			when "0110" => if (MEM(6) > 0) then 
								VER_CARD <= "00110","00000" after 1 ms;
								MEM(6) <= MEM(6) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;			   
			when "0111" => if (MEM(7) > 0) then 
								VER_CARD <= "00111","00000" after 1 ms;
								MEM(7) <= MEM(7) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;			  
			when "1000" => if (MEM(8) > 0) then 
								VER_CARD <= "01000","00000" after 1 ms;
								MEM(8) <= MEM(8) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;			  
			when "1001" => if (MEM(9) > 0) then 
								VER_CARD <= "01001","00000" after 1 ms;
								MEM(9) <= MEM(9) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;				 
			when "1010" => if (MEM(10) > 0) then 
								VER_CARD <= "01010","00000" after 1 ms;
								MEM(10) <= MEM(10) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;			  
			when "1011" => if (MEM(11) > 0) then 
								VER_CARD <= "01010","00000" after 1 ms;
								MEM(11) <= MEM(11) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;
			when "1100" => if (MEM(12) > 0) then 
								VER_CARD <= "01010","00000" after 1 ms;
								MEM(12) <= MEM(12) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;			   
			when "1101" => if (MEM(13) > 0) then 
								VER_CARD <= "01010","00000" after 1 ms;
								MEM(13) <= MEM(13) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;				 
			when "1110" => if (MEM(14) > 0) then 
								VER_CARD <= "01011","00000" after 1 ms;
								MEM(14) <= MEM(14) - 1;
							else GIVE_NEW <= '1','0' after 5 ms;
							end if;
			when others => VER_CARD <= "00000";
			end case;
		end if;
	end process;
end ARH1;