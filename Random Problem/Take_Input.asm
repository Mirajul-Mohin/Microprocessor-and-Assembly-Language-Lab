segment .data
Hello: db "Hello World", 0
fmt: db "%d %s",0
fmt2: db "%d %s",10,0
num: resq 1
st: resb 20

segment .text

global main
extern printf
extern scanf

main: 
push RBP


mov RDI, fmt
mov RSI,num
mov RDX,st
mov RAX,0
call scanf


mov RDI, fmt2
mov RSI,[num]
mov RDX,st
mov RAX,0
call printf


mov RAX,0
pop RBP
ret


