library IEEE;
use IEEE.numeric_bit.all;


entity decoder7 is 
port (clk: in bit;
      A: in unsigned(15 downto 0);
      Z: out unsigned(6 downto 0));

end decoder7;

architecture arch of decoder7 is 

type BDCRom is array (0 to 9) of unsigned(6 downto 0);
constant BCD : BCDRom  := ("0111111", "0000110", "1011011", "1001111", "1100110", "1101101", "1111100",
"0000111", "1111111", "1100111");

signal state,nextstate : integer 0 to 3 := 0;

begin 

process state 
begin
    case state is 
        when 0 =>
            Z<= BCDRom(to_integer(A(15 downto 12)));
            nextstate <= 1;
        when 1 => 
            Z <= BCDRom(to_integer(A(11 downto 8)));
            nextstate <= 2;
        when 2 => 
            Z <= BCDRom(to_integer(A(7 downto 4)));
            nextstate <= 3;
        when 3 => 
            Z <= BCDRom(to_integer(A(3 downto 0)));
            nextstate <= 0;
    end case;
end process;



process clk
begin
    if clk'event and clk = '1' then
        state <= nextstate;
    end if;
    end process;

    end arch;