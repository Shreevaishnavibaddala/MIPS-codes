# ALU (Arithmetic and Logic Unit) operations: addition, subtraction, bitwise AND, bitwise OR, bitwise XOR
# Inputs: $s0 = operation code, $s1 = operand1, $s2 = operand2
# Output: $t0 = result

.data
result_msg: .asciiz "Result: "     # Message to display the result

.text
.globl main

main:
    # Display prompt to enter the operation code
    li $v0, 4             # System call code for printing string
    la $a0, operation_prompt   # Load address of operation_prompt
    syscall               # Print operation_prompt
    
    # Read the operation code
    li $v0, 5             # System call code for reading integer
    syscall               # Read integer
    move $s0, $v0         # Store operation code in $s0
    
    # Display prompt to enter operand1
    li $v0, 4             # System call code for printing string
    la $a0, operand1_prompt   # Load address of operand1_prompt
    syscall               # Print operand1_prompt
    
    # Read operand1
    li $v0, 5             # System call code for reading integer
    syscall               # Read integer
    move $s1, $v0         # Store operand1 in $s1
    
    # Display prompt to enter operand2
    li $v0, 4             # System call code for printing string
    la $a0, operand2_prompt   # Load address of operand2_prompt
    syscall               # Print operand2_prompt
    
    # Read operand2
    li $v0, 5             # System call code for reading integer
    syscall               # Read integer
    move $s2, $v0         # Store operand2 in $s2
    
    # Perform operations based on the operation code
    li $t0, 0             # Initialize result to 0
    
    # Perform selected operation based on the operation code
    # 1: Addition
    beq $s0, 1, perform_addition
    # 2: Subtraction
    beq $s0, 2, perform_subtraction
    # 3: Bitwise AND
    beq $s0, 3, perform_and
    # 4: Bitwise OR
    beq $s0, 4, perform_or
    # 5: Bitwise XOR
    beq $s0, 5, perform_xor
    
    # Invalid operation code
    j invalid_operation_code

perform_addition:
    add $t0, $s1, $s2    # $t0 = $s1 + $s2
    j print_result

perform_subtraction:
    sub $t0, $s1, $s2    # $t0 = $s1 - $s2
    j print_result

perform_and:
    and $t0, $s1, $s2    # $t0 = $s1 & $s2
    j print_result

perform_or:
    or $t0, $s1, $s2     # $t0 = $s1 | $s2
    j print_result

perform_xor:
    xor $t0, $s1, $s2    # $t0 = $s1 ^ $s2
    j print_result

print_result:
    # Display the result
    li $v0, 4             # System call code for printing string
    la $a0, result_msg    # Load address of result_msg
    syscall               # Print result_msg
    
    # Display the result value
    move $a0, $t0         # Move result to $a0 (for printing)
    li $v0, 1             # System call code for printing integer
    syscall               # Print result
    
    # Exit program
    li $v0, 10            # System call code for exit
    syscall               # Exit program

invalid_operation_code:
    # Display error message for invalid operation code
    li $v0, 4             # System call code for printing string
    la $a0, invalid_msg   # Load address of invalid_msg
    syscall               # Print invalid_msg
    
    # Exit program due to error
    li $v0, 10            # System call code for exit
    syscall               # Exit program

# Data section for messages
.data
operation_prompt: .asciiz "Enter operation code (1:Addition, 2:Subtraction, 3:Bitwise AND, 4:Bitwise OR, 5:Bitwise XOR): "
operand1_prompt: .asciiz "Enter operand1: "
operand2_prompt: .asciiz "Enter operand2: "
invalid_msg: .asciiz "Invalid operation code\n"
