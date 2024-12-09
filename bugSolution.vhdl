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
    signal sync_reg1 : std_logic_vector(7 downto 0);
    signal sync_reg2 : std_logic_vector(7 downto 0);
    signal internal_reg : std_logic_vector(7 downto 0) := "00000000";
begin
    process (clk, reset)
    begin
        if reset = '1' then
            sync_reg1 <= "00000000";
            sync_reg2 <= "00000000";
            internal_reg <= "00000000";
        elsif rising_edge(clk) then
            sync_reg1 <= data_in;
            sync_reg2 <= sync_reg1;
            internal_reg <= sync_reg2;
        end if;
    end process;

data_out <= internal_reg;
end architecture;
```