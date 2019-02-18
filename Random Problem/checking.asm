
segment .data
a: resq 1
b: resq 1
c: resq 1
fmt: db "%d %d",0
fmt2: db "%d is large",10,0

segment .text

global main
extern scanf
extern printf

main:
push RBP
mov RDI, fmt
mov RSI,a
mov RDX,b
mov RAX,0
call scanf

pop RBP

push RBP
mov RDI,fmt2
mov RDI, fmt2
mov RAX, [a]
mov RBX, [b]
cmp RAX,RBX
jge PRAX
jmp LAST

PRAX:
mov RSI,RAX
call printf
mov RAX,0
mov RAX,0
pop RBP
ret

LAST:
mov RSI,RBX
call printf
mov RAX,0
mov RAX,0
pop RBP
ret
