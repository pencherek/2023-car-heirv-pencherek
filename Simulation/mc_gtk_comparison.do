onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gray60 -label rst /heirv32_mc_tb/U_tester/rst
add wave -noupdate -color Gray60 -label clk /heirv32_mc_tb/U_tester/clk
add wave -noupdate -color Gray70 -label info /heirv32_mc_tb/U_tester/testInfo
add wave -noupdate -color {Violet Red} -label en /heirv32_mc_tb/U_tester/en
add wave -noupdate /heirv32_mc_tb/U_heirv32/PC
add wave -noupdate /heirv32_mc_tb/U_heirv32/PCNext
add wave -noupdate /heirv32_mc_tb/U_heirv32/resultSrc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {210516 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {32479 ps} {450994 ps}
