segment .data
fmt: db "Enter a lowercase letter: ", 0
fmt1: db "%c",0
fmt2: db "Uppercase letter: %c",10,0
ch1: db 16h

segment .text

global main
extern printf
extern scanf

main: 
push RBP

mov RDI, fmt
call printf

mov RDI, fmt1
mov RSI, ch1
call scanf

mov RDI, fmt2
mov RSI,[ch1]
sub RSI,20h
call printf

pop RBP
ret


