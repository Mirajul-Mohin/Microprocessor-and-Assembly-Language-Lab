segment .data
	fmt_scan: dq "%lld",10,0
	fmt_print: db "Fact : %lld",10,0
	
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
	

	push 0
	push 1
	push 1
	call add_val
	pop rdx
	pop rdx
	pop rdx
	
	mov rdi,fmt_print
	mov rsi,r10
	xor rax,rax
	call printf
	
	pop rbp
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov rcx,[rbp+16]
	mov rbx,[rbp+24]
	mov rax,[rbp+32]
	
	cmp rcx,r8
	jz base_case
	
	add rax,rbx
	
	inc rcx
	
	

	push rbx
	push rax
	push rcx
	
	call add_val
	pop r11
	pop r11
	pop r11

	leave
	ret

base_case:
	mov r10,[rbp+24]
	leave
	ret

