--
-- VHDL Architecture HEIRV32_MC.InstrDecoder.instr
--
-- Created:
--          by - noah.penchere.UNKNOWN (WE2330806)
--          at - 08:54:12 26.05.2023
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE instr OF InstrDecoder IS
BEGIN
process(op)
begin
	case op is
		when "0010011" => immSrc <= "00";
		when "0000011" => immSrc <= "00";
		when "1100111" => immSrc <= "00";
		when "1110011" => immSrc <= "00";
		when "0100011" => immSrc <= "01";
		when "1100011" => immSrc <= "10";
		when "1101111" => immSrc <= "11";
		when others => immSrc <= "--";
	end case;
end process;
END ARCHITECTURE instr;

