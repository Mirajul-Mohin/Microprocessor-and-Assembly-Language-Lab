
segment .data
a: resq 1
b: resq 1
c: resq 1
fmt: db "%d ",0
fmt2: db "%d is large",10,0

segment .text

global main
extern scanf
extern printf

main:


push RBP
mov RAX, 5
mov RBX,5


check:
	mov RDI,fmt
	mov RSI,RAX
	push RAX
	push RBX
	
	call printf
	
	pop RBX
	pop RAX
	add RAX,RBX
	cmp RAX,50
	jle check

mov RAX,0
pop RBP
ret



