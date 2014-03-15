----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:51 03/12/2014 
-- Design Name: 
-- Module Name:    Change_Inputs - Behavioral 
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

entity Change_Inputs is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dig0 : in  STD_LOGIC;
           dig1 : in  STD_LOGIC;
           dig2 : in  STD_LOGIC;
           floor : out  STD_LOGIC_VECTOR (3 downto 0));
end Change_Inputs;

architecture Behavioral of Change_Inputs is

type floor_state_type is (floor0, floor1, floor2, floor3, floor4, floor5, floor6, floor7);

signal floor_state : floor_state_type;

begin

floor_state_machine : process(clk)
begin
	if clk'event and clk='1' then
		if reset='1' then
			floor_state <= floor0;
		else
			case floor_state is
			
				when floor0 =>
					if (dig2 = '0' and dig1='0' and dig0='0') then
						floor_state <= floor0;
					else 
						floor_state <= floor1;
					end if;
					
				when floor1 =>
					if (dig2 = '0' and dig1='0' and dig0='0') then
						floor_state <= floor0;
					elsif (dig2 = '0' and dig1='0' and dig0='1') then
						floor_state <= floor1;
					else
						floor_state <= floor2;
					end if;
					
				When floor2 =>
					if (dig2 = '0' and dig1='0' and dig0='0') then
						floor_state <= floor1;
					elsif (dig2 = '0' and dig1='0' and dig0='1') then
						floor_state <= floor1;
					elsif (dig2 = '0' and dig1='1' and dig0='0') then
						floor_state <= floor2;
					else
						floor_state <= floor3;
					end if;
					
					
				When floor3 =>
					if (dig2 = '0' and dig1='0' and dig0='0') then
						floor_state <= floor2;
					elsif (dig2 = '0' and dig1='0' and dig0='1') then
						floor_state <= floor2;
					elsif (dig2 = '0' and dig1='1' and dig0='0') then
						floor_state <= floor2;
					elsif (dig2 = '0' and dig1='1' and dig0='1') then
						floor_state <= floor3;
					else
						floor_state <= floor4;
					end if;
					
				When floor4 =>
					if (dig2 = '0' and dig1='0' and dig0='0') then
						floor_state <= floor3;
					elsif (dig2 = '0' and dig1='0' and dig0='1') then
						floor_state <= floor3;
					elsif (dig2 = '0' and dig1='1' and dig0='0') then
						floor_state <= floor3;
					elsif (dig2 = '0' and dig1='1' and dig0='1') then
						floor_state <= floor3;
					elsif (dig2 = '1' and dig1='0' and dig0='0') then
						floor_state <= floor4;
					else
						floor_state <= floor5;
					end if;
					
					When floor5 =>
						if (dig2 = '0' and dig1='0' and dig0='0') then
							floor_state <= floor4;
						elsif (dig2 = '0' and dig1='0' and dig0='1') then
							floor_state <= floor4;
						elsif (dig2 = '0' and dig1='1' and dig0='0') then
							floor_state <= floor4;
						elsif (dig2 = '0' and dig1='1' and dig0='1') then
							floor_state <= floor4;
						elsif (dig2 = '1' and dig1='0' and dig0='0') then
							floor_state <= floor4;
						elsif (dig2 = '1' and dig1='0' and dig0='1') then
							floor_state <= floor5;
						else
							floor_state <= floor6;
						end if;
					
					
					When floor6 =>
						if (dig2 = '0' and dig1='0' and dig0='0') then
							floor_state <= floor5;
						elsif (dig2 = '0' and dig1='0' and dig0='1') then
							floor_state <= floor5;
						elsif (dig2 = '0' and dig1='1' and dig0='0') then
							floor_state <= floor5;
						elsif (dig2 = '0' and dig1='1' and dig0='1') then
							floor_state <= floor5;
						elsif (dig2 = '1' and dig1='0' and dig0='0') then
							floor_state <= floor5;
						elsif (dig2 = '1' and dig1='0' and dig0='1') then
							floor_state <= floor5;
						elsif (dig2 = '1' and dig1='1' and dig0='0') then
							floor_state <= floor6;
						else
							floor_state <= floor7;
						end if;
						
					When floor7 =>
						if (dig2 = '0' and dig1='0' and dig0='0') then
							floor_state <= floor6;
						elsif (dig2 = '0' and dig1='0' and dig0='1') then
							floor_state <= floor6;
						elsif (dig2 = '0' and dig1='1' and dig0='0') then
							floor_state <= floor6;
						elsif (dig2 = '0' and dig1='1' and dig0='1') then
							floor_state <= floor6;
						elsif (dig2 = '1' and dig1='0' and dig0='0') then
							floor_state <= floor6;
						elsif (dig2 = '1' and dig1='0' and dig0='1') then
							floor_state <= floor6; 
						elsif (dig2 = '1' and dig1='1' and dig0='0') then
							floor_state <= floor6;
						elsif (dig2 = '1' and dig1='1' and dig0='1') then
							floor_state <= floor6;
						else
							floor_state <= floor7;
						end if;
					
					
					when others =>
						floor_state <= floor0;
					
				end case;
			end if;
		end if;
	end process;
	
	floor <= "0000" when (floor_state = floor0) else
				"0001" when (floor_state = floor1) else
				"0010" when (floor_state = floor2) else
				"0011" when (floor_state = floor3) else
				"0100" when (floor_state = floor4) else
				"0101" when (floor_state = floor5) else
				"0110" when (floor_state = floor6) else
				"0111" when (floor_state = floor7) else
				"0000" when (reset = '1') else
				"0000";
					
				


end Behavioral;

