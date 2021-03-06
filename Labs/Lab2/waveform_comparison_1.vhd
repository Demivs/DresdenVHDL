library IEEE;
use IEEE.std_logic_1164.all;

entity WaveComparison1 is
end entity;

architecture WC_ARC_1 of WaveComparison1 is
  signal a, b, c : std_logic;
begin
  
  -- Process 1
  process
  begin
    wait for 10 ns;
    a <= '0';
    wait for 10 ns;
    a <= '1';
    wait; -- forever
  end process;
  
  -- Process 2
  process
  begin
    wait for 5 ns;
    b <= '0';
    wait for 10 ns;
    b <= '1';
    wait; -- forever
  end process;
  c <= a and b;
  
end architecture;  