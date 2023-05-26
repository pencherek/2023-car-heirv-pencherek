--
-- VHDL Architecture HEIRV32_MC.ALUDecoder.alu
--
-- Created:
--          by - noah.penchere.UNKNOWN (WE2330806)
--          at - 08:53:42 26.05.2023
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE alu OF ALUDecoder IS
BEGIN
process(ALUOp, funct3, funct7)
begin
	case ALUOp is
		when "00" => ALUControl <= "000";
		when "01" => ALUControl <= "001";
		when "10" =>
			case funct3 is
				when "000" =>
					if op = '1' and funct7 = '1' then 
						ALUControl <= "001";
					else
						ALUControl <= "000";
					end if;
				when "010" => ALUControl <= "101";
				when "110" => ALUControl <= "010";
				when "111" => ALUControl <= "011";
				when others => ALUControl <= "---";
			end case;
		when others => ALUControl <= "---";
	end case;
end process;
END ARCHITECTURE alu;

