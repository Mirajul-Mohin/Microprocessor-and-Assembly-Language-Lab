segment .data

a: dq 0
i: dq 0
tmp: dq 0


cnt: dq 0

fmt: dq "%lld ",10,0
fmt_put: dq "%lld",0

segment .bss
ara resq 21

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
	je reset
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
	

reset:
        mov RAX,0
        mov RCX,0
        mov R10,0

outer:
        cmp RCX,5
        jge zero
        mov [cnt],RCX
        mov R10,[ara+RCX*8]

inner:     
        inc RCX
        mov [tmp],RCX
        cmp RCX,5
        jge checker
        mov RCX,[tmp]
        cmp R10,[ara+RCX*8]
        jle inner
        mov RCX,[tmp]
        xchg R10,[ara+RCX*8]
        jmp inner

checker:
        mov RCX,[cnt]
        mov [ara+RCX*8],R10
        inc RCX
        jmp outer

zero:
        mov RAX,0
        mov RCX,0
        
print:
        cmp RCX,5
        je Finish
        mov RAX,[ara+RCX*8]
        inc RCX
        mov [cnt],RCX
        mov RDI,fmt
        mov RSI,RAX
        call printf
        mov RCX,[cnt]
        jmp print
        
        
Finish:        
        mov RAX,0
        pop RBP
        ret


