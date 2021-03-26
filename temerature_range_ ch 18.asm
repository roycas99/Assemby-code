.data
range: .word 99

.text

main:
lui $10,0x1001
lw  $8,0($10)

ori $3,$0,1 ### set flag to 1
## checking if the input less than 20
sltiu $11,$8,20  

beq $11,$0,test1  ## if input>20 we go into test 1
sll $0, $0, 0   # delay
bge $11,1,out  ## if input<20 set the flag to zero
sll $0,$0,0
## end of the program
li $v0,10
syscall 


## checking the range 

test:
     sltiu $11,$8,60
     beq $11,$0,test2    ## if input> 60 we go into test 2 other wise we jump into cont 
     sll $0, $0, 0   # delay
     j out            ## set the flag zero and end the loop
           
test1: sltiu $11,$8,41    
       beq  $11,$0,test  ## if input>41;we go into test 
       j cont      ## other wise continue 
        
test2: sltiu $11,$8,81  
       beq  $11,$0,out   ## if input>81 we out the loop and set the flag to zero
       j cont  ## if input<81 we continue 
       sll $0,$0,0




out:
   ori $3,$0,0
    li $v0,1
    move $a0,$3
    syscall

   
cont:
     sll $0,$0,0
     li $v0,1
     move $a0,$3
     syscall




