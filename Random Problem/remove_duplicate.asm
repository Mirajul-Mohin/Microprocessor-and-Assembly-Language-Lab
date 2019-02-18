;Task7(array)

segment .data

v:		dq 	0
c:		dq	0
d:		dq	128

cnt:		dq	0
fmt_in:		db	"%s",0
fmt		db	"%d",10,0
fmt_out1:	db	"Given input: %s",10,0
fmt_out4:	db	"Unique String: %s",10,0
fmt_out3:	db	"Consonants: %lld ",10,0


segment .bss
array: resb 200
st: resb 26


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
	push RCX
	call add_val


	mov rdi,fmt_out4
	mov rsi,st
	xor rax,rax
	call printf
	pop r11
	ret

add_val:
	push rbp
	mov rbp,rsp
	mov r10,[rbp+16]
	mov AL,byte[array+r10]
	cmp AL,0
	je base_case
	mov r8,0	
	call match
	inc r10
	push r10
	call add_val
	pop r11

base_case:
	leave
	ret
match: 
	cmp r8,rbx
	je unique
	cmp AL,[st+r8]
	je notunique
	inc r8
	jmp match

unique:
	mov [st+rbx],al
	inc rbx
	ret
notunique:
	ret
	
