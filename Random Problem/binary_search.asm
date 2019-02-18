segment .data

a: dq 0
i: dq 0
tmp: dq 0


cnt: dq 0

fmt: dq "%lld ",10,0
fmt_put: dq "%lld",0

segment .bss
ara: resq 21
array: resq 21
x: resq 1

segment .text
global main
extern printf
extern scanf

main:
	push RBP

	mov RAX,0
	mov RBX,0
	mov RCX,0

input:

	cmp RCX,5
	je start
	push RCX
	mov RAX,0
        mov RDI,fmt_put
	mov RSI,a
	call scanf
        mov RAX,[a]
	pop RCX
	mov [ara+RCX*8],RAX
	inc RCX
        jmp input

	
start:
	mov rcx,0

	mov RAX,0
        mov RDI,fmt_put
	mov RSI,a
	call scanf
        mov RAX,[a]

	push 0
	push 4
	push rax
	xor rax,rax

	call add_val
	
	mov rdi,fmt
	mov rsi,r9
	xor rax,rax
	call printf
	
	pop r11
	pop r11
	pop r11
	
	pop rbp
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov rcx,[rbp+16]  ;value of x
	mov rbx,[rbp+24]  ;value of high	
	mov r14,[rbp+32]  ;value of low
	
	cmp r14,rbx
	jg base_case

	mov r8,2

	mov rax,r14	
	add rax,rbx	
	
	mov rdx,0
	div r8

	cmp [ara+8*rax],rcx
	je got_it
	jl change_low
	
	dec rax
	push r14
	push rax
	push rcx
	xor rax,rax
	call add_val
	
	pop r11
	pop r11
	pop r11

	leave
	ret


change_low:
	inc rax
	push rax
	push rbx
	push rcx
	xor rax,rax
	call add_val

	pop r11
	pop r11
	pop r11
	leave 
	ret

got_it:
	mov r9,rax
	leave 
	ret

base_case:
	mov r9,-1
	leave
	ret
