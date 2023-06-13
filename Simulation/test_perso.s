# Made by Axam
# This code will light leds following if buttons are pressed or not
init:
	add x7 zero zero
	li x8 0b11111111 
	# Set leds off
	li   leds 0b11000111
	# Init timer target (as we don't support big int (LUI) nor shifts, add himself to himself = *2 each time)
	  # x20 = 0x7ff = 2048
	li   x20 0b11111111111
	  # *2 = 4096
	add  x20 x20 x20
	  # *2 = 8192
	add  x20 x20 x20
	  # *2 = 16384
	add  x20 x20 x20
	  # *2 = 32768
	add  x20 x20 x20
	  # *2 = 65536
	add  x20 x20 x20
	  # *2 = 131072
	add  x20 x20 x20
	  # *2 = 262144
	add  x20 x20 x20
	  # *2 = 524288
	add  x20 x20 x20
	# Wait led state
	li   x4  1
	addi x5 zero 1
	addi x6 zero 2

# Goal of the program
	# 1) Wait a bit
	# 2) Check buttons state
	# 3) Light leds depending on button
# Special
	# Led(0) indicates if we are waiting (for measurement)
main:
	# Time a bit before reading buttons again, near 167.8 ms @ 50 MHz
	#   x1 is i
	#   x20 is target, count to arnd. ((1'048'576 * 4) - 2)*4 (4 instr. in loop, the last only 2, *4 clocks by instr (beq only 3 but meh, arnd.))
	#   x2 is slt res.
	#   x3, x4 (1) are for blinking wait led
	mv   x1 x0
	sub  x3 x3 x4
	andi x3 x3 1
	or   leds leds x3
wait:
	slt  x2 x1 x20
	beq  x2 x0 wait_end
	addi x1 x1 1
	beq  x0 x0 wait
# Timer is done, check which leds to light depending on buttons
wait_end:
	beq  btns x0 end


# Any button is pressed if we did not branch
btns_on:
	beq btns x5 btn1
	beq btns x6 btn2
	
btn1:
	beq leds x8 leds_zero
	addi x7 x7 1
	jal  end

leds_zero:
	add x7 zero zero
	jal  end

btn2:
	addi x7 x7 -1

# No buttons are pressed
end:
	li   leds x7
	jal  main

# Life saver ! Keep it
life_saver:
	jal  init
