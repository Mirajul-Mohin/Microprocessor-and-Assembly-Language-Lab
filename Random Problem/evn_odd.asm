segment .data
a: resq 1
b: resq 1
c: resq 1
fmt: db "%d",0
fmt2: db "%d is even",10,0
fmt3: db "%d is odd",10,0

segment .text

global main
extern scanf
extern printf

main:
push RBP
mov RDI, fmt
mov RSI,a
mov RAX,0
call scanf
pop RBP

push RBP
mov RDX,0
mov RCX,1
mov RAX, [a]
mov RBX,2
div RBX
cmp RDX,RCX
je PRAX
jmp LAST

PRAX:
mov RDI,fmt3
mov RSI,[a]
call printf
mov RAX,0
pop RBP
ret

LAST:
mov RDI,fmt2
mov RSI,[a]
call printf
mov RAX,0
pop RBP
ret
