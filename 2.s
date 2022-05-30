.data
# you may setup an initial value for each variable
# the return value will always be storaged on x11
n: .word 0xA # number to get its fibonacci value

.text
# main function loads params values and calls "fib" function
# after "fib" execution, ends the program
main:
  lw x10, n
  jal x1, fib
  jal x0, end
fib:
  baseCase1:
    bne x10, x0, baseCase2  # if n=0
    addi x11, x0, 0         # fib(n)=0
    jalr x0, 0(x1)          # return
  baseCase2:
    li x5, 1
    bne x10, x5, execute    # if n=1
    addi x11, x5, 0         # fib(n)=1
    jalr x0, 0(x1)          # return
  execute:
    addi sp, sp, -12        # allocate 3 positions in the stack
    sw x1, 0(sp)            # current 1st stack position = current return address
    sw x10, 4(sp)           # current 2nd stack position = current n
    addi x10, x10, -1       # n=n-1
    jal x1, fib             # fib(n-1)
    lw x10, 4(sp)           # n=initial n caller 
    sw x11, 8(sp)           # current 3rd stack position = current fib(n-1)
    addi x10, x10, -2       # n=n-2
    jal x1, fib             # fib(n-2)
    lw x5, 8(sp)            # x5=fib(n-1)
    add x11, x5, x11        # fib(n)=fib(n-1)+fib(n-2)
    lw x1, 0(sp)            # return address=current 1st stack position
    addi sp, sp, 12         # missalocate 3 positions in the stack
    jalr x0, 0(x1)          # return
end:
  nop
