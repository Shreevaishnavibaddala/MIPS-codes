.data
prompt1: .asciiz "Enter dividend: "      # Prompt for dividend
prompt2: .asciiz "Enter divisor: "       # Prompt for divisor
result_msg: .asciiz "Result: "           # Message to display the result
error_msg: .asciiz "Error: Division by zero\n"  # Message for division by zero error

.text
.globl main

main:
    # Display prompt to enter the dividend
    li $v0, 4          # System call code for printing string
    la $a0, prompt1    # Load address of prompt1
    syscall            # Print prompt1
    
    # Read the dividend
    li $v0, 5          # System call code for reading integer
    syscall            # Read integer
    move $s0, $v0      # Store dividend in $s0
    
    # Display prompt to enter the divisor
    li $v0, 4          # System call code for printing string
    la $a0, prompt2    # Load address of prompt2
    syscall            # Print prompt2
    
    # Read the divisor
    li $v0, 5          # System call code for reading integer
    syscall            # Read integer
    move $s1, $v0      # Store divisor in $s1
    
    # Check for division by zero
    beqz $s1, division_by_zero_error  # If divisor is 0, branch to error message
    
    # Initialize variables
    li $t0, 0          # Initialize quotient to 0 (using $t0)
    
    loop:
        # Check if the dividend is less than the divisor
        blt $s0, $s1, end_division   # If dividend < divisor, exit loop
        
        # Subtract the divisor from the dividend
        sub $s0, $s0, $s1   # $s0 = $s0 - $s1
        
        # Increment the quotient
        addi $t0, $t0, 1    # Increment quotient by 1
        
        # Continue loop
        j loop
        
    end_division:
        # Display the result
        li $v0, 4          # System call code for printing string
        la $a0, result_msg # Load address of result_msg
        syscall            # Print result_msg
        
        # Display the quotient
        move $a0, $t0      # Move quotient to $a0 (for printing)
        li $v0, 1          # System call code for printing integer
        syscall            # Print quotient
        
        # Exit program
        li $v0, 10         # System call code for exit
        syscall            # Exit program

    division_by_zero_error:
        # Display error message for division by zero
        li $v0, 4          # System call code for printing string
        la $a0, error_msg  # Load address of error_msg
        syscall            # Print error_msg
        
        # Exit program due to error
        li $v0, 10         # System call code for exit
        syscall            # Exit program
