segment .data
	fmt_scan: dq "%lld %lld",10,0
	fmt_print: db "GCD : %lld",10,0
	
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
	

	push R8
	push R9
	
	call add_val
	
	
	mov rdi,fmt_print
	mov rsi,r10
	xor rax,rax
	call printf
	
	pop r12
	pop r12
	
	pop rbp
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov rbx,[rbp+16]
	mov rax,[rbp+24]
	
	
	cmp rbx,0
	jz base_case

	
	xor rdx,rdx
	idiv rbx
	mov rax,rdx

	push rbx
	push rax
	
		
	call add_val
	pop r11
	pop r11

	leave
	ret

base_case:
	mov r10,[rbp+24]
	leave
	ret

