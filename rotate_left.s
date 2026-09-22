# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I 
# STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE
# UNIVERSITY’S ACADEMIC INTEGRITY POLICY.

.file "rotate_left.s"
.globl rotate_left
.type rotate_left, @function
.text

# unsigned char rotate_left(unsigned char x) 
rotate_left:
pushq %rbp
movq %rsp, %rbp

movb %dil, %al 		# al = x

movb %al, %bl 		# copy al into bl 
shlb $1, %al 		# x << 1
shrb $7, %bl 		# x >> 7

orb %bl, %al 		# x |= (x >> 7)

leave
ret
