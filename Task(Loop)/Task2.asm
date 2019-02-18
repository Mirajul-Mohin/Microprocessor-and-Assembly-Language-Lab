segment .data
	scn: dq "%s",0
	equal: db "Equal",10 , 0
	notequal: db "Not Equal" , 10, 0

	palin: dq "Palindrome",10 , 0
	nonPalin: dq "Nonpalindrome" , 10, 0
	prr: dq "",10,0
	


segment .bss
	string1: resb 100
	string2: resb 100
	value: resq 1
	l: resq 1
	r: resq 1
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
	

	xor rcx , rcx
	xor rbx , rbx

first_length:
	mov [string1_len] , rcx
	mov al , [string1+rcx]
	cmp al , 0
	je check
	
	cmp al , 96
	jg loop_con
	xor al , 20H
	mov [string1+rcx] , al
loop_con:
	mov rcx , [string1_len]
	inc rcx
	jmp first_length

check:
	xor rax , rax
	mov [l] , rax
	mov rax , [string1_len]
	dec rax
	mov [r] , rax


checking_loop:
	mov rcx , [l]
	mov rdx , [r]
	mov al , [string1+rcx]
	mov bl , [string1+rdx]
	cmp al , bl
	jne print_exit
	mov rcx , [l]
	mov rdx , [r]
	inc rcx
	dec rdx
	mov [l] , rcx
	mov [r] , rdx
	cmp rdx , rcx
	jge checking_loop
	
	xor rax ,rax
	mov rdi , palin
	call printf

	mov rdi , prr
	call printf
	pop RBP
	ret
print_exit:
	xor rax ,rax
	mov rdi , nonPalin
	call printf

	mov rdi, prr
	call printf
	pop RBP
	ret






