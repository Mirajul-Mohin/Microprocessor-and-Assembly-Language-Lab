
segment .data
v:		dq 	0
c:		dq	0
d:		dq	128

fmt_in:		db	"%s",0
fmt:		db	"%d",10,0
fmt_out4:	db	"%s",10,0


segment .bss
array: resb 200


segment .text
global main
extern printf,scanf


main:
	xor rax,rax
	mov RDI,fmt_in
	mov rsi,array	
	call scanf

		
	
	mov RCX,0
	mov RBX,0

	lngth:
		mov AL, byte[array+RCX]		;finding the length
		inc RCX
		cmp AL,0
		jne lngth
		

		
	dec  RCX	;actual length

	push array
	push 0		;current positon
	push RCX	;length

	call add_val

	mov rdi,fmt_out4
	mov rsi,array
	xor rax,rax
	call printf
	pop r11
	pop r11
	pop r11
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov r10,[rbp+24]		;current position
	mov r11,[rbp+16]		;last position

	sub r11,r10 			;length - current
	dec r11				;position from the last

	cmp r10,r11			;current position > last position
	jg base_case

	
	mov AL,byte[array+r10]
	mov BL,byte[array+r11]		;swapping

	mov [array+r10],BL
	mov [array+r11],AL
	
	inc r10
	dec r11

	push array
	push r10
	push RCX
	
	call add_val

	pop r11
	pop r11
	pop r11
	

base_case:
	leave
	ret

	
