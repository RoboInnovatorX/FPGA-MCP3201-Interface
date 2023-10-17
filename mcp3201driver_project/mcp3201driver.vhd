library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY adc_controller IS
   port(
      clk      : IN   STD_LOGIC;
      rst_n    : IN   STD_LOGIC;
      cs_n, scl: out  std_logic
);
END adc_controller;

ARCHITECTURE fsm OF adc_controller IS
   	TYPE STATE_TYPE IS (cs_disabled, cs_enabled, scl_high_0, scl_low_0, 
			scl_high_1, scl_low_1, scl_high_2, scl_low_2, 
			scl_high_3, scl_low_3, scl_high_4, scl_low_4,
			scl_high_5, scl_low_5, scl_high_6, scl_low_6,
			scl_high_7, scl_low_7, scl_high_8, scl_low_8,
			scl_high_9, scl_low_9, scl_high_10, scl_low_10,
			scl_high_11, scl_low_11, scl_high_12, scl_low_12,
			scl_high_13, scl_low_13, scl_high_14, scl_low_14
	);
   	SIGNAL state : STATE_TYPE;
	signal cnt : natural := 0;

BEGIN
	process(clk, rst_n)
	begin
		if(not rst_n) then
			cnt <= 0;
		elsif(rising_edge(clk)) then
			if(cnt = 520) then
				cnt <= 0;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;


   PROCESS (clk, rst_n)
   BEGIN
      IF (not rst_n) THEN
         state <= cs_disabled;
      ELSIF (rising_edge(clk)) THEN
         CASE state IS
            WHEN cs_disabled =>
               IF cnt = 35 THEN
                  state <= cs_enabled;
               ELSE
                  state <= cs_disabled;
               END IF;
            WHEN cs_enabled =>
               IF cnt = 40 THEN
                  state <= scl_high_0;
               ELSE
                  state <= cs_enabled;
               END IF;
            WHEN scl_high_0 =>
               IF cnt = 56 THEN
                  state <= scl_low_0;
               ELSE
                  state <= scl_high_0;
               END IF;
            WHEN scl_low_0 =>
               IF cnt = 72 THEN
                  state <= scl_high_1;
               ELSE
                  state <= scl_low_0;
               END IF;
			WHEN scl_high_1 =>
               IF cnt = 88 THEN
                  state <= scl_low_1;
               ELSE
                  state <= scl_high_1;
               END IF;
				WHEN scl_low_1 =>
               IF cnt = 104 THEN
                  state <= scl_high_2;
               ELSE
                  state <= scl_low_1;
               END IF;
			WHEN scl_high_2 =>
               IF cnt = 120 THEN
                  state <= scl_low_2;
               ELSE
                  state <= scl_high_2;
               END IF;
			WHEN scl_low_2 =>
               IF cnt = 136 THEN
                  state <= scl_high_3;
               ELSE
                  state <= scl_low_2;
               END IF;
			WHEN scl_high_3 =>
               IF cnt = 152 THEN
                  state <= scl_low_3;
               ELSE
                  state <= scl_high_3;
               END IF;
			WHEN scl_low_3 =>
					IF cnt = 168 THEN
                  state <= scl_high_4;
               ELSE
                  state <= scl_low_3;
               END IF;
			WHEN scl_high_4 =>
               IF cnt = 184 THEN
                  state <= scl_low_4;
               ELSE
                  state <= scl_high_4;
               END IF;
			WHEN scl_low_4 =>
				IF cnt = 200 THEN
                  state <= scl_high_5;
               ELSE
                  state <= scl_low_4;
               END IF;
			WHEN scl_high_5 =>
               IF cnt = 216 THEN
                  state <= scl_low_5;
               ELSE
                  state <= scl_high_5;
               END IF;
			WHEN scl_low_5 =>
               IF cnt = 232 THEN
                  state <= scl_high_6;
               ELSE
                  state <= scl_low_5;
               END IF;
			WHEN scl_high_6 =>
               IF cnt = 248 THEN
                  state <= scl_low_6;
               ELSE
                  state <= scl_high_6;
               END IF;
			WHEN scl_low_6 =>
               IF cnt = 264 THEN
                  state <= scl_high_7;
               ELSE
                  state <= scl_low_6;
               END IF;
			WHEN scl_high_7 =>
               IF cnt = 280 THEN
                  state <= scl_low_7;
               ELSE
                  state <= scl_high_7;
               END IF;
			WHEN scl_low_7 =>
               IF cnt = 296 THEN
                  state <= scl_high_8;
               ELSE
                  state <= scl_low_7;
               END IF;
			WHEN scl_high_8 =>
               IF cnt = 312 THEN
                  state <= scl_low_8;
               ELSE
                  state <= scl_high_8;
               END IF;
			WHEN scl_low_8 =>
               IF cnt = 328 THEN
                  state <= scl_high_9;
               ELSE
                  state <= scl_low_8;
               END IF;
			WHEN scl_high_9 =>
               IF cnt = 344 THEN
                  state <= scl_low_9;
               ELSE
                  state <= scl_high_9;
               END IF;
			WHEN scl_low_9 =>
               IF cnt = 360 THEN
                  state <= scl_high_10;
               ELSE
                  state <= scl_low_9;
               END IF;
			WHEN scl_high_10 =>
               IF cnt = 376 THEN
                  state <= scl_low_10;
               ELSE
                  state <= scl_high_10;
               END IF;
			WHEN scl_low_10 =>
               IF cnt = 392 THEN
                  state <= scl_high_11;
               ELSE
                  state <= scl_low_10;
               END IF;
			WHEN scl_high_11 =>
               IF cnt = 408 THEN
                  state <= scl_low_11;
               ELSE
                  state <= scl_high_11;
               END IF;
			WHEN scl_low_11 =>
               IF cnt = 424 THEN
                  state <= scl_high_12;
               ELSE
                  state <= scl_low_11;
               END IF;
			WHEN scl_high_12 =>
               IF cnt = 440 THEN
                  state <= scl_low_12;
               ELSE
                  state <= scl_high_12;
               END IF;
			WHEN scl_low_12 =>
               IF cnt = 456 THEN
                  state <= scl_high_13;
               ELSE
                  state <= scl_low_12;
               END IF;
			WHEN scl_high_13 =>
               IF cnt = 472 THEN
                  state <= scl_low_13;
               ELSE
                  state <= scl_high_13;
               END IF;
			WHEN scl_low_13 =>
               IF cnt = 488 THEN
                  state <= scl_high_14;
               ELSE
                  state <= scl_low_13;
               END IF;
			WHEN scl_high_14 =>
               IF cnt = 504 THEN
                  state <= scl_low_14;
               ELSE
                  state <= scl_high_14;
               END IF;
			WHEN scl_low_14 =>
               IF cnt = 520 THEN
                  state <= cs_disabled;
               ELSE
                  state <= scl_low_14;
               END IF;
         END CASE;
      END IF;
   END PROCESS;
   
   PROCESS (state)
   BEGIN
    CASE state IS
		WHEN cs_disabled =>
				cs_n <= '1';
				scl <= '0';
				
		WHEN cs_enabled =>
				cs_n <= '0';
				scl <= '0';
		
		WHEN scl_high_0 | scl_high_1 =>
				cs_n <= '0';
				scl <= '1';
		
		WHEN scl_low_0 | scl_low_1 =>
				cs_n <= '0';
				scl <= '0';

		WHEN scl_high_2 | scl_high_3 | scl_high_4 | scl_high_5 
			| scl_high_6 | scl_high_7  | scl_high_8 | scl_high_9 
			| scl_high_10 | scl_high_11 | scl_high_12 | scl_high_13 | scl_high_14 =>
				cs_n <= '0';
				scl <= '1';

		WHEN scl_low_2 | scl_low_3 | scl_low_4 
			| scl_low_5 | scl_low_6 | scl_low_7  | scl_low_8 
			| scl_low_9 | scl_low_10 | scl_low_11 | scl_low_12 | scl_low_13 | scl_low_14 =>
				cs_n <= '0';
				scl <= '0';

      END CASE;
   END PROCESS;
   
END fsm;