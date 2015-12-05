default: tokenize.c  tokenize.h
	$(MAKE) lib;
	$(CC) -Wall -Wextra -pedantic -Wpointer-arith  -Werror -O3 ./tokenize.c -lmaa -o tokenize_test;

unsafe: tokenize.c  tokenize.h
	$(CC) -DNDEBUG -O3 ./tokenize.c -lmaa;

unsafelib: tokenize.c  tokenize.h
	$(CC) -DLIB -DNDEBUG -c -fpic -O3 ./tokenize.c;
	$(CC) -shared -o tokenize.so tokenize.o -lmaa;

lib: tokenize.c  tokenize.h
	$(CC) -DLIB -DNDEBUG -c -fpic -Wall -Wextra -pedantic -Wpointer-arith -Werror -O3 ./tokenize.c
	$(CC) -shared -o libtokenize.so tokenize.o -lmaa;

debug: tokenize.c  tokenize.h
	$(CC) -Wall -Wextra -pedantic -Wpointer-arith  -Werror ./tokenize.c -lmaa -o tokenize_debug;

debuglib: tokenize.c  tokenize.h
	$(CC) -g -c -fpic -Wall -Wextra -pedantic -Wpointer-arith  -Werror ./tokenize.c;
	$(CC) -shared -o tokenize.so tokenize.o -lmaa;
