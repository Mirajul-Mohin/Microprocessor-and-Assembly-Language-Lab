segment .data
	fmt_scan: dq "%lld",10,0
	fmt_print: db "%lld is Not Prime",10,0
	fmt_print1: db "%lld is Prime",10,0
	
segment .bss
	a: resq 1
	b: resq 1
	c: resq 1
	x: resq 1
	array: resq 255

segment .text
	global main
	extern printf
	extern scanf
main:
	push RBP
	
	mov RDI,fmt_scan
	mov RSI,a
	
	xor RAX,RAX
	call scanf

	mov R8,[a]
	

	push 2
	push r8

	call add_val
	pop rdx
	pop rdx
	
	
	pop rbp
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov rax,[rbp+16]	;value of N
	mov rbx,[rbp+24]	;value of divisor
	
	mov r10,rax
	
	mov rdx,0
	div rbx
	mov rax,r10

	cmp rbx,rax
	je print_for_prime
	
	cmp rdx,0
	je base_case
	
	inc rbx

	push rbx
	push rax
	
	call add_val
	pop r11
	pop r11
	leave
	ret

print_for_prime:
	mov rdi,fmt_print1
	mov rsi,rax
	xor rax,rax
	call printf
	
	
	leave
	ret

	

base_case:
	mov rdi,fmt_print
	mov rsi,rax
	xor rax,rax
	call printf
	
	leave
	ret

