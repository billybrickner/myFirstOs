%define putc 0x0e
%define BIOSVid 0x10

; Test Secret Print
[org 0x7c00]
mov ah, putc

; Attempt 1
mov al, "1"
int BIOSVid
mov al, the_secret
int BIOSVid

; Attempt 2
mov al, "2"
int BIOSVid
mov al, [the_secret]
int BIOSVid

; Attempt 3
mov al, "3"
int BIOSVid
mov bx, the_secret
add bx, 0x7C00
mov al, [bx]
int BIOSVid

; Attempt 4
mov al, "4"
int BIOSVid
mov al, [0x7c2d]
int BIOSVid

; Infinite loop
jmp $;

the_secret:
    db "X"

;Fill with 510 zeros, the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
