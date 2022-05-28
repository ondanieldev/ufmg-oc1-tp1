.data
a: .word 0x0
n: .word 0xA

.text
main:
  lw x10 a
  lw x11 n

  li x5, 27
  sw x5, 0(x10)
  li x5, 16
  sw x5, 4(x10)
  li x5, 20
  sw x5, 8(x10)
  li x5, 49
  sw x5, 12(x10)
  li x5, 39
  sw x5, 16(x10)
  li x5, 48
  sw x5, 20(x10)
  li x5, 38
  sw x5, 24(x10)
  li x5, 7
  sw x5, 28(x10)
  li x5, 5
  sw x5, 32(x10)
  li x5, 19
  sw x5, 36(x10)

  jal x1, bubble_sort
  jal x0, end

bubble_sort:
  li x5, 0                       # i=0
  loop1:
    li x6, 0                     # j=0
    loop2:
      slli x28, x6, 2            # x28 = offset of address=j*4 (shift 2 = 4 bytes = 32bits = word)
      add x28, x10, x28          # x28 = address of array[j]
      lw x29, 0(x28)             # x29 = array[j]
  
      addi x30, x6, 1            # x30 = j+1
      slli x30, x30, 2           # x30 = offset of address=(j+1)*4
      add x30, x10, x30          # x30 = address of array[j+1]
      lw x31, 0(x30)             # x31 = array[j+1]

      blt x29, x31, end_of_loop2 # if (a[j] > a[j + 1])
      beq x29, x31, end_of_loop2 # if (a[j] > a[j + 1])

      sw x31, 0(x28)             # [j] = [j+1]
      sw x29, 0(x30)             # [j+1] = a[j]

      end_of_loop2:
        sub x31, x11, x5         # aux=n-i
        addi x31, x31, -1        # aux=aux-1
        addi x6, x6, 1           # j=j+1
        blt x6, x31, loop2       # j<n-i-1 ? loop2

    addi x5, x5, 1               # i=i+1
    blt x5, x11, loop1           # i<size ? loop

end:
  nop