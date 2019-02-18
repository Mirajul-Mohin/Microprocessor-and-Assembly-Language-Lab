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
	mov r10,1
	mov [a],r10

	push r8
	call add_val
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
	mov r8,[rbp+16]
	cmp r8,0
	jle base_case
	dec r8
	push r8
	
	call add_val
	imul r10,[rbp+16]
	pop rcx

base_case:
	
	leave
	ret

