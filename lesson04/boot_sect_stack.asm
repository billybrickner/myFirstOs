%define tty_mode 0x0e
%define tty_print 0x10

mov ah, tty_mode

; Setup stack
mov bp, 0x8000
mov sp, bp ; initialize empty

push 'A'
push 'B'
push 'C'

; show stack top
mov al, [0x7ffe]
int tty_print

; attempt to access stack bottom
mov al, [0x8000]
int tty_print

; pop characters
; note: we only need a byte, not a word so the bx register is used as
; an intermediate
pop bx
mov al, bl
int tty_print

pop bx
mov al, bl
int tty_print

pop bx
mov al, bl
int tty_print

mov al, [0x8000]
int tty_print

; Infinite loop
jmp $

;Fill with 510 zeros, the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
