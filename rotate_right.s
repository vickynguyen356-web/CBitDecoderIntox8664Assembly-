# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I 
# STRICTLY ADHERED TO THE TENURES OF THE OHIO STATE
# UNIVERSITY’S ACADEMIC INTEGRITY POLICY.

.file "rotate_right.s"
.globl rotate_right
.type rotate_right, @function
.text

# unsigned char rotate_right(unsigned char x)
rotate_right:
pushq %rbp
movq %rsp, %rbp

movb %dil, %al		# al = x

movb %al, %bl		# bl = x
shrb $1, %al		# x >> 1
shlb $7, %bl 		# x << 7

orb %bl, %al 		# combine

leave
ret
