segment .data
	fmt: db "%d",0
	fmt2: db "%d ",10,0
	fmt3: db "%d ",0

segment .bss
	a: resq 255
	b: resq 30
	cnt: resq 1
	d: resq 30

segment .text
global main
extern printf
extern scanf

main:
	push RBP
	xor RCX,RCX
	mov RCX,10
	mov RBX,0

for:
	mov RAX,0
	mov RDI,fmt
	mov RSI,d

	push RBX
	push RCX
	call scanf
	mov RAX,[d]
	pop RCX
	pop RBX

	mov [a+RBX*8],RAX
	inc RBX
	loop for

	mov RAX,0
	mov RDI,fmt
	mov RSI,d

	
	call scanf
	mov RAX,[d]
	
	
	mov RCX,0

print:
	
	mov R8,[a+8*RAX]
	mov RDI,fmt2
	mov RSI,R8
	mov RAX,0
	
	call printf
	
	xor RAX,RAX
	pop RBP
	ret

