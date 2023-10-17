-- altera vhdl_input_version vhdl_2008
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY serial_to_parallel_converter IS
   port(
    clk, rst_n, scl, sda : in std_logic;
	-- avalon-st signals
	dout		: out std_logic_vector(7 downto 0);
	ready		: in std_logic;
	valid, err	: out std_logic
);
END serial_to_parallel_converter;

ARCHITECTURE behav OF serial_to_parallel_converter IS

	signal reg : std_logic_vector(12 downto 0) := (others=>'0');
	signal scl_r : std_logic := '0';
	signal bit_cntr : natural := 0;

BEGIN
	
	process(clk, rst_n)
	begin
		if(not rst_n) then
			reg <= (others=>'0');
			scl_r <= '0';
			bit_cntr <= 0;
		elsif(rising_edge(clk)) then
			scl_r <= scl;
			if(scl_r = '0' and scl = '1') then -- positive edge
				reg <= reg(reg'high - 1 downto 0) & sda;
				if(bit_cntr = 14) then
					bit_cntr <= 0;
				else
					bit_cntr <= bit_cntr + 1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk, rst_n)
	begin
		if(not rst_n) then
			valid <= '0';
		elsif(rising_edge(clk)) then
			if(ready ='1' and bit_cntr = 14) then
				valid <= '1';
			else
				valid <= '0';
			end if;
		end if;
	end process;
	
	dout <= reg(reg'high - 1 downto 4); -- most significant 8 bits
	err <= '0';
  
END behav;