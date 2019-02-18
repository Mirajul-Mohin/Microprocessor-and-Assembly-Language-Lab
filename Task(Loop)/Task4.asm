
segment .data
	scn: dq "%s",0
	equal: db "Equal",10 , 0
	notequal: db "Not Equal" , 10, 0


segment .bss
	string1: resb 100
	string2: resb 100
	value: resq 1
	string1_len: resq 1
	string2_len: resq 1

segment .text
	global main
	extern scanf
	extern printf

main:
	push RBP

	xor rax ,rax
	mov rdi , scn
	mov rsi , string1
	call scanf
	
	xor rax , rax
	mov rdi , scn
	mov rsi , string2
	call scanf

	xor rcx , rcx
	xor rbx , rbx

first_length:
	mov [string1_len] , rcx
	mov al , [string1+rcx]
	cmp al , 0
	je second_length
	mov rcx , [string1_len]
	inc rcx
	jmp first_length
second_length:
	mov [string2_len] , rbx
	mov al , [string2+rbx]
	cmp al , 0
	je equality
	mov rbx , [string2_len]
	inc rbx
	jmp second_length

equality:
	xor rax , rax
	mov rbx , [string1_len]
	mov rcx , [string2_len]
	cmp rbx , rcx
	jne print_notequal

	xor rcx , rcx
	
checking_loop:
	mov rcx , [value]
	mov al , [string1+rcx]
	mov bl , [string2+rcx]
	cmp al , bl
	jne print_notequal
	mov rcx, [value]
	inc rcx
	mov [value] , rcx
	cmp [string1_len] , rcx
	jne checking_loop
	
	xor rax, rax
	mov rdi , equal
	call printf
	jmp exit

print_notequal:
	xor rax, rax
	mov rdi , notequal
	call printf

	
exit:

	pop RBP
	ret
