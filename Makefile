# Name: Vy Nguyen
gcc_opt = -std=c99 -pedantic -Wimplicit-function-declaration -Wreturn-type -Wformat
opts = -g -c 

# Forcing the object files to delete to make sure that 
# everything is recompiling to test if I fixed bugs
.DELTE_ON_ERROR:

.PHONY: all clean FORCE
all: bit_decode project6.zip

# zip file target for Carmen
project6.zip: Makefile project6Readme bit_decode.c create_key.s rotate_right.s rotate_left.s
	zip project6.zip Makefile bit_decode.c project6Readme create_key.s rotate_right.s rotate_left.s

# executable target
bit_decode: bit_decode.o create_key.o rotate_right.o rotate_left.o 
	gcc -g bit_decode.o create_key.o rotate_right.o rotate_left.o -o bit_decode

# dependency for bit_decode.project6.c
bit_decode.o: bit_decode.c
	gcc $(gcc_opt) $(opts) -o bit_decode.o bit_decode.c

# assembling object files from .s function files 
create_key.o: FORCE create_key.s
	gcc -g -c -o create_key.o create_key.s
	
rotate_right.o: rotate_right.s
	gcc -g -c -o rotate_right.o rotate_right.s
	
rotate_left.o: rotate_left.s
	gcc -g -c -o rotate_left.o rotate_left.s

FORCE:

# deletes all files produced from Makefile
# completely new compile of items is required 
clean:
	rm -rf *.o bit_decode project6.zip
	
