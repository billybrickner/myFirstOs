%define tty_mode 0x0e
%define tty_print 0x10

; Test Secret Print
[org 0x7c00]
mov ah, tty_mode

; Attempt 1
mov al, "1"
int tty_print
mov al, the_secret
int tty_print

; Attempt 2
mov al, "2"
int tty_print
mov al, [the_secret]
int tty_print

; Attempt 3
mov al, "3"
int tty_print
mov bx, the_secret
add bx, 0x7C00
mov al, [bx]
int tty_print

; Attempt 4
mov al, "4"
int tty_print
mov al, [0x7c2d]
int tty_print

; Infinite loop
jmp $;

the_secret:
    db "X"

;Fill with 510 zeros, the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
