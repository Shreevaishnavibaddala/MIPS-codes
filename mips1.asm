.data
   input_no: .asciiz "enter number:"
   sum: .asciiz "sum is:"
   
.text
   
   #storing first integer in $t0 
      li $v0,4
      la $a0, input_no
      syscall
      
         li $v0,5
         syscall
         
         move $t0,$v0
       
         #storing integer input in $t1  
      li $v0,4
      la $a0, input_no
      syscall
      
          li $v0,5
          syscall
          
          move $t1,$v0
       
        #storing integer input in $t2
      li $v0,4
      la $a0, input_no
      syscall
      
          li $v0,5
          syscall
          
          move $t2,$v0  
       
          #storing integer input in $t3   
      li $v0,4
      la $a0, input_no
      syscall
      
          li $v0,5
          syscall
          
          move $t3,$v0   
       
           #adding     
      add $t4, $t0, $t1 #adding $t0, $t1 and storing in $t4
      add $t4, $t4, $t2 #adding previous $t4 and $t2
      add $t4, $t4, $t3 # adding previous $t4 and $t3
      
         li $v0,4
         la $a0, sum 
         syscall
         
         #printing the difference
           li $v0,1
           move $a0, $t4
           syscall  
                                                                         