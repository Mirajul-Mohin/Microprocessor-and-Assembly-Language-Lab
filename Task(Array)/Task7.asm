
segment .data

no_of_vowels:		dq 	0
no_of_conso:		dq	0
d:		dq	128

cnt:		dq	0
fmt_in:		db	"%s",0
fmt		db	"%d",10,0
fmt_out1:	db	"Given input: %s",10,0
fmt_out4:	db	"Vowels: %lld ",0
fmt_out3:	db	"Consonants: %lld ",10,0


segment .bss
array resq 21


segment .text
global main
extern printf
extern scanf
extern gets


main:
	push RBP

	mov RDI,array	
	call gets	
	
	mov RCX,0
	mov RBX,0	

CNT:
	cmp [array+RCX],RBX
	jz Print
	
	mov AL,[array+RCX]	


	cmp AL,'A'
	jz vowels

	cmp AL,'E'
	jz vowels

	cmp AL,'I'
	jz vowels

	cmp AL,'O'
	jz vowels

	cmp AL,'U'
	jz vowels

	cmp AL,' '
	jnz consonant
	
	jmp increment

vowels:
	inc qword[no_of_vowels]
	jmp increment
	
consonant:
	inc qword[no_of_conso]
	
	
increment:
	inc RCX
	jmp CNT
	
Print:
	mov RDI,fmt_out1
	mov RSI,array
	call printf
	
	mov RBX,[no_of_vowels]
	add RBX,4
	mov RDI,fmt_out4
	mov RSI,RBX
	call printf
	
	xor RBX,RBX
	
	mov RBX,[no_of_conso]
	add RBX,6
	mov RDI,fmt_out3
	mov RSI,RBX
	call printf
	
	pop RBP
	ret
