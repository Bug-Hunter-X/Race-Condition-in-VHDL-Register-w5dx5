```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity my_entity is
    port (
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of my_entity is
    signal internal_reg : std_logic_vector(7 downto 0) := "00000000";
begin
    process (clk, reset)
    begin
        if reset = '1' then
            internal_reg <= "00000000";
        elsif rising_edge(clk) then
            internal_reg <= data_in;
        end if;
    end process;

data_out <= internal_reg;
end architecture;
```