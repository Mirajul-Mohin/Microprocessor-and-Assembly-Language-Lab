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
	mov RCX,20
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
	add RAX,[cnt]
	mov [cnt],RAX
	loop for

	xor RAX,RAX
	mov RDI,fmt2
	mov RSI,[cnt]
	call printf
	xor RCX,RCX

print:
	mov RBX,[a+8*RCX]
	mov RDI,fmt3
	mov RSI,RBX
	mov RAX,0
	push RCX
	call printf
	pop RCX
	inc RCX
	cmp RCX,20
	jne print
	
	xor RAX,RAX
	pop RBP
	ret

