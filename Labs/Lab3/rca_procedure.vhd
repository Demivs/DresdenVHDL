library IEEE;
use IEEE.std_logic_1164.all;

entity rca_procedure is
  generic(
    N : positive
  );
  port(
    carry_in : in std_logic;
    word_1, word_2 : in std_logic_vector(N-1 downto 0);
    carry_out : out std_logic;
    summ : out std_logic_vector(N-1 downto 0)
  );
end entity;

architecture RCA_PROCEDURE_ARC of rca_procedure is

  procedure FAProc
    (signal a, b, cin : in std_logic;
     signal cout, s : out std_logic) is
  begin
    cout <= (a and b) or (cin and (a xor b));
    s <= a xor b xor cin;
  end FAProc;
  
  signal cout : std_logic_vector(N downto 0);
  
begin
  
  cout(0) <= carry_in;
  rca_fun_gen : for i in 0 to N-1 generate
  begin
    FAProc(word_1(i), word_2(i), cout(i), cout(i+1), summ(i));
  end generate;
  carry_out <= cout(N);
         
end architecture;
