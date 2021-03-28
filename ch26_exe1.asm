# addthree.asm --- read in three integers and print their sum
#
# This program uses simple linkage.  
#
# Settings: Load delays  ON;  Branch delays ON
#           Trap file    ON;  Pseudoinstructions ON   
#

         .text
         .globl  main
main:
         jal     pread            # read first integer
         nop                      #  
         move    $s0,$v0          # save it in $s0

         jal     pread            # read second integer
         nop                      #  
         move    $s1,$v0          # save it in $s1
         li $s2,5
         

        jal multiply
        move $t0,$v1
        li $s3,-12
        
        jal multiply1
        move $t1,$v1
        li $s4,6
        
        jal multiply2
        move $t2,$v1
        
         addu    $5,$t0,$t1     # compute the result
         addu    $5,$5,$t2     # result in $5
 
         li      $v0,4            # print a heading
         la      $a0,heading         
         syscall

         move    $a0,$5         # move result into parameter
         li      $v0,1            # print the result
         syscall
        
         li      $v0,10           # exit
         syscall
multiply:
        mul $v1,$s0,$s0,
        mul $v1,$v1,$s2
        jr $ra
 multiply1:
           mul $v1,$s0,$s1,
           mul $v1,$v1,$s3
          jr $ra
 multiply2:
           mul $v1,$s1,$s1,
           mul $v1,$v1,$s4
          jr $ra
                
         .data
heading:
         .asciiz "The result is: "        
        
 

# pread.asm -- prompt for and read an integer
#
# on entry:
#    $ra -- return address
#
# on exit:
#    $v0 -- the integer


         .text
         .globl  pread
pread:   
         la    $a0,prompt        # print string
         li    $v0,4             # service 4
         syscall
        
         li    $v0,5             # read int into $v0
         syscall                 # service 5
        
         jr    $ra               # return
         nop                     #  
        
         .data
prompt:
         .asciiz "Enter an integer: "

#Here is a picture of the console window after the program has run: 