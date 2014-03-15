----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C2C Cassie McPeek
-- 
-- Create Date:    10:35:17 03/12/2014 
-- Design Name: 
-- Module Name:    More_Floors - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity More_Floors is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           floor_dig1 : out  STD_LOGIC_VECTOR (3 downto 0);
           floor_dig2 : out  STD_LOGIC_VECTOR (3 downto 0));
end More_Floors;


architecture Behavioral of More_Floors is

type floor_state_type is (floor2, floor3, floor5, floor7, floor11, floor13, floor17, floor19);

signal floor_state : floor_state_type;

begin

floor_state_machine: process(clk)
begin
	if clk'event and clk = '1' then
		if reset = '1' then
			floor_state <= floor2;
		else
			case floor_state is
				 
				when floor2 => 
					if(up_down = '1' and stop = '0') then
						floor_state <= floor3;
					else
						floor_state <= floor2;
					end if;
				
				when floor3 =>
					if(up_down = '1' and stop = '0') then
						floor_state <= floor5;
					elsif (up_down='0' and stop = '0') then
						floor_state <= floor2;
					else
						floor_state <= floor3;
					end if;
					
				when floor5 =>
					if (up_down = '1' and stop ='0') then
						floor_state <= floor7;
					elsif (up_down = '0' and stop = '0') then
						floor_state <= floor3;
					else 
						floor_state <= floor5;
					end if;
				
				When floor7 =>
					if (up_down = '1' and stop = '0') then
						floor_state <= floor11;
					elsif (up_down = '0' and stop = '0') then
						floor_state <= floor5;
					else 
						floor_state <= floor7;
					end if;
					
				When floor11 =>
					if (up_down = '1' and stop = '0') then
						floor_state <= floor13;
					elsif (up_down = '0' and stop = '0') then
						floor_state <= floor7;
					else
						floor_state <= floor11;
					end if;
				
				When floor13 =>
					if (up_down = '1' and stop = '0') then
						floor_state <= floor17;
					elsif (up_down = '0' and stop = '0') then 
						floor_state <= floor11;
					else 
						floor_state <= floor13;
					end if;
				
				When floor17 =>
					if (up_down = '1' and stop = '0') then
						floor_state <= floor19;
					elsif (up_down = '0' and stop = '0') then 
						floor_state <= floor13;
					else 
						floor_state <= floor17;
					end if;
					
				When floor19 =>
					if (up_down = '0' and stop = '0') then
						floor_state <= floor17;
					else
						floor_state <= floor19;
					end if;
					
			
			-- for phantom states
				When others =>
					floor_state <= floor2;
				end case;
			end if;
		end if;
	end process;
					
	floor_dig1 <= "0010" when (floor_state = floor2) else
					  "0011" when (floor_state = floor3) else
					  "0101" when (floor_state = floor5) else
					  "0111" when (floor_state = floor7) else
					  "0001" when (floor_state = floor11) else
					  "0011" when (floor_state = floor13) else
					  "0111" when (floor_state = floor17) else
					  "1001" when (floor_state = floor19) else
					  "0001" when (reset = '1') else
					  "0001";
					  
	floor_dig2 <= "0000" when (floor_state = floor2) else
					  "0000" when (floor_state = floor3) else
					  "0000" when (floor_state = floor5) else
					  "0000" when (floor_state = floor7) else
					  "0001" when (floor_state = floor11) else
					  "0001" when (floor_state = floor13) else
					  "0001" when (floor_state = floor17) else
					  "0001" when (floor_state = floor19) else
					  "0000" when (reset = '1') else
					  "0000"; 
					  

end Behavioral;

