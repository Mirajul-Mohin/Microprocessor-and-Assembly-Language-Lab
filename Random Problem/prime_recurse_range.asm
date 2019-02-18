segment .data
	fmt_scan: dq "%lld %lld",10,0
	fmt_print: db "%lld is Not Prime",10,0
	fmt_print1: db "%lld",10,0
	
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
	mov RDX,b
	
	xor RAX,RAX
	call scanf

	mov R8,[a]
	mov R9,[b]
	

	push 2
	push r8
	push r9

	call add_val
	pop rdx
	pop rdx
	pop rdx
	
	
	pop rbp
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov rbx,[rbp+16]	;end value
	mov rax,[rbp+24]	;start value
	mov rcx,[rbp+32]	;value of divisor
	
	mov r10,rax
	
	mov rdx,0
	div rcx
	mov rax,r10

	cmp rcx,rax
	je print_for_prime
	
	cmp rdx,0
	je base_case
	
	inc rcx

	push rcx
	push rax
	push rbx
	
	call add_val
	pop r11
	pop r11
	pop r11
	leave
	ret

print_for_prime:
	mov rdi,fmt_print1
	mov rsi,rax

	push rax
	push rbx
	push rcx
	xor rax,rax
	call printf
	pop rcx
	pop rbx
	pop rax

	inc rax

	cmp rax,rbx
	jg new_lvl	
	
	push 2
	push rax
	push rbx

	call add_val

	pop r11
	pop r11
	pop r11
	leave
	ret
	
	

base_case:
	inc rax

	cmp rax,rbx
	jg new_lvl	
	
	push 2
	push rax
	push rbx

	call add_val

	pop r11
	pop r11
	pop r11
	
	leave
	ret

new_lvl:
	leave
	ret

