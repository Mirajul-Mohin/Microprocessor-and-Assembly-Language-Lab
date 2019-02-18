segment .data
	prime: db "prime" ,10 , 0
	non_prime: db "non prime",10,0
	fmt: dq "%s", 10, 0
	fmt_scan: dq "%d %d",10,0
	fmt_value: dq "%d ",10,0
segment .bss
	a: resq 1
	b: resq 1
	array: resq 255

segment .text
	global main
	extern printf
	extern scanf

main:
	push RBP

	mov RDI,fmt_scan
	mov RSI,a
	mov RDX,b
	mov RAX,0
	call scanf
	
	mov RAX,[a]
	mov RBX,[b]

	mov RCX,RBX
	sub RCX,RAX
	inc RCX

	xor RDX,RDX

	xor R9,R9
	mov R9,RAX
	add R9,-2

	mov R10,0
	mov R8,2
	mov R11,0
	

mPrint:
	push RCX
	
	push RAX
	
	xor RDX,RDX
	div R8
	cmp RDX,0
	
	je nonPrime

	pop RAX
	pop RCX
	inc R8
	inc r10

	cmp R10,R9
	jne mPrint



y_prime:
	mov [array+8*R11],RAX
	inc R11
	inc RAX
	mov R8,2
	mov R9,RAX
	add R9,-2
	mov R10,0
	
	dec RCX
	cmp RCX,0
	jne mPrint
	jmp finish
	

nonPrime:
	pop RAX
	pop RCX

	inc RAX
	mov R8,2
	mov R9,RAX
	add R9,-2
	mov R10,0

	loop mPrint


finish:
	mov RCX,0
	
exit:
	mov RDI,fmt_value
	mov RSI,[array+8*RCX]
	inc RCX
	push RCX
	push R11
	mov RAX,0
	call printf
	pop R11
	pop RCX
	cmp R11, RCX
	jne exit
	pop RBP
	ret

	
