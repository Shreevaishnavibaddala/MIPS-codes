.data
prompt1: .asciiz "Enter first number: "   # Prompt for first number
prompt2: .asciiz "Enter second number: "  # Prompt for second number
result_msg: .asciiz "Result: "            # Message to display the result

.text
.globl main

main:
    # Display prompt to enter the first number
    li $v0, 4          # System call code for printing string
    la $a0, prompt1    # Load address of prompt1
    syscall            # Print prompt1
    
    # Read the first number
    li $v0, 5          # System call code for reading integer
    syscall            # Read integer
    move $s0, $v0      # Store first number in $s0
    
    # Display prompt to enter the second number
    li $v0, 4          # System call code for printing string
    la $a0, prompt2    # Load address of prompt2
    syscall            # Print prompt2
    
    # Read the second number
    li $v0, 5          # System call code for reading integer
    syscall            # Read integer
    move $s1, $v0      # Store second number in $s1
    
    # Initialize variables
    li $t0, 0          # Initialize the product to 0 (using $t0)
    li $t1, 0          # Initialize the counter to 0 (using $t1)
    
    loop:
        # Check if the counter is equal to the second number
        beq $t1, $s1, end   # If counter == second number, exit loop
        
        # Add the first number to the product
        add $t0, $t0, $s0   # $t0 = $t0 + $s0
        
        # Increment the counter
        addi $t1, $t1, 1     # Increment counter by 1
        
        # Continue loop
        j loop
        
    end:
        # Display the result
        li $v0, 4          # System call code for printing string
        la $a0, result_msg # Load address of result_msg
        syscall            # Print result_msg
        
        # Display the product
        move $a0, $t0      # Move product to $a0 (for printing)
        li $v0, 1          # System call code for printing integer
        syscall            # Print product
        
        # Exit program
        li $v0, 10         # System call code for exit
        syscall            # Exit program
