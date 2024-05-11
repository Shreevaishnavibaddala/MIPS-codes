.data
prompt: .asciiz "Enter a number: "     # Prompt for user input
result_msg: .asciiz " is a perfect number.\n"    # Message for perfect number
not_perfect_msg: .asciiz " is not a perfect number.\n"    # Message for non-perfect number

.text
.globl main

main:
    # Display prompt to enter a number
    li $v0, 4             # System call code for printing string
    la $a0, prompt        # Load address of prompt
    syscall               # Print prompt
    
    # Read the number 'n' as user input
    li $v0, 5             # System call code for reading integer
    syscall               # Read integer
    move $s0, $v0         # Store the input number in $s0
    
    # Initialize variables
    li $t0, 1             # Initialize divisor to 1 (starting divisor)
    li $t1, 0             # Initialize sum of divisors to 0
    
    loop:
        # Check if the divisor 't0' is greater than or equal to 'n'
        bge $t0, $s0, check_perfect_number   # If divisor >= n, exit loop
        
        # Check if 'n' is divisible by 't0' (t0 is a divisor of n)
        div $s0, $t0         # Divide n by t0
        mfhi $t2             # Get the remainder (if remainder = 0, t0 is a divisor of n)
        
        beqz $t2, add_divisor   # If remainder = 0, add t0 to the sum of divisors
        
        # Increment divisor 't0' by 1
        addi $t0, $t0, 1     # Increment t0 by 1
        j loop               # Continue loop
        
    add_divisor:
        # Add 't0' to the sum of divisors
        add $t1, $t1, $t0    # Add t0 to the sum of divisors
        
        # Increment divisor 't0' by 1
        addi $t0, $t0, 1     # Increment t0 by 1
        j loop               # Continue loop
        
    check_perfect_number:
        # Check if the sum of divisors equals 'n'
        beq $t1, $s0, is_perfect_number   # If sum of divisors == n, it's a perfect number
        
        # If sum of divisors != n, it's not a perfect number
        li $v0, 4             # System call code for printing string
        move $a0, $s0         # Move the number to be printed
        syscall               # Print the number
        
        li $v0, 4             # System call code for printing string
        la $a0, not_perfect_msg  # Load address of not_perfect_msg
        syscall               # Print not_perfect_msg
        
        j end_program         # Exit program
        
    is_perfect_number:
        # If sum of divisors == n, it's a perfect number
        li $v0, 4             # System call code for printing string
        move $a0, $s0         # Move the number to be printed
        syscall               # Print the number
        
        li $v0, 4             # System call code for printing string
        la $a0, result_msg    # Load address of result_msg
        syscall               # Print result_msg
        
    end_program:
        # Exit program
        li $v0, 10            # System call code for exit
        syscall               # Exit program
