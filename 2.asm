.data
   input_no: .asciiz "enter number:"
   diff: .asciiz "difference is:"
   
.text
   #storing first input number in register
      li $v0,4
      la $a0, input_no
      syscall
      
         li $v0,5
         syscall
         
         move $t0,$v0
         
    #storing second input number in register     
      li $v0,4
      la $a0, input_no
      syscall
      
          li $v0,5
          syscall
          
          move $t1,$v0
       
          #substracting numbers i.e $t0 - $t1   
        sub $t2, $t0, $t1
        
        li $v0,4
         la $a0, diff 
         syscall
         
         #printing the difference
           li $v0,1
           move $a0, $t2
           syscall    
       