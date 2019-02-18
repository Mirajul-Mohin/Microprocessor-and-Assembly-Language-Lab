section     .text
global      _start                 ; Entry point for linker (ld)

  ; Linker entry point                                
_start:                                                         
    mov     rcx,len                ; Place length of message into rcx
    mov     rbp,msg                ; Place address of our msg into rbp    
    dec     rbp                    ; Adjust count to offset

  ; Go through the buffer and convert lowercase to uppercase characters:
upperScan:
    cmp byte [rbp+rcx],0x41        ; Test input char against uppercase 'A'                 
    jb lowerScan                   ; Not uppercase Ascii < 0x41 ('A') - jump below
    cmp byte [rbp+rcx],0x5A        ; Test input char against uppercase 'Z' 
    ja lowerScan                   ; Not uppercase Ascii > 0x5A ('Z') - jump above  
     ; At this point, we have a uppercase character
    add byte [rbp+rcx],0x20        ; Add 0x20 to get the lowercase Ascii value
    jmp Next                       ; Done, jump to next

lowerScan:
    cmp byte [rbp+rcx],0x61        ; Test input char against lowercase                 
    jb Next                        ; Not lowercase Ascii < 0x61 ('a') - jump below
    cmp byte [rbp+rcx],0x7A        ; Test input char against lowercase 'z'
    ja Next                        ; Not lowercase Ascii > 0x7A ('z') - jump below  
     ; At this point, we have a lowercase char
    sub byte [rbp+rcx],0x20        ; Subtract 0x20 to get the uppercase Ascii value
     ; Fall through to next        

Next:   
    dec rcx                        ; Decrement counter
    jnz upperScan                  ; If characters remain, loop back

  ; Write the buffer full of processed text to stdout:
Write:        
    mov     rbx,1                  ; File descriptor 1 (stdout)    
    mov     rax,4                  ; System call number (sys_write)
    mov     rcx,msg                ; Message to write        
    mov     rdx,len                ; Length of message to write
    int     0x80                   ; Call kernel interrupt
    mov     rax,1                  ; System call number (sys_exit)
    int     0x80                   ; Call kernel

section     .data

msg     db  'hELLO, wwwoRLD!',0xa  ; Our dear string
len     equ $ - msg                ; Length of our dear string

