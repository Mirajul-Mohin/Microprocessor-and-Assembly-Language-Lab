segment .data
	prime: db "prime" ,10 , 0
	non_prime: db "non prime",10,0
	fmt: dq "%s", 10, 0
	fmt_scan: dq "%d",10,0
	fmt_value: dq "%d ",10,0
segment .bss
	a: resq 1

segment .text
	global main
	extern printf
	extern scanf

main:
	push RBP

	mov RDI,fmt_scan
	mov RSI,a
	mov RAX,0
	call scanf
	
	mov RCX,[a]
	mov RAX,RCX
	add RCX,-2
	xor RDX,RDX
	mov R8,2
	

mPrint:
	push RCX
	
	push RAX
	
	xor RDX,RDX
	div R8
	inc R8
	cmp RDX,0
	
	je nonPrime
	

	

	pop RAX
	pop RCX
	loop mPrint
	


y_prime:
	mov RDI,fmt
	mov RSI,prime
	mov RAX,0
	call printf
	jmp exit
	

nonPrime:
	pop RAX
	pop RCX
	
	mov RDI,fmt
	mov RSI,non_prime
	mov RAX,0
	call printf
	jmp exit
	
exit:
	mov RAX,0
	pop RBP
	ret

	
