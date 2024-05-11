.data
mess1 : .asciiz "Give the value of a : "
out1 : .asciiz "The 3X3 matrix is \n"
out2 : .asciiz "The det of matrix is\n"
ent : .asciiz "\n"
spc : .asciiz " "
arr : .word 9
.text
li  $v0, 4
la  $a0, mess1
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 1
li $t2, 0
li $t4, 3
la $t6, arr
while:
beq $t2, 36, print
bgt $t2, 36, print
#sb $t1, arr($t2)
sw $t1, 0($t6)
add $t1, $t1, $t0
addi $t2, $t2, 4
addi $t6, $t6, 4
j while

print :
li $t2, 0
li $t1, 0
li $v0, 4
la $a0, out1
syscall
la $t6, arr
pnt :
beq $t1, 9, trans
lw $t7, 0($t6)
li $v0, 1
move $a0, $t7
syscall

addi $t2, $t2, 1
addi $t1, $t1, 1
addi $t6, $t6, 4
div $t1, $t4
mfhi $t3
beq  $t3, 0, enter
spac :
li $v0, 4
la $a0, spc
syscall
j pnt
enter:
li $v0, 4
la $a0, ent
syscall
j pnt


trans:
li  $v0, 4
la  $a0, out2
syscall
la $t6, arr
li $t1, 0
li $t2, 0
tr:
beq $t2, 3, exit
move $t7, $t6
li $t1, 0
p_tr :
beq $t1, 3, o_tr

lw $t4, 0($t7)
li $v0,1
move $a0, $t4
syscall

addi $t7, $t7, 12
addi $t1, $t1, 1
li $v0, 4
la $a0, spc
syscall
j p_tr

o_tr:
addi $t6, $t6, 4
addi $t2, $t2, 1
li $v0, 4
la $a0, ent
syscall
j tr

Shreevaishnavi Baddala
11:10 PM (3 minutes ago)
to me




---------- Forwarded message ---------
From: Shreevaishnavi Baddala <shreevaishnavibaddala@gmail.com>
Date: Thu, Oct 19, 2023 at 11:37 AM
Subject:
To: Shreevaishnavi Baddala <shreevaishnavibaddala@gmail.com>


.data
mess1 : .asciiz "Give the value of a : "
out1 : .asciiz "The 3X3 matrix is \n"
out2 : .asciiz "The det of matrix is\n"
ent : .asciiz "\n"
spc : .asciiz " "
arr : .word 9
.text
li  $v0, 4
la  $a0, mess1
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 1
li $t2, 0
li $t4, 3
la $t6, arr
while:
beq $t2, 36, print
bgt $t2, 36, print
#sb $t1, arr($t2)
sw $t1, 0($t6)
add $t1, $t1, $t0
addi $t2, $t2, 4
addi $t6, $t6, 4
j while

print :
li $t2, 0
li $t1, 0
li $v0, 4
la $a0, out1
syscall
la $t6, arr
pnt :
beq $t1, 9, trans
lw $t7, 0($t6)
li $v0, 1
move $a0, $t7
syscall

addi $t2, $t2, 1
addi $t1, $t1, 1
addi $t6, $t6, 4
div $t1, $t4
mfhi $t3
beq  $t3, 0, enter
spac :
li $v0, 4
la $a0, spc
syscall
j pnt
enter:
li $v0, 4
la $a0, ent
syscall
j pnt


trans:
li  $v0, 4
la  $a0, out2
syscall
la $t6, arr
li $t1, 0
li $t2, 0
tr:
beq $t2, 3, exit
move $t7, $t6
li $t1, 0
p_tr :
beq $t1, 3, o_tr

lw $t4, 0($t7)
li $v0,1
move $a0, $t4
syscall

addi $t7, $t7, 12
addi $t1, $t1, 1
li $v0, 4
la $a0, spc
syscall
j p_tr

o_tr:
addi $t6, $t6, 4
addi $t2, $t2, 1
li $v0, 4
la $a0, ent
syscall
j tr