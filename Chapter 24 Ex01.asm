## Chapter 24, Exercise #01
##
## Program that repeatedly asks the user for a string and then calculates and prints out the string length. 
## Stop the program when the string is empty.
##
## Pseudocode:
## Top: 
#    Initialize count to 0
##   Input string
##   If string is empty, jump to Exit
## Top count:
##   Add 1 to count
##   Load a character from memory
##   If it is less than 32, jump to Display
##   Jump Top count
## Display:
##    Display count
##    Jump to top
## Exit:
        .text
        .globl  main

main:   
top:    li	$t0,0
	# get string
        li      $v0,4           # print prompt
        la      $a0,prompt      
        syscall
        
        li      $v0,8           # code 8 == read string
        la      $a0,string      # $a0 == address of buffer
        li      $a1,24          # $a1 == buffer length
        syscall                 # Invoke the operating system.
               li $10,0          # counter
       	li    $t1,0                 # read first character from string
       	lb    $v0,string($t1)       # $v0 = string[$t1]
       	beq   $v0,10,exit  # if character is '\n' jump to exit

Top count:
          addiu $10,$10,1
          lb $v0,

        # test code
        # print the string
        li      $v0,4           # print prompt2
        la      $a0,prompt2     #
        syscall
        li      $v0,4           # print body
        la      $a0,string      #
        syscall
        
        j top
display:
        li $v0,1
        add $a0,$0,$10
        syscall 

 exit:	li      $v0,4           # print prompt2
        la      $a0,EndMessage   #     
        syscall
         
        li      $v0,10      # exit
        syscall


        .data
prompt: .asciiz "please enter a string: "
string: .space  128
prompt2: .asciiz "the string you entered was: "
EndMessage: .asciiz "empty string entered"
