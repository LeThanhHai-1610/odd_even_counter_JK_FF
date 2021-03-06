library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity dem_chan_le_JK_FF is
    port (
        --clr : in STD_LOGIC; 
        clk, rst : in STD_LOGIC; 
        q: out STD_LOGIC_VECTOR (2 downto 0)
        );
end dem_chan_le_JK_FF;
architecture dem_chan_le_JK_FF of dem_chan_le_JK_FF is 

signal J,K, qs : STD_LOGIC_VECTOR (2 downto 0);

begin
   J(1) <= '1';  K(1) <= '1';
   J(2) <= qs(1);  K(2) <= qs(1);
   J(0) <= qs(1) and qs(2);  K(0) <= qs(1) and qs(2);
-- Three JK flip-flops 
process (clk,rst) 
begin 
    if(rst = '1')then
        qs <= "000";
    elsif(clk'event and clk = '1')then
        if(J(0)='0' and K(0)='0')then
            qs(0) <= qs(0);
        elsif(J(0)='0' and K(0)='1')then
            qs(0) <= '0';
        elsif(J(0)='1' and K(0)='0')then
            qs(0) <= '1';
        elsif(J(0)='1' and K(0)='1')then
            qs(0) <= not qs(0);
        else
            null;
        end if;
        ------
        if(J(1)='0' and K(1)='0')then
            qs(1) <= qs(1);
        elsif(J(1)='0' and K(1)='1')then
            qs(1) <= '0';
        elsif(J(1)='1' and K(1)='0')then
            qs(1) <= '1';
        elsif(J(1)='1' and K(1)='1')then
            qs(1) <= not qs(1);
        else
            null;
        end if;
        ------
        if(J(2)='0' and K(2)='0')then
            qs(2) <= qs(2);
        elsif(J(2)='0' and K(2)='1')then
            qs(2) <= '0';
        elsif(J(2)='1' and K(2)='0')then
            qs(2) <= '1';
        elsif(J(2)='1' and K(2)='1')then
            qs(2) <= not qs(2);
        else
            null;
        end if;
    else
        null;
    end if;
end process;
q <= qs;
end dem_chan_le_JK_FF;
