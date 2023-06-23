# Made by Pencherek based on code made by Axam
# This code will let the user interact with a compter, the leds show the value of it, one button to add 1 and one to sub 1
init:
	add x7 zero zero	#register for the compter
	li x8 0b11111111 	#max number for the compter
	# Set leds off
	li   leds 0b00000000
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
 	#prepare register for branching
	addi x5 zero 1		#value test for btn1
	addi x6 zero 2		#value test for btn2

# Goal of the program
	# 1) Wait a bit
	# 2) Check buttons state
	# 3) Increment or decrement x7 upon button push
 	# 4) Show x7 value with the leds
# Special
	# Led(0) indicates if we are waiting (for measurement)
main:
	# Time a bit before reading buttons again, near 167.8 ms @ 50 MHz
	#   x1 is i
	#   x20 is target, count to arnd. ((1'048'576 * 4) - 2)*4 (4 instr. in loop, the last only 2, *4 clocks by instr (beq only 3 but meh, arnd.))
	#   x2 is slt res.
	#   x3, x4 (1) are for blinking wait led
	mv   x1 x0
	#sub  x3 x3 x4
	#andi x3 x3 1
	#or   leds leds x3
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
	beq btns x5 btn1	#branch if btn1 was pressed
	beq btns x6 btn2	#branch if btn2 was pressed
	jal end
 
btn1:
	beq leds x8 leds_zero	#reset compter if to big
	addi x7 x7 1
	jal  end

leds_zero:			#set compter to 0
	add x7 zero zero
	jal  end

btn2:
	addi x7 x7 -1

# No buttons are pressed / show x7 value with leds
end:
	add   leds zero x7
	jal  main

# Life saver ! Keep it
life_saver:
	jal  init
