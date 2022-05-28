.data
c: .word 0x000
q: .word 0x00A
v: .word 0x005

.text
main:
	lw x10 c
	lw x11 q
	lw x12 v
	jal x1, calc
	jal x0, end

calc:
	capacitance:
		bne x10, x0, charge
		beq x11, x0, charge
		beq x12, x0, charge

		div x10, x11, x12
		jalr x0, 0(x1)
			
	charge:
		beq x10, x0, voltage
		bne x11, x0, voltage
		beq x12, x0, voltage

		mul x10, x10, x12
		jalr x0, 0(x1)
			
	voltage:
		beq x10, x0, return0
		beq x11, x0, return0
		bne x12, x0, return0

		div x10, x11, x10
		jalr x0, 0(x1)
			
	return0:
		li x10, 0
		jalr x0, 0(x1)
    
end:
	nop
