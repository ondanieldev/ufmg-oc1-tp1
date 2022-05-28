.data
n: .word 0x00A

.text
main:
  lw x10, n
  jal x1, fib
  jal x0, end

fib:
  baseCase1:
    bne x10, x0, baseCase2
    addi x11, x0, 0
    jalr x0, 0(x1)

  baseCase2:
    li x5, 1
    bne x10, x5, execute
    addi x11, x5, 0
    jalr x0, 0(x1)

  execute:
    addi sp, sp, -12
    sw x1, 0(sp)
    sw x10, 4(sp)
    addi x10, x10, -1
    jal x1, fib
    lw x10, 4(sp)
    sw x11, 8(sp)
    addi x10, x10, -2
    jal x1, fib
    lw x5, 8(sp)
    add x11, x5, x11
    lw x1, 0(sp)
    addi sp, sp, 12
    jalr x0, 0(x1)

end:
  nop