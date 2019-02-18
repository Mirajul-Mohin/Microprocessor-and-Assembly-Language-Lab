segment .data
fmt: db "%d %d %d",0
fmt2: db "The result is :%d",10,0
x: resq 1
y: resq 1
z: resq 1

segment .text

global main
extern printf
extern scanf

main: 
push RBP


mov RDI, fmt
mov RSI,x
mov RDX,y
mov RCX,z
mov RAX,0
call scanf

pop RBP

push RBP

mov RDI, fmt2
mov RSI,[x]
mov RCX,[y]
mov RAX,[z]

imul RSI,RCX
cqo
idiv RCX
add RSI,RAX
mov RAX,0
call printf


mov RAX,0
pop RBP
ret


