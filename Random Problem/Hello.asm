segment .data
Hello: db "Hello World", 0
fmt: db "%s", 10 , 0

segment .text

global main
extern printf

main: 
push RBP

mov RDI, fmt
mov RSI, Hello
mov RAX,0
call printf

mov RAX, 0
pop RBP
ret


