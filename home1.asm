.data

arrA: .word  0:15
arrB: .word  0:15
arrC: .word  0:15
msq1: .asciiz " Enter the value:"
msq2: .asciiz "The content of array B is : "
msq3: .asciiz "The content of array C is : "
msq4: .asciiz "The conunt of array B is  : "
msq5: .asciiz "The conunt of array C is  : "
newline: .asciiz "\n"
comm: .asciiz ","
.text

main:
li $t0, 0       # Counter for accepted values array A
li $t5, 0       # the count of element in array B
li $t6,0        # Counter for accepted values array B
la $t1, arrA     # Address of array A
la $t2, arrB    # Address of array B
la $t3, arrC     # Address of array C
li $v0,4


la $a0,msq1
syscall

loopread:
li $v0,5
syscall
move $s0,$v0
blt $s0,99,l1
j loopread
l1:
bgt $s0,-99,accpet
 
j loopread


accpet:
sw $s0,0($t1)
addi $t1,$t1,4
addi $t0,$t0,1
bne $t0,15,loopread

li $t0, 0   # Counter
la $t1,arrA 
arrayB:
lw $t4,($t1)
blt $t4,$0,arrayC
addi $t0,$t0,1
sw $t4,0($t2)
addi $t2,$t2,4
addi $t1,$t1,4
addi $t5,$t5,1

blt $t0,15,arrayB

j cont

arrayC:
lw $t7,0($t1)
addi $t0,$t0,1
sw $t7,0($t3)
addi $t1,$t1,4
addi $t3,$t3,4
addi $t6,$t6,1

blt $t0,15,arrayB

cont:
li $t0,0
la $t2,arrB
li $v0,4
la $a0,msq2
syscall

printarrayB:
li $v0,1
lw $a0,0($t2)
syscall
addi $t2,$t2,4
addi $t0,$t0,1
bne $t0,$t5,printarrayB

li $t0,0
la $t3,arrC
li $v0,4
la $a0,msq3
syscall


printarrayC:
li $v0,1
lw $a0,0($t3)
syscall
addi $t3,$t3,4
addi $t0,$t0,1
bne $t0,$t6,printarrayC

li $v0, 4       
la $a0, newline
syscall
   
li $v0, 4       
la $a0, msq5
syscall

prcountC:
li $v0,1
move $a0,$t6
syscall


