
library ieee;
use ieee.std_logic_1164.all;
use work.mips_pkg.all;

entity byte_select is
	generic (
		SIZE : natural := 32);
	port 
	(
		w_in	   : in std_logic_vector(SIZE-1 downto 0); --Palavra de entrada
		sel		: in std_logic_vector(1 downto 0); --seleciona a posicao do offset
		w_out	: out std_logic_vector(SIZE-1 downto 0) -- Palavra de saida com os zeros
		
	);
end entity;

architecture rtl of byte_select is
begin
	w_out <= (w_in and X"000000FF") when (sel = "00") else 
				(w_in and X"0000FF00") when (sel = "01") else
				(w_in and X"00FF0000") when (sel = "10") else
				(w_in and X"FF000000");
end rtl;