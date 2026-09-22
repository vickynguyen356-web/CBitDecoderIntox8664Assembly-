# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I 
# STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE
# UNIVERSITY’S ACADEMIC INTEGRITY POLICY.

.file "create_key.s"
.globl create_key
.type create_key, @function
.text
.extern printf
.extern getchar

# unsigned int create_key() 
create_key:
pushq %rbp
movq %rsp, %rbp
# save callee-saved registers
pushq %rbx
pushq %r12 

subq $16, %rsp		# alignment

# printing the prompt
leaq prompt(%rip), %rdi
call printf

xorl %ebx, %ebx		# key = 0
xorl %r12d, %r12d	# loop counter = 0

read_loop:
call getchar

cmpb $'0', %al		# check if it's 0
je valid_digit
cmpb $'1', %al		# check if it's 1
je valid_digit
jmp read_loop

valid_digit:
subb $'0', %al		# convert from ASCII to decimal 
andl $1, %eax		# clear upper bits

shll $1, %ebx
orl %eax, %ebx		# key |= digit

incl %r12d
cmpl $8, %r12d
jl read_loop

empty_garbage:
call getchar
cmpb $-1, %al		# discarding extra chars
je done_empty
cmpb $'\n', %al		# check for newline
jne empty_garbage

done_empty:
movl %ebx, %eax		# return key in %eax
addq $16, %rsp
popq %r12
popq %rbx

leave
ret

.section .rodata
prompt: 
.string "enter 8-bit key: "
