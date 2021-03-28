 #Evaluate the expression 3ab - 2bc- 5a+ 20ac -16
#
# Settings: Load delays OFF; Branch delays OFF,
#           Trap file    ON; Pseudoinstructions ON   

        .globl  main

main:   
        lw      $t0,a          # get a
        lw      $t1,bb         # get b
        li      $t6,3          #t6=3
        mul     $t0,$t0,$t1    # a*b
        mul     $t0,$t0,$t6    #3ab
        
        subu    $sp,$sp,4      # push 3a*b onto stack
        sw      $t0,($sp)
        
        lw      $t0,bb         # get b
        lw      $t2 c
        li      $t1,-2          # t1=-2
        mul     $t0,$t0,$t1    # -2b
        mul     $t0,$t0,$t2    #-2bc
        subu    $sp,$sp,4      # push -2bc onto stack
        sw      $t0,($sp)
        
        lw      $t0,a        # get a
        li      $t1,-5         #t1=5
        mul     $t0,$t0,$t1    # -5a
        subu    $sp,$sp,4      # push -5a onto stack
        sw      $t0,($sp)
        
        lw      $t0,a       # get a
        lw      $t2 c       #get c
        li      $t1,20        # t1=20
        mul     $t0,$t0,$t1    # 20a
        mul     $t0,$t0,$t2    #20ac
        subu    $sp,$sp,4      # push 20ac onto stack
        sw      $t0,($sp)
        
        li      $t1,-16        # init sum to -16
        lw      $t0,($sp)      # pop 20ac
        addu    $sp,$sp,4
        addu    $t1,$t1,$t0    # 20ac -16
                
        lw      $t0,($sp)      # pop -5a
        addu    $sp,$sp,4
        addu    $t1,$t1,$t0    # -5a + 20ac -16
                
        lw      $t0,($sp)      # pop -2bc
        addu    $sp,$sp,4
        addu    $t1,$t1,$t0    # -2bc -5a + 20ac -16
        
         lw      $t0,($sp)      # pop 3ab
        addu    $sp,$sp,4   
        addu    $t1,$t1,$t0  # 3ab-2bc -5a + 20ac -16
         
done:   li      $v0,1          # print sum
        move    $a0,$t1
        syscall
        li      $v0,10         # exit
        syscall   

        .data
a:      .word  0
bb:     .word  0
c:       .word 0
