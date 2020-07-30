[org 0x7c00]

mov bx, HELLO
call print
call print_nl

mov bx, GOODBYE
call print
call print_nl

mov dx, 0x12fe
call print_hex

jmp $ ;trap

%include "../util/boot_sect_print.asm"
%include "../util/boot_sect_print_hex.asm"

; data
HELLO:
    db 'Hello World', 0

GOODBYE:
    db 'Goodbye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
