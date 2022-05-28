.data
c: .word 0x000
q: .word 0x000
v: .word 0x000

.text
lw a2 c
lw a3 q
lw a4 v

capacitance:
	bne a2, x0, charge
	beq a3, x0, charge
	beq a4, x0, charge

	div a0, a3, a4
 	j end
    
charge:
	beq a2, x0, voltage
	bne a3, x0, voltage
	beq a4, x0, voltage

	mul a0, a2, a4
	j end
    
voltage:
	beq a2, x0, return0
	beq a3, x0, return0
	bne a4, x0, return0

	div a0, a3, a2
	j end
    
return0:
	li a0, 0
	j end
    
end:
	nop
