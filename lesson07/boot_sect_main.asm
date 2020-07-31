[org 0x7c00]
    ; setup the stack
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x9000
    mov dh, 2; read 2 sectors
    call disk_load

    mov dx, [0x9000] ; first word from the first sector
    call print_hex
    call print_nl

    mov dx, [0x9000 + 512] ; first word from the second sector
    call print_hex
    call print_nl
    jmp $

%include "../util/boot_sect_print.asm"
%include "../util/boot_sect_print_hex.asm"
%include "../util/boot_sect_disk.asm"

; Magic number
times 510 - ($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
