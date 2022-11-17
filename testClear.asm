  .data
ofile:  .asciiz     "/dev/tty"
msg:    .asciiz     "hello world\n"
clear:  .byte   0x1B,0x5B,0x33,0x3B,0x4A,0x1B,0x5B,0x48,0x1B,0x5B,0x32,0x4A
        .byte 0x00

sprintf_buf:
    .space  80
sprintf_bufe:

    .text
    .globl main
main:
    li      $v0,13                  # open file
    la      $a0,ofile               # filename to open
    li      $a1,1                   # 1=O_WRONLY
    li      $a2,0                   # mode [ignored]
    syscall
    move    $s7,$v0                 # remember open unit

main_loop:
    # clear the screen
    la      $a1,clear
    jal     fputs

    # format the progress number
    move    $a0,$t7
    addiu   $t7,$t7,1
    jal     sprintf

    # output the progress number
    jal     fputs

    # delay a bit
    li      $t0,500000
main_delay:
    subiu   $t0,$t0,1
    bnez    $t0,main_delay
    j       main_loop

# sprintf -- format a number
#
# RETURNS:
#   a1 -- pointer to buffer
#
# arguments:
#   a0 -- number to output
sprintf:
    la      $a1,sprintf_bufe        # get buffer pointer
    subi    $a1,$a1,1
    sb      $zero,0($a1)            # store EOS

    li      $t1,10                  # get decimal base

sprintf_loop:
    div     $a0,$t1                 # get both (num / 10) and (num % 10)
    mfhi    $t0                     # isolate digit (num % 10)

    # store ascii digit
    addi    $t0,$t0,'0'
    subiu   $a1,$a1,1
    sb      $t0,0($a1)              # store the digit

    mflo    $a0                     # num /= 10
    bnez    $a0,sprintf_loop

    jr      $ra

# fputs -- output string to "console"
#
# arguments:
#   s7 -- file descriptor
#   a1 -- pointer to string
fputs:
    move    $a2,$a1                 # get buffer address

# get string length
fputs_loop:
    lb      $t0,0($a2)              # get next char -- is it EOS?
    addiu   $a2,$a2,1               # increment length/buffer pointer
    bnez    $t0,fputs_loop          # no, loop

    subu    $a2,$a2,$a1             # get the length

    move    $a0,$s7                 # get file descriptor
    li      $v0,15                  # syscall for write
    syscall

    jr      $ra                     # return