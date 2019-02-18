
segment .data
fmt: db "%d",0
fmt2: db "%d ",10,0
fmt3: db "%d ",0
fmt5: db "No first and last odd number",10,0
fmt6: db "First odd element %d and there is no last element",10,0

segment .bss
a: resq 255
cnt: resq 255
b: resq 1
c: resq 1
d: resq 1

segment .text
global main
extern printf
extern scanf

main:
push RBP

xor RCX,RCX
mov R9,0

for:
	push RCX
	xor RAX,RAX
	mov RDI,fmt
	mov RSI,d
	call scanf
	pop RCX
	mov RAX,[d]
	mov [a+RCX*8],RAX
	inc RCX
	cmp RCX,10
	jne for



	mov RAX,0
	mov RCX,0
	mov R8,0

print:
	mov RBX,[a+8*RCX]
	and RBX,1
	cmp RBX,0
	je even
	jmp odd


odd:
	
	mov RBX,[a+8*RCX]
	mov [cnt+8*R8],RBX
	INC R8
	INC RCX
	cmp RCX,10
	je _p
	jmp print


even:
	inc RCX
	cmp RCX,10
	jne print
	jmp _p

_p:
	mov RAX,0
	mov RCX,0

	cmp R8,0
	je no
	cmp R8,1
	je one

	mov RDI,fmt2
	mov RSI,[cnt+RCX*8]
	push R8
	call printf

	pop R8
	DEC R8
	mov RCX,R8
	mov RAX,0
	mov RDI,fmt2
	mov RSI,[cnt+8*RCX]
	call printf
	jmp exit

no:
	mov RDI,fmt5
	call printf
	jmp exit


one:
	mov RCX,0
	mov RDI,fmt6
	mov RSI,[cnt+8*RCX]
	call printf
	jmp exit


exit:
xor RAX,RAX
pop RBP
ret

