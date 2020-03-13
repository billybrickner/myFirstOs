; Print Hello
mov ah, 0x0e ; tty mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10

; Infinite loop
jmp $;

;Fill with 510 zeros, the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
