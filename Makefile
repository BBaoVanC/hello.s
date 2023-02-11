all: hello hello-min

hello.o: hello.s
	nasm -felf64 hello.s -o hello.o
hello: hello.o
	ld -z noseparate-code hello.o -o hello
	strip hello

# hacks to make it as small as possible
# TODO: https://nathanotterness.com/2021/10/tiny_elf_modernized.html
hello-min: hello
	cp hello hello-min
# stuff after last occurrence of 0x0a is not crtical to execution
	sed -i '$$d' hello-min

clean:
	rm -f hello.o hello hello-min

.PHONY: clean
