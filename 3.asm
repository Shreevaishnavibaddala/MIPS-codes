.data
input_no: .asciiz"enter the number:"
message: .asciiz"greatest number is:"

.text
   #storing first input number in register $t0
      li $v0,4
      la $a0, input_no
      syscall
      
         li $v0,5
         syscall
         
         move $t0,$v0
         
    #storing second input number in register $t1     
      li $v0,4
      la $a0, input_no
      syscall
      
          li $v0,5
          syscall
          
          move $t1,$v0
       
       #storing third number in $t2
       
       li $v0,4
       la $a0, input_no
       syscall
       
       li $v0,5
       syscall
       
       move $t2,$v0
       
       sgt $s0,$t0,$t1
       sgt $s0,$s0,$t2
       bge $s0,$zero,message
       
       li $v0,10
           syscall 
       
       li $v0,4
         la $a0, message 
         syscall
         
        
           li $v0,10
           syscall    