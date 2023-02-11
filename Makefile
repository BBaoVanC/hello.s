all: hello

hello.o: hello.s
	nasm -felf64 hello.s -o hello.o
hello: hello.o
	ld -z noseparate-code hello.o -o hello
	strip hello
# stuff after last occurrence of 0x0a is not crtical to execution
	sed -i '$$d' hello

clean:
	rm -f hello.o hello

.PHONY: clean
