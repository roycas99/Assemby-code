.data
newLine:.asciiz "\n"
.text 
main:
     addi $s0,$0,10
     jal increaseReg
     
     li $v0,4
     la,$a0,newLine
     syscall 
     
     li $v0,1
     move $a0,$s0
     syscall 
     ### signal end of the program
     li $v0,10
     syscall 
     
increaseReg:
            addi $sp,$sp,-4
            sw $s0,0($sp)
            addi $s0,$s0,30
            li $v0,1
            move $a0,$s0
            syscall 
            
            lw $s0,0($sp)
            addi $sp,$sp,4
            jr $ra
            