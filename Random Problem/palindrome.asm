segment .bss
a: resq 1
b: resq 1
c: resq 1
res: resq 1

segment .data
fmt: db "%d",0
fmt1: db "%d",10,0
fmt2: db "%d is even",10,0
fmt3: db "%d is odd",10,0

segment .text

global main
extern scanf
extern printf

main:
push RBP
mov RDI, fmt
mov RSI,a
call scanf


mov RAX, [a]
mov RCX,0
mov RBX,10


check:
	mov RDX,0
	div RBX
	
	mov RAX,RBX
	mov RBX,RDX


	cmp RBX,RCX

	jne check
	
	mov RDI,fmt1
	mov RSI,RAX
	call printf
mov RAX,0
pop RBP
ret
	


