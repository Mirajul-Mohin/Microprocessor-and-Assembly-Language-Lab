segment .data
	fmt_scan: dq "%lld %lld %lld %lld",10,0
	fmt_print: db "Sum is: %lld ",10,0
	
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
	mov RCX,c
	mov R8,x
	xor RAX,RAX
	call scanf

	mov RAX,[a]
	mov RBX,[b]
	mov RCX,[c]
	mov RDX,[x]


	push RAX
	push RBX
	push RCX
	push RDX
	
	call add_val
	pop rdx
	pop rcx
	pop rbx
	pop rax
	pop rbp
	ret

add_val:
	mov r9,[rsp+8]
	mov rcx,[rsp+16]
	mov rbx,[rsp+24]
	mov rax,[rsp+32]
	xor rdx,rdx
	mul r9
	mul r9
	mov r8,rax
	mov rax,rbx
	mul r9
	add r8,rax
	add r8,rcx
	
	mov RDI,fmt_print
	mov RSI,r8
	xor RAX,RAX
	call printf
	ret

