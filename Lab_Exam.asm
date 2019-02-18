segment .data
	fmt_scan: dq "%d %d",10,0
	fmt_value: dq "%d ",10,0
segment .bss
	a: resq 1
	b: resq 1
	array: resq 255
	cnt: resq 1

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

	mov R10,0
	mov R8,1
	mov R11,0
	mov [cnt],R11
	

mPrint:
	push RCX
	
	push RAX
	
	xor RDX,RDX
	div R8
	cmp RDX,0
	
	je nonPrime


	inc R8
	pop RAX
	pop RCX

	cmp R8,R9
	jne mPrint

	

	cmp [cnt],RAX
	je nw_lvl

	inc RAX
	mov R8,1
	mov R9,RAX
	dec RCX
	cmp RCX,0
	jne mPrint

	jmp finish
	

	

nonPrime:
	pop RAX
	pop RCX
	add [cnt],R8

	inc R8
	cmp R8,R9
	jne mPrint
	
	cmp [cnt],RAX
	je nw_lvl

	inc RAX
	mov R8,1
	mov R9,RAX
	
	dec RCX
	cmp RCX,0
	jne mPrint

	jmp finish

nw_lvl:
	mov R10,[cnt]
	mov [array+8*R11],R10
	mov R10,0
	mov [cnt],R10
	inc R11

	inc RAX
	mov R8,1
	mov R9,RAX
	
	dec RCX
	cmp RCX,0
	jne mPrint
	
	jmp finish
	
finish:
	mov RCX,0
	jmp exit
	
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


