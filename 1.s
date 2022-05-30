.data
# you may setup an initial value for each variable
# the variable with value 0 is gonna be calculated
# if two or more variables is 0, then the return value is gonna be 0
# if there is not a param with value 0, then return value is gonna be 0 too 
# the return value will always be storaged on x10 (the same register of "c" param)
c: .word 0x000	# capacitance
q: .word 0x00A	# charge
v: .word 0x005	# voltage

.text
# main function loads params values and calls "calc" function
# after "calc" execution, ends the program
main:
	lw x10 c
	lw x11 q
	lw x12 v
	jal x1, calc
	jal x0, end

calc:
	capacitance:
		bne x10, x0, charge		# if c=0
		beq x11, x0, charge		# and q!=0 
		beq x12, x0, charge 	# and v!=0

		div x10, x11, x12			# c=q/v
		jalr x0, 0(x1)				# return
			
	charge:
		beq x10, x0, voltage	# if c!=0
		bne x11, x0, voltage	#	and q=0
		beq x12, x0, voltage	#	and v!=0

		mul x10, x10, x12			#	q=c*v
		jalr x0, 0(x1)				# return
			
	voltage:
		beq x10, x0, return0	# if c!=0
		beq x11, x0, return0	# and q!=0
		bne x12, x0, return0	#	and v=0

		div x10, x11, x10			# v=q/c
		jalr x0, 0(x1)				# return
			
	return0:
		li x10, 0							# assign 0 to return value if two or more params are equal 0
		jalr x0, 0(x1)				# return
    
end:
	nop
