library IEEE;
use IEEE.numeric_bit.all;

entity dec_tb is 
end dec_tb;

architecture arch of dec_tb is 

component decoder7 is 
port (clk: in bit;
      A: in unsigned(15 downto 0);
      Z: out unsigned(6 downto 0));
end component;

signal clk: bit;
signal A:  unsigned(15 downto 0);
signal Z:  unsigned(6 downto 0);

begin s

UUT : decoder7 port map (clk,A,Z);
clk <= not clk after 5 ns;

process 
begin
A <= "0101000100101000";
wait for 40 ns;
A <= "0000000100111001";
wait for 40 ns;
end process;

end arch; 
